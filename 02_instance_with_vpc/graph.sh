#!/bin/bash
sudo apt-get install graphviz 
terraform graph | dot -Tsvg > graph.svg

