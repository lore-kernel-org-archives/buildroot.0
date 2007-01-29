From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 29 Jan 2007 13:53:21 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target: device/Soekris
	device/Soekris/net4801 d etc...
Message-ID: <20070129215321.2E08648584@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-29 13:53:20 -0800 (Mon, 29 Jan 2007)
New Revision: 17648

Log:
- apply Soekris update from Eric Milon
- mv the linux26.mk into a more generic place for use with other arches/boards (breaks the kernel, will fix up soonish)


Added:
   trunk/buildroot/target/device/Soekris/net4801/linux26.config
   trunk/buildroot/target/linux26.mk

Removed:
   trunk/buildroot/target/device/Soekris/net4801/linux.mk
   trunk/buildroot/target/device/x86/i386/linux26.mk

Modified:
   trunk/buildroot/target/device/Soekris/Makefile.in
   trunk/buildroot/target/device/Soekris/net4801/busybox.config
   trunk/buildroot/target/device/x86/i386/Makefile.in


Changeset:

Sorry, the patch is too large to include (3155 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=17648
