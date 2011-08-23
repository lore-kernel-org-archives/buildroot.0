From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Aug 2011 21:17:12 +0200
Subject: [Buildroot] [PATCH 8/9] pcre: bump to 8.12 and switch to bz2 tarball
In-Reply-To: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
References: <1314127033-14861-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1314127033-14861-9-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pcre/pcre.mk |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index d2a1331..395a6d1 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -4,7 +4,8 @@
 #
 #############################################################
 
-PCRE_VERSION = 7.9
+PCRE_VERSION = 8.12
+PCRE_SOURCE = pcre-$(PCRE_VERSION).tar.bz2
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
 PCRE_INSTALL_STAGING = YES
 
-- 
1.7.4.1
