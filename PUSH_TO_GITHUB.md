# How to Push to GitHub - Step by Step

## Prerequisites

1. GitHub account (https://github.com)
2. Personal Access Token (https://github.com/settings/tokens)
   - Click "Generate new token"
   - Select `repo` scope
   - Copy the token

## Method 1: Using the Automated Script (Easiest)

### Step 1: Run the PowerShell Script

Open PowerShell and run:

```powershell
cd D:\BSI\SDK\PHP
.\GITHUB_PUSH.ps1 -GitHubUsername "your-username" -PersonalAccessToken "your_token_here"
```

Replace:
- `your-username` with your GitHub username
- `your_token_here` with your Personal Access Token

### That's it!
The script will:
1. Verify your GitHub repository exists
2. Push all code to GitHub
3. Create v1.0.0 release tag
4. Create a GitHub release
5. Show you next steps

---

## Method 2: Manual Steps (If Script Doesn't Work)

### Step 1: Create GitHub Repository

1. Go to https://github.com/new
2. Repository name: `bsicards-php-sdk`
3. Description: `PHP SDK for BSICARDS Card Issuance API`
4. Visibility: **Public**
5. Initialize: **None** (unchecked)
6. Click **Create repository**

### Step 2: Get Your Token

1. Go to https://github.com/settings/tokens
2. Click **Generate new token** (classic)
3. Name: `bsicards-sdk`
4. Check: `repo` scope
5. Click **Generate token**
6. **Copy the token** (you won't see it again!)

### Step 3: Push Code (Open PowerShell)

```powershell
$GitHubUser = "your-username"
$Token = "your-token-here"

cd D:\BSI\SDK\PHP

# Configure Git
git config user.email "support@bsigroup.tech"
git config user.name "BSI Group"

# Set main branch
git branch -M main

# Add remote
git remote add origin "https://${Token}@github.com/${GitHubUser}/bsicards-php-sdk.git"

# Push to GitHub
git push -u origin main

# Create and push tag
git tag -a v1.0.0 -m "Release version 1.0.0"
git push origin v1.0.0
```

### Step 4: Verify on GitHub

Visit: https://github.com/YOUR_USERNAME/bsicards-php-sdk

You should see all your files!

---

## Method 3: Using Git GUI (Visual)

If you prefer a graphical interface:

1. Install **GitHub Desktop** from https://desktop.github.com
2. Create new repository locally (skip, we have one)
3. Add existing repository: Choose `D:\BSI\SDK\PHP`
4. Click **Publish repository**
5. Sign in to GitHub
6. Name: `bsicards-php-sdk`
7. Click **Publish**

---

## After Push: Register on Packagist (Optional)

To make your package installable via Composer:

1. Go to https://packagist.org
2. Click **Submit**
3. URL: `https://github.com/YOUR_USERNAME/bsicards-php-sdk`
4. Click **Check**
5. Click **Submit**
6. Wait 5-15 minutes

Then users can install:
```bash
composer require your-username/bsicards-php-sdk
```

---

## Troubleshooting

### "Repository not found"
- Make sure you created the repository on GitHub
- Check the spelling of your username
- Verify the repository is public

### "Authentication failed"
- Check your Personal Access Token is correct
- Token must have `repo` scope
- Token may have expired (create a new one)

### "Remote already exists"
```powershell
git remote remove origin
# Then run the git remote add command again
```

### "Permission denied (publickey)"
- You're using SSH instead of HTTPS
- Use the HTTPS URL with token instead
- Or set up SSH keys: https://docs.github.com/en/authentication/connecting-to-github-with-ssh

---

## What Gets Pushed?

✅ All source code (src/)
✅ All documentation (docs/)
✅ Configuration files (composer.json, .gitignore, etc.)
✅ GitHub Actions CI/CD (.github/)
✅ License file
✅ Changelog
✅ Original Postman collection

---

## Next Steps After Push

1. **Verify Repository**
   - Visit https://github.com/YOUR_USERNAME/bsicards-php-sdk
   - Check all files are there

2. **Register on Packagist** (Optional)
   - Makes it installable via Composer
   - Visit https://packagist.org
   - Follow "After Push: Register on Packagist" section above

3. **Update Official Documentation**
   - Link to your GitHub repository
   - Add installation instructions
   - Include support contact

---

## Questions?

- Email: support@bsigroup.tech
- GitHub Docs: https://docs.github.com
- Packagist Guide: https://packagist.org/about

