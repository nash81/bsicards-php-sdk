# GitHub Repository & Packaging Guide

## Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Fill in the repository details:
   - **Repository name**: `bsicards-php-sdk`
   - **Description**: PHP SDK for BSICARDS Card Issuance API
   - **Visibility**: Public (or Private if preferred)
   - **Initialize with**: Leave unchecked (we have files already)
3. Click **Create repository**

## Step 2: Push Code to GitHub

### Option A: Using HTTPS (Simpler)

```bash
cd D:\BSI\SDK\PHP
git init
git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"
git add .
git commit -m "Initial commit: BSICARDS PHP SDK v1.0.0"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/bsicards-php-sdk.git
git push -u origin main
```

You'll be prompted for GitHub credentials. Use:
- Username: your GitHub username
- Password: Personal access token (from https://github.com/settings/tokens)

### Option B: Using SSH (More Secure)

First, set up SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh

Then:

```bash
cd D:\BSI\SDK\PHP
git init
git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"
git add .
git commit -m "Initial commit: BSICARDS PHP SDK v1.0.0"
git branch -M main
git remote add origin git@github.com:YOUR_USERNAME/bsicards-php-sdk.git
git push -u origin main
```

## Step 3: Create Release Tag

```bash
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

## Step 4: Create GitHub Release

1. Go to your repository: https://github.com/YOUR_USERNAME/bsicards-php-sdk
2. Click **Releases** on the right side
3. Click **Draft a new release**
4. Select tag: **v1.0.0**
5. Title: **v1.0.0 - Initial Release**
6. Description:
   ```
   # BSICARDS PHP SDK v1.0.0

   Initial release of the BSICARDS PHP SDK with full support for:

   - MasterCard issuance and management
   - Visa card issuance and management
   - Digital Wallet card creation
   - Card management (freeze, unfreeze, PIN change)
   - Card funding and transaction history
   - Laravel 5.5+ integration
   - Full documentation and examples

   ## Installation

   ```bash
   composer require bsigroup/bsicards-sdk
   ```

   ## Documentation

   - [README](README.md)
   - [Installation Guide](docs/INSTALLATION.md)
   - [API Documentation](docs/API.md)
   - [Code Examples](docs/EXAMPLES.md)
   ```

7. Click **Publish release**

## Step 5: Register on Packagist

1. Go to https://packagist.org
2. Click **Submit**
3. Enter your GitHub repository URL: `https://github.com/YOUR_USERNAME/bsicards-php-sdk`
4. Click **Check**
5. Click **Submit**

Wait 5-15 minutes for indexing. Then users can install with:

```bash
composer require your-username/bsicards-php-sdk
```

## Step 6: Configure GitHub Pages (Optional)

To host documentation:

1. Go to your repository Settings
2. Scroll to **Pages**
3. Source: **main** branch, **/docs** folder
4. Click **Save**

Your documentation will be at: `https://YOUR_USERNAME.github.io/bsicards-php-sdk/`

## Step 7: Add Repository Topics

In your repository's About section, add topics:
- `php`
- `sdk`
- `api`
- `bsicards`
- `composer`
- `cards`
- `mastercard`
- `visa`

## Step 8: Update README Links (Optional)

If you want to point to the GitHub repository in your official documentation:

```markdown
## Installation

```bash
composer require your-username/bsicards-php-sdk
```

**GitHub Repository**: https://github.com/YOUR_USERNAME/bsicards-php-sdk
**Documentation**: [Full Documentation](docs/)
```

## Verify Everything Works

1. Visit your repository: https://github.com/YOUR_USERNAME/bsicards-php-sdk
2. Check that all files are there
3. Verify the README is displayed
4. Check the release is created
5. Wait for Packagist indexing
6. Test composer install:

```bash
composer require your-username/bsicards-php-sdk
```

## Common Issues

### "Repository not found"

- Ensure you created the repository
- Use the correct HTTPS or SSH URL
- Check your credentials

### Packagist "Repository could not be accessed"

- Ensure repository is public
- Wait a few minutes and try again
- Check GitHub permissions

### GitHub Actions tests failing

- Check that PHP and dependencies are correct
- Review the test workflow in `.github/workflows/tests.yml`
- Check the Composer configuration in `composer.json`

## Next Steps

1. Monitor repository for issues
2. Keep documentation updated
3. Process pull requests
4. Release new versions as needed
5. Monitor Composer downloads

## Useful Links

- GitHub Docs: https://docs.github.com
- Packagist Guide: https://packagist.org/about
- Composer Documentation: https://getcomposer.org/doc/
- Git Documentation: https://git-scm.com/doc

---

**Replace `YOUR_USERNAME` with your actual GitHub username throughout these instructions.**

