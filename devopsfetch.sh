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
    echo """Usage: devopsfetch [OPTIONS]
    Your devops tool for server information retrieval and monitoring
    Global Options: 
        -p  --port    Display all active ports and services 
        -d  --docker  List all Docker images and containers 
        -n  --nginx   Display all Nginx domains and their ports 
        -u  --users   List all users and their last login times
        -t  --time    Display activities within a specified time range
        -h  --help    Provide usage instructions for the program"""
}

# Process options when the devopsfetch is called
while getopts 'pdnuth' OPTION; do 
    case "$OPTION" in
        #  p) 
    
        #     ;;

        #  d) 
    
        #     ;;

        #  n) 
    
        #     ;;

        #  u) 
    
        #     ;;

        #  t) 
    
        #     ;;
        
        h) 
            help
            ;;

    esac
done
