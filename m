From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:21:25 +0200
Subject: [Buildroot] [PATCH 56/69] xorriso: remove empty host dependencies
	definition
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-57-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

While there, fix some typos.

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/xorriso/xorriso.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/xorriso/xorriso.mk b/package/xorriso/xorriso.mk
index 396eeaee1913..be193221ec9a 100644
--- a/package/xorriso/xorriso.mk
+++ b/package/xorriso/xorriso.mk
@@ -8,9 +8,8 @@ XORRISO_VERSION = 1.4.2
 XORRISO_SITE = $(BR2_GNU_MIRROR)/xorriso
 XORRISO_LICENSE = GPLv3+
 XORRISO_LICENSE_FILES = COPYING COPYRIGHT
-HOST_XORRISO_DEPENDENCIES =
-# Disable everything until we actually need those feature, and add the correct
-# host-libraries
+# Disable everything until we actually need those features, and add the correct
+# host libraries
 HOST_XORRISO_CONF_OPTS = \
 	--disable-zlib \
 	--disable-bzip2 \
-- 
2.1.0
