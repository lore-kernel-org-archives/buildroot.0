From: James Knight <james.knight@rockwellcollins.com>
Date: Wed, 21 Oct 2015 20:08:11 -0400
Subject: [Buildroot] [PATCH 1/1] ntp: bump to version 4.2.8p4
Message-ID: <1445472491-3348-1-git-send-email-james.knight@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: James Knight <james.knight@rockwellcollins.com>
---
 package/ntp/ntp.hash | 6 +++---
 package/ntp/ntp.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ntp/ntp.hash b/package/ntp/ntp.hash
index d23146f..735e533 100644
--- a/package/ntp/ntp.hash
+++ b/package/ntp/ntp.hash
@@ -1,4 +1,4 @@
-# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p3.tar.gz.md5
-md5	b98b0cbb72f6df04608e1dd5f313808b	ntp-4.2.8p3.tar.gz
+# From http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p4.tar.gz.md5
+md5	6af96862b09324a8ef965ca76b759c8b	ntp-4.2.8p4.tar.gz
 # Calculated based on the hash above
-sha256	818ca4f2ed6ca845b1c5ec43f5e6ad905eaa0fc0aab2d509ed6b962a37fbf38f	ntp-4.2.8p3.tar.gz
+sha256	0d6961572548d2c4af96f58f763e22ac620f5afef717384ddc317a0e365cfdb9	ntp-4.2.8p4.tar.gz
diff --git a/package/ntp/ntp.mk b/package/ntp/ntp.mk
index 863717e..97e5ab2 100644
--- a/package/ntp/ntp.mk
+++ b/package/ntp/ntp.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 NTP_VERSION_MAJOR = 4.2
-NTP_VERSION = $(NTP_VERSION_MAJOR).8p3
+NTP_VERSION = $(NTP_VERSION_MAJOR).8p4
 NTP_SITE = http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-$(NTP_VERSION_MAJOR)
 NTP_DEPENDENCIES = host-pkgconf libevent $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 NTP_LICENSE = ntp license
-- 
1.9.5.msysgit.1
