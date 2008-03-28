From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 28 Mar 2008 00:32:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9260dfc at91sam9261 etc...
Message-ID: <20080328073254.766C03C318@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-28 00:32:54 -0700 (Fri, 28 Mar 2008)
New Revision: 21528

Log:
Define busybox config in board directory for Atmel boards

Removed:
   trunk/buildroot/target/device/Atmel/atngw100-base/busybox-1.7.2.config
   trunk/buildroot/target/device/Atmel/atngw100-base/busybox-1.8.0.config
   trunk/buildroot/target/device/Atmel/atngw100-base/busybox-1.9.0.config
   trunk/buildroot/target/device/Atmel/atngw100-expanded/busybox-1.7.2.config
   trunk/buildroot/target/device/Atmel/atngw100-expanded/busybox-1.8.0.config
   trunk/buildroot/target/device/Atmel/atngw100-expanded/busybox-1.9.0.config
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.6.1.config
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.7.1.config
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.7.2.config
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.8.0.config
   trunk/buildroot/target/device/Atmel/atngw100/busybox-1.9.0.config
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.6.1.config
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.7.4.config
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.8.2.config
   trunk/buildroot/target/device/Atmel/atstk1002/busybox-1.9.0.config

Modified:
   trunk/buildroot/target/device/Atmel/Makefile.in
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100-expanded/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk1002/Makefile.in


Changeset:

Sorry, the patch is too large to include (11497 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=21528
