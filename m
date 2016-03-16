From: Steve Calfee <stevecalfee@gmail.com>
Date: Tue, 15 Mar 2016 18:40:47 -0700
Subject: [Buildroot] user: openssh build question
Message-ID: <CAJJ6jxusP5Q2AuX3WXH8yBu8rakt-mhnk4xU+1cQX_JkL1hg1Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Does anyone know why the build litters my target /etc directory with
files instead of putting them in ssh? I think I must have something
configured wrong. I have upgraded to buildroot 2016.02.

here is the /etc dir, see the generated keys at the end. I think they
should be put in ssh:

Thanks, Steve

ls -1 output/target/etc/
avahi
exports
fstab
group
hostname
hosts
httpd.conf
init.d
inittab
inputrc
issue
mc
mtab
mysql
netconfig
network
nfsmount.conf
nsswitch.conf
os-release
passwd
php.ini
profile
profile.d
protocols
resolv.conf
services
shadow
ssh
ssh_host_dsa_key
ssh_host_dsa_key.pub
ssh_host_ecdsa_key
ssh_host_ecdsa_key.pub
ssh_host_ed25519_key
ssh_host_ed25519_key.pub
ssh_host_key
ssh_host_key.pub
ssh_host_rsa_key
ssh_host_rsa_key.pub
ssl
