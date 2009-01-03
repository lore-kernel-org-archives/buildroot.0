From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat,  3 Jan 2009 16:10:50 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	at91rm9200df at91sam9260dfc at91sam9260p etc...
Message-ID: <20090103161050.CDA9876BC9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-03 16:10:50 +0000 (Sat, 03 Jan 2009)
New Revision: 24675

Log:
Update target/device/Atmel/*/Makefile.in
------------------------------------------
Replace $(BOARDNAME)_PATH with BOARD_PATH
Set U-Boot targets for 1.2.0-atmel as well as 2009.01-rc1
Remove hardwiring of BusyBox configuration files.
Remove older BusyBox configuration files
Remove "at91sam9260dfc-linux-2.6.28-rc6.config" from at91sam9g20dfc directory
Update "at91rm9200df_defconfig"
Add "at91rm9200df-linux-2.6.28.config"
Update "at91sam9260dfc_defconfig"



Added:
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df-linux-2.6.28.config

Modified:
   trunk/buildroot/target/device/Atmel/at91rm9200df/Makefile.in
   trunk/buildroot/target/device/Atmel/at91rm9200df/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/busybox-1.6.0.config
   trunk/buildroot/target/device/Atmel/at91sam9260pf/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9261ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9263ek/Makefile.in
   trunk/buildroot/target/device/Atmel/at91sam9g20dfc/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100-base/Makefile.in
   trunk/buildroot/target/device/Atmel/atngw100/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk1005/Makefile.in
   trunk/buildroot/target/device/Atmel/atstk100x/Makefile.in


Changeset:

Sorry, the patch is too large to include (3170 lines).
Please use ViewCVS to see it!

http://uclibc.org/cgi-bin/viewcvs.cgi?view=rev&root=svn&rev=24675
