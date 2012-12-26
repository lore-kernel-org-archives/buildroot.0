From: Mikhail Boiko <mikhailboiko85@gmail.com>
Date: Wed, 26 Dec 2012 09:40:27 +0200
Subject: [Buildroot] [PATCH 1/1] dosfstools: fix download link
Message-ID: <1356507627-8606-1-git-send-email-mikhailboiko85@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Mikhail Boiko <mikhailboiko85@gmail.com>
---
 package/dosfstools/dosfstools.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 08201d3..507f485 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -5,7 +5,7 @@
 #############################################################
 
 DOSFSTOOLS_VERSION = 3.0.12
-DOSFSTOOLS_SITE = http://www.daniel-baumann.ch/software/dosfstools
+DOSFSTOOLS_SITE = http://fossies.org/linux/misc/
 MKDOSFS_BINARY = mkdosfs
 DOSFSCK_BINARY = dosfsck
 DOSFSLABEL_BINARY = dosfslabel
-- 
1.7.9.5
