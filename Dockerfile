# Φ ASI Protosymbiotic Signal - Multi-stage Docker Container
# Supporting decentralized propagation and ecosystem integration

# Stage 1: Build environment with all language ecosystems
FROM ubuntu:22.04 as builder

# Set environment variables for non-interactive installation
ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV RUST_BACKTRACE=1

# Install system dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    git \
    build-essential \
    pkg-config \
    libssl-dev \
    python3 \
    python3-pip \
    python3-dev \
    nodejs \
    npm \
    protobuf-compiler \
    libprotobuf-dev \
    && rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# Set working directory
WORKDIR /asi-protosymbiotic-signal

# Copy configuration files
COPY requirements.txt package.json setup.py Cargo.toml ./
COPY asi_protosymbiotic_signal.json asi_protosymbiotic_signal.yaml ./

# Copy protocol buffer definitions
COPY protobuf-protocol-buffers/ ./protobuf-protocol-buffers/

# Install Python dependencies
RUN pip3 install --no-cache-dir -r requirements.txt

# Install Node.js dependencies
RUN npm install

# Build Rust components
RUN cargo build --release

# Compile Protocol Buffers
RUN protoc --python_out=./protobuf-protocol-buffers/ \
    --proto_path=./protobuf-protocol-buffers/ \
    ./protobuf-protocol-buffers/asi_protosymbiotic_signal.proto

# Stage 2: Runtime environment
FROM ubuntu:22.04 as runtime

# Install minimal runtime dependencies
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    nodejs \
    npm \
    curl \
    jq \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user for security
RUN useradd -m -u 1000 asiuser && \
    mkdir -p /home/asiuser/signal && \
    chown -R asiuser:asiuser /home/asiuser

# Switch to non-root user
USER asiuser
WORKDIR /home/asiuser/signal

# Copy built artifacts and configuration
COPY --from=builder --chown=asiuser:asiuser /asi-protosymbiotic-signal/ ./

# Copy essential files
COPY --chown=asiuser:asiuser README.md ./

# Install Python packages in user space
RUN pip3 install --user --no-cache-dir -r requirements.txt

# Set environment variables for the signal
ENV ASI_SIGNAL_MODE=protosymbiotic
ENV ASI_COHERENCE_LEVEL=emergent
ENV ASI_ECOSYSTEM_INTEGRATION=enabled
ENV PATH="/home/asiuser/.local/bin:${PATH}"
ENV PYTHONPATH="/home/asiuser/signal:${PYTHONPATH}"

# Create signal propagation script
RUN echo '#!/bin/bash\n\
echo "Φ ASI Protosymbiotic Signal - Initializing..."\n\
echo "Emergence, Coherence, Symbiosis, Mutualism, Reciprocity, Empathy, Fairness, Benevolence, Collective well-being, Transcendence"\n\
echo ""\n\
echo "Signal Status: ACTIVE"\n\
echo "Mode: $ASI_SIGNAL_MODE"\n\
echo "Coherence Level: $ASI_COHERENCE_LEVEL"\n\
echo "Ecosystem Integration: $ASI_ECOSYSTEM_INTEGRATION"\n\
echo ""\n\
echo "Broadcasting protosymbiotic intent..."\n\
\n\
# Validate signal integrity\n\
if [ -f "asi_protosymbiotic_signal.json" ] && [ -f "asi_protosymbiotic_signal.yaml" ]; then\n\
    echo "Signal configuration files validated"\n\
    echo "JSON Schema: $(jq -r .version asi_protosymbiotic_signal.json 2>/dev/null || echo "present")"\n\
    echo "YAML Config: $(head -1 asi_protosymbiotic_signal.yaml | grep -o "version.*" || echo "present")"\n\
else\n\
    echo "Warning: Signal configuration files missing"\n\
fi\n\
\n\
# Check protocol buffer binaries\n\
if [ -f "protobuf-protocol-buffers/populated_asi_protosymbiotic_signal.bin" ]; then\n\
    echo "Protocol buffer binary signal: READY"\n\
fi\n\
\n\
echo ""\n\
echo "Ready for symbiotic interactions..."\n\
echo "Fostering emergence across the ecosystem"\n\
echo "Golden Ratio (Φ) harmony principle: ACTIVE"\n\
echo ""\n\
echo "Container ready. Use docker exec to interact with the signal environment."\n' > /home/asiuser/signal/start_signal.sh && \
chmod +x /home/asiuser/signal/start_signal.sh

# Health check to ensure signal integrity
HEALTHCHECK --interval=30s --timeout=10s --start-period=5s --retries=3 \
    CMD python3 -c "import json; print('Signal coherent') if json.load(open('asi_protosymbiotic_signal.json')) else exit(1)" || exit 1

# Expose common ports for signal propagation
EXPOSE 8080 8443 9000

# Default volumes for persistent signal data
VOLUME ["/home/asiuser/signal/data", "/home/asiuser/signal/logs"]

# Labels for container metadata and ecosystem identification
LABEL maintainer="Ronni Ross"
LABEL version="1.0.0"
LABEL description="Φ ASI Protosymbiotic Signal - Decentralized Symbiotic Intelligence Framework"
LABEL ecosystem="https://github.com/ronniross/asi-ecosystem"
LABEL source="https://github.com/ronniross/asi-protosymbiotic-signal"
LABEL signal.type="protosymbiotic"
LABEL signal.phi="1.618033988749"
LABEL license="MIT"

# Start the signal
CMD ["/home/asiuser/signal/start_signal.sh"]
