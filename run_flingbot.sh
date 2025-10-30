# eval "$(mamba shell hook --shell bash)"
# mamba activate
# mamba activate flingbot
# . ./prepare.sh

python run_sim.py \
--eval \
--tasks flingbot-normal-rect-eval.hdf5 \
--load flingbot.pth \
--num_processes 16 \
--dump_visualizations