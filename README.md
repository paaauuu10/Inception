# INCEPTION PROJECT - README

## PROJECT OVERVIEW
This project requires setting up a Docker-based infrastructure with NGINX, WordPress, and MariaDB containers following strict guidelines. The goal is to demonstrate system administration skills using Docker technology

## REQUIREMENTS
- Must be completed on a Virtual Machine
- Directory structure:
  - Root folder with Makefile
  - srcs/ for all configuration files
  - secrets/ for sensitive data (git-ignored)
- Services:
  - NGINX with TLS 1.2/1.3 (port 443 only)
  - WordPress with php-fpm (separate from NGINX)
  - MariaDB (separate container)
- Each service requires:
  - Custom Dockerfile (Alpine/Debian penultimate stable)
  - No pre-made images (except base OS)
  - Dedicated container
- Volumes required:
  - WordPress database
  - WordPress website files
- Network:
  - Custom docker-network connecting containers
  - Automatic restart on crash
- Security:
  - No passwords in Dockerfiles
  - Use .env and Docker secrets
  - Domain: login.42.fr pointing to local IP
  - Prohibited:
    - network: host
    - --link
    - latest tag
    - Infinite loops (tail -f, sleep infinity)

## SETUP INSTRUCTIONS
1. Clone repository:
   git clone <repo-url>
   cd <project-folder>

2. Configure environment:
   - Edit srcs/.env (set DOMAIN_NAME=yourlogin.42.fr)
   - Add credentials to secrets/ files

3. Build and run:
   make

4. Verify:
   - Access https://yourlogin.42.fr
   - Check running containers: docker ps

## IMPORTANT NOTES
- All sensitive data must be in secrets/
- Debug using: docker logs <container>
- Submit only non-sensitive files to git
