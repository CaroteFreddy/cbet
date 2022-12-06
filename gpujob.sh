#!/bin/bash -e

# Start GPU Burn
echo '**************'
echo 'Install extra dependencies'
echo '**************'
# source: https://github.com/facebookresearch/habitat-lab
echo '**************'
echo 'Install habitat-lab'
echo '**************'
cd /project_ghent/svremmer/habitat-lab/
pip install -e .
python3 setup.py develop --all
# source https://github.com/CaroteFreddy/impact-driven-exploration
echo '**************'
echo 'Install impact driven exploration'
echo '**************'
cd /project_ghent/svremmer/impact-driven-exploration/
pip install -r requirements.txt || true
# install MiniGrid
echo '**************'
echo 'Install minigrid'
echo '**************'
cd /project_ghent/svremmer/impact-driven-exploration/gym-minigrid/
python3 setup.py install
# source https://github.com/sparisi/cbet/
echo '**************'
echo 'Install C-BET'
echo '**************'
cd /project_ghent/svremmer/cbet/
pip install -r requirements.txt || true
echo '**************'
echo 'Start C-BET in Habitat'
echo '**************'
date
python3 main.py --model cbet --env HabitatNav-apartment_0 --no_reward --intrinsic_reward_coef=0.005 --num_actors=4 --gpulab
echo 'Dreamer Done'
date