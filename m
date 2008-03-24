From: nkukard at uclibc.org <nkukard@uclibc.org>
Date: Mon, 24 Mar 2008 12:23:38 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xfsprogs
Message-ID: <20080324192338.2D62A3C361@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: nkukard
Date: 2008-03-24 12:23:37 -0700 (Mon, 24 Mar 2008)
New Revision: 21475

Log:
* Updated susv3 legacy patch for xfsprogs
- Changed to unix file format
- Added fix for rtcp/xfs_rtcp.c, where I missed one or two legacy function calls


Modified:
   trunk/buildroot/package/xfsprogs/xfsprogs-2.7.11_susv3-legacy.patch


Changeset:

Sorry, the patch is too large to include (3754 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21475
