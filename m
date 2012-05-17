From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Thu, 17 May 2012 19:33:19 +0200
Subject: [Buildroot] [PATCH v4 20/22] pcre: define license
In-Reply-To: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
References: <1337276001-26149-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1337276001-26149-21-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/pcre/pcre.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/pcre/pcre.mk b/package/pcre/pcre.mk
index db896fd..d01ca84 100644
--- a/package/pcre/pcre.mk
+++ b/package/pcre/pcre.mk
@@ -6,6 +6,8 @@
 
 PCRE_VERSION = 8.30
 PCRE_SITE = ftp://ftp.csx.cam.ac.uk/pub/software/programming/pcre
+PCRE_LICENSE = BSD-3c
+PCRE_LICENSE_FILES = LICENCE
 PCRE_INSTALL_STAGING = YES
 
 ifneq ($(BR2_INSTALL_LIBSTDCPP),y)
-- 
1.7.9.5
