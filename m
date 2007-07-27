From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 27 Jul 2007 03:39:55 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/generic/target_busybox_skeleton/etc
Message-ID: <20070727103955.C8583A4631@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-27 03:39:55 -0700 (Fri, 27 Jul 2007)
New Revision: 19272

Log:
- the minimal busybox skeleton does not necessarily need this ld stuff.
  If it is really needed (for dynamic builds), then it has to be created conditionally in the makefiles.


Removed:
   trunk/buildroot/target/generic/target_busybox_skeleton/etc/ld.so.conf.d/


Changeset:
