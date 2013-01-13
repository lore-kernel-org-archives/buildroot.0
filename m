From: Sagaert Johan <sagaert.johan@skynet.be>
Date: Sun, 13 Jan 2013 13:46:08 +0100
Subject: [Buildroot] [PATCH 1/1] qtextserialport : bump version
Message-ID: <1358081168-14572-1-git-send-email-sagaert.johan@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


qtextserialport : bump version
Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
---
 package/qextserialport/qextserialport.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qextserialport/qextserialport.mk b/package/qextserialport/qextserialport.mk
index f240cda..efbfae7 100644
--- a/package/qextserialport/qextserialport.mk
+++ b/package/qextserialport/qextserialport.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-QEXTSERIALPORT_VERSION     = f83b4e7ca922e53
+QEXTSERIALPORT_VERSION     = 6c47244de4ce6db
 QEXTSERIALPORT_SITE        = https://qextserialport.googlecode.com/git/
 QEXTSERIALPORT_SITE_METHOD = git
 
-- 
1.8.0.1
