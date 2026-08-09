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

# Install Python packages with exact versions for stability
RUN pip install --no-cache-dir -r requirements.txt

# Create non-root user for security
RUN useradd -m -u 1000 learner && chown -R learner /workspace
USER learner

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

# Health check
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD curl -f http://localhost:8888/ || exit 1

# Set up Jupyter to run from workspace
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]