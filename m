From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 05 Dec 2015 23:11:06 +0100
Subject: [Buildroot] Buildroot 2015.11.1 released
Message-ID: <87egf0sg05.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Buildroot is a simple tool for creating complete embedded Linux systems
(http://buildroot.net).

Buildroot 2015.11.1 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2015.11.1.tar.gz

or

http://buildroot.net/downloads/buildroot-2015.11.1.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

Buildroot 2015.11.1 is a bugfix release, fixing critical issues
discovered since the 2015.11 release:

 - Fix for issue with the host package RPATH check when a custom host
   directory (BR2_HOST_DIR=/path/to/somewhere) is used.

 - Important (and/or security related) bugfixes for busybox,
   dropbear, libpng and openssl.

See the changes file for details:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2015.11.1

Many thanks to all the people contributing to this release:

     3  Gustavo Zacarias
     2  Yann E. MORIN
     1  Arnout Vandecappelle (Essensium/Mind)
     1  Peter Korsgaard

-- 
Bye, Peter Korsgaard
