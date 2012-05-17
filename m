From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:16 +0200
Subject: [Buildroot] [PATCH v4 17/22] lzo: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-18-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/lzo/lzo.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lzo/lzo.mk b/package/lzo/lzo.mk
index 84f31f0..da5d6b7 100644
--- a/package/lzo/lzo.mk
+++ b/package/lzo/lzo.mk
@@ -5,6 +5,8 @@
 #############################################################
 LZO_VERSION = 2.06
 LZO_SITE = http://www.oberhumer.com/opensource/lzo/download
+LZO_LICENSE = GPLv2+
+LZO_LICENSE_FILES = COPYING
 LZO_INSTALL_STAGING = YES
 
 $(eval $(call AUTOTARGETS))
-- 
1.7.9.5
