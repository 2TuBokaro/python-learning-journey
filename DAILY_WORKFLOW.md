# Daily Workflow for Python Development

## Simple Daily Routine

This guide explains your daily workflow in simple terms. Both your Python projects are now designed to work reliably every day without dependency issues.

## 🎯 What You Need to Know

### Two Projects, Two Purposes

1. **Python Learning Journey** (`C:\MyJScode`)
   - For learning Python, data science, Jupyter notebooks
   - Opens Jupyter Lab in your browser
   - Contains 775+ learning files

2. **Python Web Projects** (`C:\MyWebDev`)
   - For building web applications with FastAPI
   - Creates APIs and web services
   - Ready for deployment to any platform

### Why This Setup Never Breaks

**Docker Containers (Recommended):**
- ✅ Every dependency is frozen in time - exact versions
- ✅ Works identically every single day
- ✅ Updates won't break your code
- ✅ Works even if your system Python changes

**Virtual Environment Fallback:**
- ✅ Backup option if Docker has issues
- ✅ Still uses exact dependency versions
- ✅ Isolated from system Python

## 📅 Your Daily Workflow

### Step 1: Start Docker Desktop (Once per day)

1. Open Docker Desktop application
2. Wait for it to say "Docker Desktop is running"
3. That's it - do this once when you start your computer

### Step 2: Choose Your Project

#### For Python Learning (Jupyter Notebooks)

**Option A: Use Docker (Recommended)**
1. Double-click "Python Learning Journey" desktop shortcut
2. Wait 10-15 minutes for first build (subsequent starts are much faster)
3. Jupyter Lab opens automatically in your browser
4. Start learning!

**Option B: Use Virtual Environment (If Docker fails)**
1. Open PowerShell in `C:\MyJScode`
2. Run: `.\setup-venv.ps1` (only needed once)
3. Run: `.\venv\Scripts\Activate.ps1`
4. Run: `jupyter lab`
5. Jupyter Lab opens in your browser

#### For Web Development (FastAPI)

**Option A: Use Docker (Recommended)**
1. Double-click "Python Web Projects" desktop shortcut
2. Wait 30-60 seconds for it to start
3. API documentation opens automatically in your browser
4. Start building web apps!

**Option B: Use Virtual Environment (If Docker fails)**
1. Open PowerShell in `C:\MyWebDev`
2. Run: `.\setup-venv.ps1` (only needed once)
3. Run: `.\venv\Scripts\Activate.ps1`
4. Run: `uvicorn api.index:app --reload`
5. API runs at http://localhost:8000

### Step 3: Stop When Done

**For Docker:**
1. Open PowerShell in the project folder
2. Run: `docker-compose down`
3. Containers stop cleanly

**For Virtual Environment:**
1. Run: `deactivate`
2. Environment stops

## 🔧 Common Tasks

### Updating Dependencies (Rarely Needed)

**You almost never need to do this** because versions are pinned.

**If you MUST update:**
1. Edit `requirements.txt` with new versions
2. Run: `docker-compose up -d --build` (Docker)
3. Or: `pip install -r requirements.txt` (Virtual Environment)

### Starting Fresh

**If something seems wrong:**
1. Stop containers: `docker-compose down`
2. Remove containers: `docker-compose down -v`
3. Start fresh: `docker-compose up -d --build`

### Checking Dependencies

**See what's installed:**
- Docker: Dependencies are in Dockerfile/requirements.txt
- Virtual Environment: Run `pip list`

## 🚨 Troubleshooting

### Docker Won't Start

**Problem:** Docker Desktop not running
**Solution:** Start Docker Desktop and wait for it to be ready

**Problem:** Container fails to start
**Solution:** Use virtual environment fallback (see above)

### Port Already in Use

**Problem:** "Port 8888 is already in use" (Learning)
**Solution:** Stop other containers first with `docker-compose down`

**Problem:** "Port 8000 is already in use" (Web Dev)
**Solution:** Stop other containers first with `docker-compose down`

### Virtual Environment Issues

**Problem:** Can't activate virtual environment
**Solution:** Run `python -m venv venv` to recreate it

**Problem:** Dependencies not found
**Solution:** Run `pip install -r requirements.txt`

## 📋 Quick Reference Card

### Python Learning Journey

| Task | Command |
|------|---------|
| Start (Docker) | Double-click shortcut or `docker-compose up -d` |
| Start (Venv) | `.\venv\Scripts\Activate.ps1` then `jupyter lab` |
| Stop (Docker) | `docker-compose down` |
| Stop (Venv) | `deactivate` |
| URL | http://localhost:8888 |

### Python Web Projects

| Task | Command |
|------|---------|
| Start (Docker) | Double-click shortcut or `docker-compose up -d` |
| Start (Venv) | `.\venv\Scripts\Activate.ps1` then `uvicorn api.index:app --reload` |
| Stop (Docker) | `docker-compose down` |
| Stop (Venv) | `deactivate` |
| URL | http://localhost:8000 |
| API Docs | http://localhost:8000/docs |

## 💡 Pro Tips

1. **Always use Docker first** - it's more reliable
2. **Keep Docker Desktop running** - faster startup next time
3. **Don't edit requirements.txt unless necessary** - prevents breakage
4. **Use the desktop shortcuts** - they handle everything automatically
5. **If something breaks, use virtual environment** - it's your backup

## 🎉 What You've Achieved

- ✅ **Stable Development** - No more dependency surprises
- ✅ **Backup Options** - Docker + Virtual Environment
- ✅ **Simple Workflow** - Just click shortcuts
- ✅ **Always Works** - Frozen versions prevent breakage
- ✅ **Easy Recovery** - Clear troubleshooting steps

## 📞 Getting Help

If something really doesn't work:
1. Check Docker Desktop is running
2. Try the virtual environment fallback
3. Look at error messages - they usually tell you what's wrong
4. Try stopping and starting fresh with `docker-compose down -v`

---

**Remember:** The whole point of this setup is that it works consistently every day. You shouldn't need to think about dependencies or updates - just use the shortcuts and start coding!