From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 24 Jan 2009 10:15:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia/mpg123
Message-ID: <20090124101510.62459769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-24 10:15:05 +0000 (Sat, 24 Jan 2009)
New Revision: 24999

Log:
Add fix to mpg123 for bug in ARM release toolchain causing segment violation, bug reported to gcc bugzilla

Added:
   trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch

Modified:
   trunk/buildroot/package/multimedia/mpg123/Config.in
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk


Changeset:

Sorry, the patch is too large to include (2181 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24999
