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
    return
}

# Process options when the devopsfetch is called
while getopts 'pdnuth' OPTIONS; do 
    case "$OPTION" in
        # p) 
        #     ;;

        # d) 
        #     ;;

        # n) 
        #     ;;

        # u) 
        #     ;;

        # t) 
        #     ;;
        
        h) 
            help
            ;;

    esac
done
