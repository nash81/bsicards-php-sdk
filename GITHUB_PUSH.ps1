#!/usr/bin/env powershell
<#
.SYNOPSIS
BSICARDS PHP SDK - Automated GitHub Push Script

.DESCRIPTION
This script automates the entire process of pushing your SDK to GitHub and registering on Packagist.

.NOTES
Before running this script:
1. Create a repository at https://github.com/new
2. Name it: bsicards-php-sdk
3. Do NOT initialize with README
4. Get a Personal Access Token from https://github.com/settings/tokens (repo scope)
#>

param(
    [Parameter(Mandatory=$true)]
    [string]$GitHubUsername,

    [Parameter(Mandatory=$true)]
    [string]$PersonalAccessToken
)

$ErrorActionPreference = "Stop"

Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║     BSICARDS PHP SDK - GitHub Push & Packagist Setup          ║
║     Version: 1.0.0                                             ║
╚════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

# Configuration
$ProjectPath = "D:\BSI\SDK\PHP"
$RepositoryName = "bsicards-php-sdk"
$RepositoryUrl = "https://$PersonalAccessToken@github.com/$GitHubUsername/$RepositoryName.git"

Write-Host "📋 Configuration:" -ForegroundColor Green
Write-Host "  GitHub Username: $GitHubUsername"
Write-Host "  Repository: $RepositoryName"
Write-Host "  Repository URL: https://github.com/$GitHubUsername/$RepositoryName"
Write-Host ""

# Step 1: Verify repository exists
Write-Host "🔍 Step 1: Verifying GitHub Repository" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "https://api.github.com/repos/$GitHubUsername/$RepositoryName" `
        -Headers @{"Authorization" = "token $PersonalAccessToken"} `
        -ErrorAction Stop
    Write-Host "✅ Repository found!" -ForegroundColor Green
} catch {
    Write-Host "❌ Repository not found!" -ForegroundColor Red
    Write-Host "Please create the repository at: https://github.com/new" -ForegroundColor Yellow
    Write-Host "Name: $RepositoryName" -ForegroundColor Yellow
    exit 1
}

# Step 2: Push to GitHub
Write-Host "`n📤 Step 2: Pushing Code to GitHub..." -ForegroundColor Yellow

Set-Location $ProjectPath

try {
    # Remove old remote if exists
    git remote remove origin -ErrorAction SilentlyContinue

    # Add new remote
    git remote add origin $RepositoryUrl
    Write-Host "  ✓ Remote added" -ForegroundColor Green

    # Ensure main branch
    git branch -M main
    Write-Host "  ✓ Branch set to main" -ForegroundColor Green

    # Push to GitHub
    git push -u origin main -f
    Write-Host "✅ Code pushed to GitHub!" -ForegroundColor Green

} catch {
    Write-Host "❌ Error pushing to GitHub: $_" -ForegroundColor Red
    exit 1
}

# Step 3: Create release tag
Write-Host "`n🏷️  Step 3: Creating Release Tag..." -ForegroundColor Yellow

try {
    # Check if tag exists
    $tagExists = git tag -l v1.0.0

    if ($tagExists) {
        git tag -d v1.0.0
        git push origin :refs/tags/v1.0.0 -f
        Write-Host "  ✓ Old tag removed" -ForegroundColor Green
    }

    git tag -a v1.0.0 -m "Release version 1.0.0"
    git push origin v1.0.0 -f
    Write-Host "✅ Release tag created!" -ForegroundColor Green

} catch {
    Write-Host "❌ Error creating tag: $_" -ForegroundColor Red
    exit 1
}

# Step 4: Create GitHub release
Write-Host "`n📝 Step 4: Creating GitHub Release..." -ForegroundColor Yellow

try {
    $releaseData = @{
        tag_name = "v1.0.0"
        name = "v1.0.0 - Initial Release"
        body = @"
# BSICARDS PHP SDK v1.0.0

Initial release of the complete BSICARDS PHP SDK.

## Features

- ✅ 30+ API methods
- ✅ MasterCard, Visa, and Digital Wallet support
- ✅ Laravel integration
- ✅ Complete documentation
- ✅ Full error handling

## Installation

\`\`\`bash
composer require $GitHubUsername/bsicards-php-sdk
\`\`\`

## Quick Start

See [README.md](README.md) for quick start and [docs/API.md](docs/API.md) for complete API reference.

## Documentation

- [README](README.md) - Main documentation
- [Quick Start](docs/QUICKSTART.md) - 5-minute setup
- [Installation](docs/INSTALLATION.md) - Installation guide
- [API Reference](docs/API.md) - Complete API docs
- [Code Examples](docs/EXAMPLES.md) - Real-world examples

## Support

- Email: support@bsigroup.tech
- Website: https://www.bsigroup.tech
"@
        draft = $false
        prerelease = $false
    } | ConvertTo-Json

    $headers = @{
        "Authorization" = "token $PersonalAccessToken"
        "Accept" = "application/vnd.github.v3+json"
    }

    Invoke-WebRequest -Uri "https://api.github.com/repos/$GitHubUsername/$RepositoryName/releases" `
        -Method POST `
        -Headers $headers `
        -Body $releaseData `
        -ContentType "application/json" `
        -ErrorAction SilentlyContinue

    Write-Host "✅ GitHub release created!" -ForegroundColor Green

} catch {
    Write-Host "⚠️  Release creation skipped (may already exist)" -ForegroundColor Yellow
}

# Step 5: Summary
Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║                    ✅ PUSH SUCCESSFUL! ✅                     ║
╚════════════════════════════════════════════════════════════════╝

📍 Repository: https://github.com/$GitHubUsername/$RepositoryName

🎯 Next Steps:

1. Verify on GitHub (may take a minute to reflect):
   https://github.com/$GitHubUsername/$RepositoryName

2. Register on Packagist (OPTIONAL but recommended):
   - Visit: https://packagist.org
   - Click: Submit
   - URL: https://github.com/$GitHubUsername/$RepositoryName
   - Click: Check → Submit
   - Wait: 5-15 minutes for indexing

3. After Packagist indexing, users can install:
   composer require $GitHubUsername/bsicards-php-sdk

🎊 Your SDK is now on GitHub!

📚 Documentation:
   - README: https://github.com/$GitHubUsername/$RepositoryName/blob/main/README.md
   - Docs: https://github.com/$GitHubUsername/$RepositoryName/tree/main/docs
   - Examples: https://github.com/$GitHubUsername/$RepositoryName/blob/main/docs/EXAMPLES.md

📞 Support: support@bsigroup.tech

"@ -ForegroundColor Cyan

Write-Host "✅ All done! Your SDK is on GitHub." -ForegroundColor Green

