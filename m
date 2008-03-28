From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:40:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/jamvm
Message-ID: <20080328104009.2224B3C382@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:40:08 -0700 (Fri, 28 Mar 2008)
New Revision: 21535

Log:
jamvm: use official version instead of hacked up avr32 sources

Cleanup avr32 mess and apply it as a patch to the official version only
if arch = avr32 so it doesn't harm other archs.


Added:
   trunk/buildroot/package/jamvm/jamvm-1.5.0.patch.avr32

Modified:
   trunk/buildroot/package/jamvm/jamvm.mk


Changeset:

Sorry, the patch is too large to include (1494 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21535
