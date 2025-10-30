# Add conda to PATH (adjust if your conda is installed somewhere else)
export PATH=/root/miniconda3/bin:$PATH

# (Optional) Initialize conda shell integration (bash example)
eval "$(conda shell.bash hook)"
eval "$(mamba shell hook --shell bash)"
mamba activate
mamba env create -f flingbot.yml
# Now you can activate your environment, e.g.:
mamba activate flingbot

# apt install libopenexr-dev
# pip install OpenEXR==1.3.8
