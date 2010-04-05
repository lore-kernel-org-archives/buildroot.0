From: Souf Oued <souf_oued@yahoo.fr>
Date: Mon, 05 Apr 2010 17:20:25 +0200
Subject: [Buildroot] [01/03] gmp: convert to autotools infrastructure
Message-ID: <4BB9FFB9.1030408@yahoo.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,
I propose 3 patches to convert gmp and mpfr to autotools infrastructure 
and add a new package: mpc (multiprecision.org), it is needed for a 
future GCC-4.5.x.
1- buildroot-gmp.patch: convert gmp to autotools and bump to 5.0.1
2- buildroot-mpfr.patch: convert mpfr to autotools and bump to 2.4.2
3- buildroot-mpc.patch: add mpc package

Best regards.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-mpfr.patch
Type: text/x-patch
Size: 7257 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20100405/554096a5/attachment.bin>
