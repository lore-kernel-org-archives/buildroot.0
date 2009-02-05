From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Feb 2009 13:24:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: multimedia/mpg123
Message-ID: <20090205132419.3C68C76454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-05 13:24:18 +0000 (Thu, 05 Feb 2009)
New Revision: 25250

Log:
mpg123: remove arm funroll-loops workaround

Fixed by toolchain patch.

Removed:
   trunk/buildroot/package/multimedia/mpg123/mpg123-0.66-arm-unroll.patch

Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/package/multimedia/mpg123/mpg123.mk


Changeset:

Sorry, the patch is too large to include (2165 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=25250
