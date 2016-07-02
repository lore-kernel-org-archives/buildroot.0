From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:53 +0200
Subject: [Buildroot] [PATCH 24/69] libsepol: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-25-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/libsepol/libsepol.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index c53707a161cc..3b02175f7905 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -11,6 +11,7 @@ LIBSEPOL_LICENSE_FILES = COPYING
 
 LIBSEPOL_INSTALL_STAGING = YES
 LIBSEPOL_DEPENDENCIES = host-flex
+HOST_LIBSEPOL_DEPENDENCIES = host-flex
 
 LIBSEPOL_MAKE_FLAGS = $(TARGET_CONFIGURE_OPTS)
 
-- 
2.1.0
