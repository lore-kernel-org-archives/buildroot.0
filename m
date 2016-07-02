From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:01 +0200
Subject: [Buildroot] [PATCH 32/69] pixman: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-33-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/pixman/pixman.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
index ae8d62c589bb..38524e63c450 100644
--- a/package/pixman/pixman.mk
+++ b/package/pixman/pixman.mk
@@ -12,6 +12,7 @@ PIXMAN_LICENSE_FILES = COPYING
 
 PIXMAN_INSTALL_STAGING = YES
 PIXMAN_DEPENDENCIES = host-pkgconf
+HOST_PIXMAN_DEPENDENCIES = host-pkgconf
 
 # For 0001-Disable-tests.patch
 PIXMAN_AUTORECONF = YES
-- 
2.1.0
