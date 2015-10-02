From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Oct 2015 14:24:34 -0300
Subject: [Buildroot] [PATCH] lftp: bump to version 4.6.4
Message-ID: <1443806674-23991-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/lftp/lftp.hash | 2 +-
 package/lftp/lftp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lftp/lftp.hash b/package/lftp/lftp.hash
index f1e45bc..4c5d799 100644
--- a/package/lftp/lftp.hash
+++ b/package/lftp/lftp.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  8c3a12a1f9ec288132b245bdd7d14d88ade1aa5cb1c14bb68c8fab3b68793840  lftp-4.6.3a.tar.xz
+sha256  1e7cb674c83ace48172263f86847ed04bb6ab2f24116b11a8505f70a15e8805c  lftp-4.6.4.tar.xz
diff --git a/package/lftp/lftp.mk b/package/lftp/lftp.mk
index b69e2d6..d2d58fd 100644
--- a/package/lftp/lftp.mk
+++ b/package/lftp/lftp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LFTP_VERSION = 4.6.3a
+LFTP_VERSION = 4.6.4
 LFTP_SOURCE = lftp-$(LFTP_VERSION).tar.xz
 LFTP_SITE = http://lftp.yar.ru/ftp
 LFTP_LICENSE = GPLv3+
-- 
2.4.9
