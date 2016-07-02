From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:40 +0200
Subject: [Buildroot] [PATCH 11/69] expat: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-12-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/expat/expat.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index 5c1a444c7a31..e7bb74a966cd 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -11,6 +11,7 @@ EXPAT_INSTALL_STAGING = YES
 EXPAT_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) installlib
 EXPAT_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) installlib
 EXPAT_DEPENDENCIES = host-pkgconf
+HOST_EXPAT_DEPENDENCIES = host-pkgconf
 EXPAT_LICENSE = MIT
 EXPAT_LICENSE_FILES = COPYING
 
-- 
2.1.0
