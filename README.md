# automated-recon-ng
Recon-ng automation script 

A shell script to automate the use of recon-ng v5.

How to use:
Run as bash: ./recon.sh Domain.com company
replacing domain.com with the desired domain and company with the desired company.

Output:
Three files will be generated: domain.csv and domain.html in the execution path and $domain$stamp.log in recon-ng path.

Notes:
The recon-ng path in the script is "/usr/share/recon-ng". Modify this if your installation path is different.

Make sure you have installed modules on recon-ng and have inputted the API keys. The following keys are required:
bing_api
google_api
shodan_api
github_api
builtwith_api
twitter_api
ipinfodb_api
