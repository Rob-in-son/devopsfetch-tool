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

}

# Process options when the devopsfetch is called
while devopsfetch 'pdnuth' OPTIONS; do 
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
