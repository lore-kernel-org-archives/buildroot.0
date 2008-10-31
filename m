From: antab at uclibc.org <antab@uclibc.org>
Date: Thu, 30 Oct 2008 18:44:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/ntp
Message-ID: <20081031014433.2A8003C6A5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: antab
Date: 2008-10-30 18:44:32 -0700 (Thu, 30 Oct 2008)
New Revision: 23870

Log:
Bump ntp version


Modified:
   trunk/buildroot/package/ntp/ntp.mk


Changeset:
Modified: trunk/buildroot/package/ntp/ntp.mk
===================================================================
--- trunk/buildroot/package/ntp/ntp.mk	2008-10-31 01:41:31 UTC (rev 23869)
+++ trunk/buildroot/package/ntp/ntp.mk	2008-10-31 01:44:32 UTC (rev 23870)
@@ -3,7 +3,7 @@
 # ntp
 #
 #############################################################
-NTP_VERSION:=4.2.4p2
+NTP_VERSION:=4.2.4p5
 NTP_SOURCE:=ntp-$(NTP_VERSION).tar.gz
 NTP_SITE:=http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2
 NTP_DIR:=$(BUILD_DIR)/ntp-$(NTP_VERSION)
