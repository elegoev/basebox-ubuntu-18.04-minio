## deploy vagrant box to vagrant cloud
#

# prepare environment
#
#         vagrant cloud auth login elegoev
#

vag-bp -custboxname "ubuntu-18.04-minio" `
       -targetns "elegoev" `
       -targetrepo vagrantcloud `
       -boxdesc "vagrant basebox with ubuntu 18.04 & minio" `
       -versiondesc "initial version"
