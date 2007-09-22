From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 22 Sep 2007 11:19:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20070922181936.CD49BA65E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-22 11:19:35 -0700 (Sat, 22 Sep 2007)
New Revision: 19946

Log:
- update i386 sample config a little bit


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.config


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.config
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.config	2007-09-22 17:30:38 UTC (rev 19945)
+++ trunk/buildroot/target/device/x86/i386/linux26.config	2007-09-22 18:19:35 UTC (rev 19946)
@@ -1327,6 +1327,7 @@
 CONFIG_SENSORS_FSCPOS=m
 CONFIG_SENSORS_GL518SM=m
 CONFIG_SENSORS_GL520SM=m
+CONFIG_SENSORS_CORETEMP=m
 CONFIG_SENSORS_IPMI=m
 CONFIG_SENSORS_IT87=m
 CONFIG_SENSORS_LM63=m
@@ -1340,6 +1341,7 @@
 CONFIG_SENSORS_LM90=m
 CONFIG_SENSORS_LM92=m
 CONFIG_SENSORS_MAX1619=m
+CONFIG_SENSORS_MAX6650=m
 CONFIG_SENSORS_PC87360=m
 CONFIG_SENSORS_PC87427=m
 CONFIG_SENSORS_SIS5595=m
