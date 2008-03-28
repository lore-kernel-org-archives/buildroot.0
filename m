From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 16:13:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080328231331.2E4F23C43B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 16:13:30 -0700 (Fri, 28 Mar 2008)
New Revision: 21546

Log:
package: remove empty directories

These directories should have been removed when the packages got moved
to subdirs, but git-svn seems to have issues with empty directories.


Removed:
   trunk/buildroot/package/classpath/
   trunk/buildroot/package/concierge/
   trunk/buildroot/package/ed/
   trunk/buildroot/package/jamvm/
   trunk/buildroot/package/nano/
   trunk/buildroot/package/uemacs/


Changeset:
