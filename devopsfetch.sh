#!/bin/bash

# Define functions for each information required

# # ports
# ports(){

# }

# # docker
# docker(){

# }

# # Nginx
# nginx(){

# }

# # Users
# users(){

# }

# # Time range
# time_range(){

# }

# Help
help(){
    echo "Usage"
    exit 0
}

# Process options when the devopsfetch is called
while getopts 'pdnuth' OPTIONS; do 
    case "$OPTION" in
         p) 
            echo "Testing ports"
            ;;

         d) 
            echo "Testing docker"
            ;;

         n) 
            echo "Testing nginx"
            ;;

         u) 
            echo "Testing users"
            ;;

         t) 
            echo "Testing time-range"
            ;;
        
        h) 
            help
            ;;

    esac
done
