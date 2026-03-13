# clean base image containing only comfyui, comfy-cli and comfyui-manager
FROM runpod/worker-comfyui:5.5.1-base

# install custom nodes into comfyui (first node with --mode remote to fetch updated cache)
# No registry-verified custom nodes found in the workflow.
# The workflow lists the following unknown-registry custom nodes which could not be resolved automatically because no GitHub repo (aux_id) or registry id was provided:
# - MarkdownNote
# - MarkdownNote
# To install these, provide either the ComfyUI registry IDs or the GitHub repo paths (aux_id). Example for GitHub installs:
# RUN git clone https://github.com/<owner>/<repo> /comfyui/custom_nodes/<repo>

# download models into comfyui
# (no models specified in the workflow)
RUN wget -P ./models/diffusion_models https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/diffusion_models/qwen_image_2512_bf16.safetensors
RUN wget -P ./models/text_encoders https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/text_encoders/qwen_2.5_vl_7b_fp8_scaled.safetensors
RUN wget -P ./models/vae https://huggingface.co/Comfy-Org/Qwen-Image_ComfyUI/resolve/main/split_files/vae/qwen_image_vae.safetensors
# copy all input data (like images or videos) into comfyui (uncomment and adjust if needed)
# COPY input/ /comfyui/input/
