From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Fri, 16 Mar 2012 14:54:54 +0100
Subject: [Buildroot] [PATCH 1/2] vsftpd: bump to 2.3.5
Message-ID: <1331906095-18056-1-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/vsftpd/vsftpd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index e67ab4a..8d3a01e 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-VSFTPD_VERSION = 2.3.4
+VSFTPD_VERSION = 2.3.5
 VSFTPD_SITE = https://security.appspot.com/downloads
 VSFTPD_LIBS = -lcrypt
 
-- 
1.7.7
