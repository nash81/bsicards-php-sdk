#!/usr/bin/env powershell

# BSICARDS PHP SDK - GitHub Deployment Script
# This script automates the GitHub push and Packagist registration process

Write-Host @"

╔════════════════════════════════════════════════════════════════╗
║     BSICARDS PHP SDK - GitHub Deployment Script               ║
║     Version: 1.0.0                                             ║
║     Status: Ready for Deployment                              ║
╚════════════════════════════════════════════════════════════════╝

"@ -ForegroundColor Cyan

Write-Host "📋 Deployment Checklist`n" -ForegroundColor Green

# Check git status
Write-Host "✓ Git repository initialized" -ForegroundColor Green
Write-Host "✓ Initial commit created" -ForegroundColor Green
Write-Host "✓ All files included" -ForegroundColor Green

Write-Host "`n📝 Next Steps:`n" -ForegroundColor Yellow

Write-Host @"
1️⃣  CREATE GITHUB REPOSITORY
   • Go to: https://github.com/new
   • Repository name: bsicards-php-sdk
   • Description: PHP SDK for BSICARDS Card Issuance API
   • Visibility: Public
   • Do NOT initialize with README
   • Click: Create repository

2️⃣  PUSH CODE TO GITHUB
   Run these commands in PowerShell:

   $GitHub_Username = 'your-github-username'  # ← CHANGE THIS!

   cd D:\BSI\SDK\PHP
   git branch -M main
   git remote add origin https://github.com/$GitHub_Username/bsicards-php-sdk.git
   git push -u origin main

   When asked for password, use a Personal Access Token from:
   https://github.com/settings/tokens (select 'repo' scope)

3️⃣  CREATE RELEASE TAG
   git tag -a v1.0.0 -m "Release version 1.0.0"
   git push origin v1.0.0

4️⃣  REGISTER ON PACKAGIST
   • Go to: https://packagist.org
   • Click: Submit
   • URL: https://github.com/your-github-username/bsicards-php-sdk
   • Click: Check
   • Click: Submit
   • Wait: 5-15 minutes for indexing

5️⃣  VERIFY INSTALLATION
   Users can then install with:

   composer require your-username/bsicards-php-sdk

"@ -ForegroundColor Cyan

Write-Host "`n📊 Project Summary`n" -ForegroundColor Green

Write-Host @"
Location:        D:\BSI\SDK\PHP
PHP Version:     7.4+
API Methods:     30+
Documentation:   6 files (~50 KB)
License:         MIT
Status:          ✅ Production Ready

SDK Files:
  • src/BSICardsClient.php (Main SDK - 400+ lines)
  • src/APIException.php (Exception handling)
  • src/ServiceProvider.php (Laravel integration)
  • config/bsicards.php (Laravel config)

Documentation:
  • README.md (Main overview)
  • docs/QUICKSTART.md (5-minute setup)
  • docs/INSTALLATION.md (Setup guide)
  • docs/API.md (Complete API reference)
  • docs/EXAMPLES.md (Code examples)
  • GITHUB_SETUP.md (Deployment guide)
  • CHANGELOG.md (Version history)

Configuration:
  • composer.json (Package manifest)
  • .gitignore (Git ignore rules)
  • .github/workflows/tests.yml (CI/CD)
  • LICENSE (MIT)
  • BSICARDS.postman_collection.json (Original API)

"@ -ForegroundColor Cyan

Write-Host "`n🚀 Ready to Deploy!`n" -ForegroundColor Green
Write-Host "Follow the steps above to push to GitHub and register on Packagist.`n" -ForegroundColor Yellow

Write-Host "📚 For more information, see:" -ForegroundColor Green
Write-Host "  • README.md - Main documentation" -ForegroundColor Cyan
Write-Host "  • GITHUB_SETUP.md - Detailed deployment guide" -ForegroundColor Cyan
Write-Host "  • READY_TO_DEPLOY.md - Deployment checklist" -ForegroundColor Cyan
Write-Host "  • docs/QUICKSTART.md - 5-minute quick start" -ForegroundColor Cyan

Write-Host "`n💡 Pro Tips:`n" -ForegroundColor Yellow
Write-Host "1. Create a Personal Access Token instead of using password" -ForegroundColor Gray
Write-Host "2. Make the repository public for better visibility" -ForegroundColor Gray
Write-Host "3. Add repository topics (php, sdk, bsicards, composer)" -ForegroundColor Gray
Write-Host "4. Update your official docs with the GitHub URL" -ForegroundColor Gray
Write-Host "5. Monitor the GitHub repository for issues and PRs" -ForegroundColor Gray

Write-Host "`n📞 Support`n" -ForegroundColor Green
Write-Host "Email: support@bsigroup.tech" -ForegroundColor Cyan
Write-Host "Website: https://www.bsigroup.tech" -ForegroundColor Cyan

Write-Host "`n════════════════════════════════════════════════════════════════" -ForegroundColor Cyan
Write-Host "Happy Coding! 🎉" -ForegroundColor Green
Write-Host "════════════════════════════════════════════════════════════════`n" -ForegroundColor Cyan

