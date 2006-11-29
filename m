From: Gery <gxkahn@gmail.com>
Date: Wed, 29 Nov 2006 14:34:26 +0200
Subject: [Buildroot] error to build coreutils-5.96
Message-ID: <ekjulc$peq$1@sea.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I took buildroot from svn at 29 nov 2006 and build it w/ gcc-3.4.6
Follows error occured:

make[2]: Entering directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/man'
Updating man page basename.1
help2man: can't get `--help' info from basename.td/basename
make[2]: *** [basename.1] Error 126
make[2]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96/man'
make[1]: *** [install-recursive] Error 1
make[1]: Leaving directory 
`/home/gxk/prjs/buildroot/opt/x86_build_i686/coreutils-5.96'
