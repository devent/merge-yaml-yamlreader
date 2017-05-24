# merge-yaml-yamlreader

# Description

The project builds https://github.com/ImmobilienScout24/yamlreader in a docker 
image. The docker image can then be used to run the command line client 
`yamlreader`. The tool can be used to merge multiple yaml files together.

# Usage

The files are expected to be in the `/work` directory. The `yamlreader` script 
takes a list of files and writes the merged yaml to the standard output.

```
docker run -it --rm -v "$PWD:/work" erwinnttdata/merge-yaml-yamlreader:latest yamlreader files...
```

# Test

The test script `test.sh` demonstrates the usage of the tool by merging two
yaml files from the `test` directory.

```
bash -x ./test.sh
+ set -e
+ REPOSITORY=erwinnttdata
+ NAME=merge-yaml
+ VERSION=latest
+ WORK_DIR=test
+ run_yamlreader defaults.yaml env-0.yaml
++ realpath test
+ docker run -it --rm -v test:/work erwinnttdata/merge-yaml:latest yamlreader defaults.yaml env-0.yaml
deploy:
-   manifest: elasticsearch.yaml
    name: elasticsearch
    resources:
    -   request:
        -   cpu: 1
            memory: 20Gi
    -   limits:
        -   cpu: 1
            memory: 20Gi
-   cluster:
    - 10.0.0.1
    - 10.0.0.2
    - 10.0.0.3
    name: elasticsearch
```
