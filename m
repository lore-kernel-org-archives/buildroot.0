From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:49 +0200
Subject: [Buildroot] [PATCH 20/69] libconfuse: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-21-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libconfuse/libconfuse.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 089e12cdb52c..fea90f1b09d7 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -10,6 +10,7 @@ LIBCONFUSE_SITE = https://github.com/martinh/libconfuse/releases/download/v$(LIB
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPTS = --disable-rpath
 LIBCONFUSE_DEPENDENCIES = host-flex
+HOST_LIBCONFUSE_DEPENDENCIES = host-flex
 LIBCONFUSE_LICENSE = ISC
 LIBCONFUSE_LICENSE_FILES = LICENSE
 
-- 
2.1.0
