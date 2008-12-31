From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Wed, 31 Dec 2008 18:25:24 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20081231182524.40CA576FDC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-12-31 18:25:23 +0000 (Wed, 31 Dec 2008)
New Revision: 24630

Log:
* Bumped xfsprogs to 2.10.2
- Remvoed susv3 legacy patch which was comitted upstream
- Forecefully set some configure results which appear to of been silently ignored in the past


Removed:
   trunk/buildroot/package/xfsprogs/xfsprogs-2.7.11_susv3-legacy.patch

Modified:
   trunk/buildroot/package/xfsprogs/xfsprogs.mk


Changeset:

Sorry, the patch is too large to include (1283 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24630
