From: Nicolas Chango <nicolas.chango96@outlook.fr>
Date: Fri, 26 Mar 2021 13:17:12 +0000
Subject: [Buildroot] Raspberry Pi 3 linux image installation
Message-ID: <MWHPR02MB2368FA6939186ECB2BDBD14DF1619@MWHPR02MB2368.namprd02.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, I try to install image for Raspberry Pi 3 device,

I use the last Ubuntu version in virtualbox.

Afer commands :

$ make raspberrypi3_defconfig
$ make

?I have the following errors :

g++: fatal error: Processus arr?t? signal terminated program cc1plus
compilation terminated.
make[3]: *** [Makefile:1116 : gimple-match.o] Erreur 1
make[3]: *** Attente des t?ches non termin?es....
make[2]: *** [Makefile:4300 : all-gcc] Erreur 2
make[1]: *** [package/pkg-generic.mk:250 : /home/nicolas/buildroot/output/build/host-gcc-initial-9.3.0/.stamp_built] Erreur 2
make: *** [Makefile:84 : _all] Erreur 2

Someone could help me please ?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210326/33f49faf/attachment.html>
