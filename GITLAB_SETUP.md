# GitLab Setup — One-Time Steps
**Do this once. After that, everything is automatic.**

---

## What you'll have when done
- Dashboard lives at: `https://jennifer-denton.gitlab.io/moxie-dashboard/`
- Every weekday at 5 PM, Claude auto-saves and pushes the latest version
- Miki can open that URL anytime and see your current dashboard

---

## Step 1 — Create a free GitLab account
Go to https://gitlab.com and sign up (or log in if you have one).
Use username: `jennifer-denton` (or whatever you prefer — update the URL above to match).

## Step 2 — Create a new project
1. Click **New project → Create blank project**
2. Name it: `moxie-dashboard`
3. Set visibility to **Private** (Miki will access via a direct share, not public)
4. Click **Create project**

## Step 3 — Create a Personal Access Token
1. In GitLab, go to your avatar (top right) → **Edit profile → Access Tokens**
2. Click **Add new token**
3. Name: `dashboard-push`
4. Expiration: set to 1 year from today
5. Scopes: check **write_repository**
6. Click **Create personal access token**
7. **Copy the token now** — you won't see it again

## Step 4 — Connect your local folder to GitLab
Open **Terminal** on your Mac and run these commands (replace YOUR_USERNAME and YOUR_TOKEN):

```bash
cd ~/Projects
git remote add origin https://YOUR_USERNAME:YOUR_TOKEN@gitlab.com/YOUR_USERNAME/moxie-dashboard.git
git add jennifer-todo-dashboard.html .gitlab-ci.yml .gitignore push-to-gitlab.sh
git commit -m "Initial dashboard — Jennifer Denton strategy board"
git push -u origin main
```

## Step 5 — Enable GitLab Pages
1. In your GitLab project, go to **Settings → General → Visibility**
2. Under **Pages**, set to **Everyone** (so Miki can access the URL)
3. The first pipeline will run automatically after your push and deploy the page

## Step 6 — Share the URL with Miki
Once the first pipeline completes (takes ~2 minutes):
- Your dashboard is live at: `https://YOUR_USERNAME.gitlab.io/moxie-dashboard/`
- Send Miki that link — she can bookmark it and refresh anytime to see updates

---

## After setup — daily flow
| Time | What happens |
|------|-------------|
| 8 AM | Claude pulls fresh Slack + Notion data → updates your local dashboard |
| 2 PM | Second refresh with any afternoon updates |
| 5 PM | Claude commits + pushes to GitLab → Miki sees latest version |

You never have to do anything manually. Just open your dashboard locally to use it,
and Miki gets the same view via her URL.

---

## Storing your token securely (optional but recommended)
Instead of embedding the token in the git remote URL, you can use macOS Keychain:

```bash
git config --global credential.helper osxkeychain
# Then run any git push — it will prompt once and save to Keychain
```

---

## Questions?
Ask Claude: "Push my dashboard to GitLab" or "Check if my GitLab push is working"
