#!/bin/bash
domain=$1
# input from command-line becomes company to test
company=$2
#run as bash enum2all.sh Domain.com Company
#timestamp
stamp=$(date +"%m_%d_%Y")
path=$(pwd)
#create rc file with workspace.timestamp and start enumerating hosts
touch $company-$domain$stamp.resource
echo "spool start $domain$stamp.log" >> $domain$stamp.resource
echo "Domain:" $domain
echo "Company:" $company
echo "workspaces create $domain$stamp"
echo "workspaces load $domain$stamp" >> $domain$stamp.resource
echo "workspaces create $domain$stamp" >> $domain$stamp.resource
echo "workspaces load $domain$stamp" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/bing_domain_web" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/bing_domain_api" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/google_site_api" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hostsetcraft" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/hackertarget" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-contacts/metacrawler" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/shodan_hostname" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/brute_hosts" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/certificate_transparency" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/resolve" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/reverse_resolve" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/bing_ip" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/ipinfodb" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/freegeoip" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/hosts-hosts/ssltools" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-contacts/pgp_search" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-contacts/whois_pocs" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/companies-contacts/bing_linkedin_cache" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/builtwith" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/mx_spf_ip" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-hosts/ssl_san" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource 
echo "modules load recon/domains-vulnerabilities/ghdb" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource 
echo "modules load recon/domains-vulnerabilities/punkspider" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource 
echo "modules load recon/domains-vulnerabilities/xssed" >> $domain$stamp.resource
echo "options set SOURCE $domain" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource 
echo "modules load recon/companies-multi/github_miner" >> $domain$stamp.resource
echo "options set SOURCE $company" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/profiles-contacts/github_modules_users" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/profiles-contacts/github_modules" >> $domain$stamp.resource
echo "options set SOURCE $company" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/profiles-repositories/github_repos" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/repositories-profiles/github_commits" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/repositories-vulnerabilities/github_dorks" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/companies-multi/whois_miner" >> $domain$stamp.resource
echo "options set SOURCE $company" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load recon/domains-domains/brute_suffix" >> $domain$stamp.resource
echo "options set SOURCE $company" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load reporting/csv" >> $domain$stamp.resource
echo "options set FILENAME $path/$domain.csv" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "modules load reporting/html" >> $domain$stamp.resource
echo "options set CREATOR Sam" >> $domain$stamp.resource
echo "options set CUSTOMER $domain" >> $domain$stamp.resource
echo "options set FILENAME $path/$domain.html" >> $domain$stamp.resource
echo "run" >> $domain$stamp.resource
echo "exit" >> $domain$stamp.resource
cd /usr/share/recon-ng
./recon-ng -r $path/$domain$stamp.resource
