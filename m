From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Fri, 30 Mar 2012 14:50:26 +0200
Subject: [Buildroot] [PATCH] pcre: bump to 8.30
Message-ID: <1333111826-26665-1-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pcre/pcre.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index d64106e..db896fd 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-PCRE_VERSION = 8.20
+PCRE_VERSION = 8.30
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 
-- 
1.7.5.4
