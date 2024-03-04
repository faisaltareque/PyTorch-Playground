#check if anaconda is installed
eval "$(conda shell.bash hook)"
if ! command -v conda &> /dev/null
then
    echo "Anaconda could not be found"
    echo "Please install anaconda and try again"
    exit
fi
# create a new environment
# ask for user input
echo "Enter the name of the environment you want to create: "
read env_name
echo "Enter the python version you want to use: "
read python_version
# create the environment
conda create -n $env_name python=$python_version
# activate the environment
conda activate $env_name
# install pytorch
conda install -c "nvidia/label/cuda-12.1.0" cuda -y
conda install -c "nvidia/label/cuda-12.1.0" cuda-toolkit -y
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/nightly/cu121
pip install transformers datasets pandas matplotlib absl-py scipy accelerate bitsandbytes tensorboard huggingface-hub pytorch-lightning jupyter

# ask for kernel name
echo "Enter the name of the kernel you want to create: "
read kernel_name
# create the kernel
python -m ipykernel install --user --name $kernel_name --display-name $kernel_name
