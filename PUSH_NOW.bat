@echo off
cls
echo.
echo ================================================================
echo       BSICARDS PHP SDK - GitHub Push Utility
echo ================================================================
echo.
echo This script will push your SDK to GitHub.
echo You'll need:
echo   1. Your GitHub username
echo   2. Your Personal Access Token (from github.com/settings/tokens)
echo.
echo ================================================================
echo.

set /p USERNAME="Enter your GitHub username: "
set /p TOKEN="Enter your Personal Access Token: "

echo.
echo ================================================================
echo Starting push to GitHub...
echo ================================================================
echo.

cd /d "D:\BSI\SDK\PHP"

echo [1/6] Configuring Git...
git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"

echo [2/6] Setting main branch...
git branch -M main

echo [3/6] Configuring remote repository...
git remote remove origin 2>nul
git remote add origin https://%TOKEN%@github.com/%USERNAME%/bsicards-php-sdk.git

echo [4/6] Pushing code to GitHub...
git push -u origin main --force

echo [5/6] Creating release tag v1.0.0...
git tag -f -a v1.0.0 -m "Release version 1.0.0"
git push -f origin v1.0.0

echo [6/6] Done!
echo.
echo ================================================================
echo                    SUCCESS! ^_^
echo ================================================================
echo.
echo Your repository is now live at:
echo https://github.com/%USERNAME%/bsicards-php-sdk
echo.
echo Next steps:
echo 1. Visit the URL above to view your repository
echo 2. Optional: Register on Packagist (https://packagist.org)
echo    Submit URL: https://github.com/%USERNAME%/bsicards-php-sdk
echo.
echo ================================================================
echo.

pause

