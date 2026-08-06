FROM python:3.13-slim

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements file
COPY requirements.txt .

# Install Python packages
RUN pip install --no-cache-dir -r requirements.txt

# Install Jupyter Lab
RUN pip install --no-cache-dir jupyterlab

# Expose Jupyter Lab port
EXPOSE 8888

# Create directories for existing content
RUN mkdir -p /workspace/notebooks \
    /workspace/scripts \
    /workspace/data \
    /workspace/MyWork \
    /workspace/Notebooks \
    /workspace/SparkCourse \
    /workspace/SQL+MySQL+NoSQL+MSSQL \
    /workspace/Power\ BI

# Set up Jupyter to run from workspace
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]