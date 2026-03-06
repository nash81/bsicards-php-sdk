# SIMPLE PUSH SCRIPT
# Save your credentials here and run this file

# STEP 1: REPLACE THESE WITH YOUR CREDENTIALS
$GitHubUsername = "YOUR_GITHUB_USERNAME_HERE"
$GitHubToken = "YOUR_PERSONAL_ACCESS_TOKEN_HERE"

# STEP 2: Just run this script (no need to edit below)
cd D:\BSI\SDK\PHP

Write-Host "Pushing to GitHub..." -ForegroundColor Yellow

git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"
git branch -M main
git remote remove origin 2>$null
git remote add origin "https://$GitHubToken@github.com/$GitHubUsername/bsicards-php-sdk.git"

Write-Host "Pushing code..." -ForegroundColor Yellow
git push -u origin main --force

Write-Host "Creating release tag..." -ForegroundColor Yellow
git tag -a v1.0.0 -m "Release version 1.0.0" -f
git push origin v1.0.0 --force

Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "SUCCESS! ✅" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host ""
Write-Host "Your repository: https://github.com/$GitHubUsername/bsicards-php-sdk" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor Yellow
Write-Host "1. Visit: https://github.com/$GitHubUsername/bsicards-php-sdk" -ForegroundColor White
Write-Host "2. Register on Packagist: https://packagist.org" -ForegroundColor White
Write-Host "3. Submit URL: https://github.com/$GitHubUsername/bsicards-php-sdk" -ForegroundColor White
Write-Host ""

