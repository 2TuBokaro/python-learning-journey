FROM python:3.12-slim

# Set working directory
WORKDIR /workspace

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Copy minimal requirements first (for faster build)
COPY requirements-minimal.txt .

# Install essential Python packages
RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements-minimal.txt

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
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--ServerApp.token=''", "--ServerApp.password=''"]