@echo off
echo.
echo ========================================
echo BSICARDS PHP SDK - GitHub Push Script
echo ========================================
echo.

REM Get credentials
set /p GITHUB_USER="Enter your GitHub username: "
set /p GITHUB_TOKEN="Enter your Personal Access Token: "

echo.
echo Pushing to GitHub...
echo.

cd /d D:\BSI\SDK\PHP

REM Configure Git
git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"

REM Set main branch
git branch -M main

REM Remove old remote if exists
git remote remove origin 2>nul

REM Add remote with credentials
git remote add origin https://%GITHUB_TOKEN%@github.com/%GITHUB_USER%/bsicards-php-sdk.git

REM Push to GitHub
git push -u origin main --force

REM Create and push tag
git tag -a v1.0.0 -m "Release version 1.0.0" 2>nul
git push origin v1.0.0 --force 2>nul

echo.
echo ========================================
echo SUCCESS! Code pushed to GitHub
echo ========================================
echo.
echo Repository: https://github.com/%GITHUB_USER%/bsicards-php-sdk
echo.
echo Next steps:
echo 1. Visit your repository on GitHub
echo 2. Register on Packagist: https://packagist.org
echo.

pause

