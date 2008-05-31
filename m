From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 31 May 2008 00:27:40 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_skeleton: sys
Message-ID: <20080531072740.8C89D3C897@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-05-31 00:27:40 -0700 (Sat, 31 May 2008)
New Revision: 22131

Log:
generic target_skeleton: mark /sys with .empty file

/sys somehow didn't got an .empty file like the rest in r21586. Fixed.


Added:
   trunk/buildroot/target/generic/target_skeleton/sys/
   trunk/buildroot/target/generic/target_skeleton/sys/.empty


Changeset:
Added: trunk/buildroot/target/generic/target_skeleton/sys/.empty
===================================================================
