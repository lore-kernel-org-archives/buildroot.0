From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:40:46 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package: classpath
	concierge concierge/files jam etc...
Message-ID: <20080328104046.524613C361@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:40:45 -0700 (Fri, 28 Mar 2008)
New Revision: 21537

Log:
package: move java packages to package/java sub directory


Added:
   trunk/buildroot/package/java/
   trunk/buildroot/package/java/Config.in
   trunk/buildroot/package/java/classpath/
   trunk/buildroot/package/java/classpath/Config.in
   trunk/buildroot/package/java/classpath/classpath-avr32-endianness.patch
   trunk/buildroot/package/java/classpath/classpath.mk
   trunk/buildroot/package/java/concierge/
   trunk/buildroot/package/java/concierge/Config.in
   trunk/buildroot/package/java/concierge/concierge.mk
   trunk/buildroot/package/java/concierge/files/
   trunk/buildroot/package/java/concierge/files/concierge
   trunk/buildroot/package/java/concierge/files/init.xargs
   trunk/buildroot/package/java/jamvm/
   trunk/buildroot/package/java/jamvm/Config.in
   trunk/buildroot/package/java/jamvm/jamvm-1.5.0.patch.avr32
   trunk/buildroot/package/java/jamvm/jamvm.mk
   trunk/buildroot/package/java/java.mk

Removed:
   trunk/buildroot/package/classpath/Config.in
   trunk/buildroot/package/classpath/classpath-avr32-endianness.patch
   trunk/buildroot/package/classpath/classpath.mk
   trunk/buildroot/package/concierge/Config.in
   trunk/buildroot/package/concierge/concierge.mk
   trunk/buildroot/package/concierge/files/concierge
   trunk/buildroot/package/concierge/files/init.xargs
   trunk/buildroot/package/jamvm/Config.in
   trunk/buildroot/package/jamvm/jamvm-1.5.0.patch.avr32
   trunk/buildroot/package/jamvm/jamvm.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:

Sorry, the patch is too large to include (3739 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21537
