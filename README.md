# Python Learning Journey

This repository contains my Python learning materials, Jupyter notebooks, and development environment setup using Docker.

## 🐳 Docker Setup

### Prerequisites
- Docker Desktop installed and running
- Git installed

### Quick Start

1. **Start the container:**
   ```bash
   docker-compose up -d --build
   ```

2. **Access Jupyter Lab:**
   Open your browser and navigate to: `http://localhost:8888`

3. **Stop the container:**
   ```bash
   docker-compose down
   ```

## 📦 Python Packages

This environment includes:
- **Web Frameworks**: Flask, Django, FastAPI
- **Data Science**: NumPy, Pandas, Matplotlib, Seaborn, Scikit-learn
- **Jupyter**: Jupyter Lab, IPython Kernel
- **Utilities**: Requests, BeautifulSoup, SQLAlchemy

## 📁 Repository Structure

- `notebooks/` - Jupyter notebooks for learning
- `scripts/` - Python scripts
- `data/` - Dataset files
- `Dockerfile` - Container configuration
- `docker-compose.yml` - Container orchestration
- `requirements.txt` - Python dependencies

## 🔧 Development

### Adding New Packages
1. Update `requirements.txt`
2. Rebuild the container:
   ```bash
   docker-compose up -d --build
   ```

### Git Workflow
- Changes are tracked daily
- Use `git status` to see changes
- Use `git log` to view history

## 🚀 Deployment

This container can be deployed to:
- Local development
- Cloud platforms (via Docker)
- Vercel (for web applications)

## 📝 Notes

- Container runs on port 8888
- All files are mounted as volumes for persistence
- Jupyter Lab requires no authentication (for local development)

---

**Created by**: nightseabird  
**Email**: nightseabird123@gmail.com