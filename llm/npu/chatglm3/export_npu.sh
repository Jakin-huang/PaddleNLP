# Copyright (c) 2024 PaddlePaddle Authors. All Rights Reserved.
# 
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set -x

src_path=${1:-"./model"}
dst_path=${2:-"./model/inference"}

source /usr/local/Ascend/ascend-toolkit/set_env.sh
source /usr/local/Ascend/atb/set_env.sh

src_path=`realpath $src_path`
dst_path=`realpath $dst_path`
cd ../../

export PYTHONPATH=../:$PYTHONPATH
python predict/export_model.py --model_name_or_path ${src_path}  --inference_model --output_path ${dst_path} --dtype float16  --device npu  --block_attn
cd -
