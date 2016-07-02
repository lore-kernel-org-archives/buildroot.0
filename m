From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:34 +0200
Subject: [Buildroot] [PATCH 05/69] cloog: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-6-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/cloog/cloog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cloog/cloog.mk b/package/cloog/cloog.mk
index 4c8b4c11e79b..ef666d0cac54 100644
--- a/package/cloog/cloog.mk
+++ b/package/cloog/cloog.mk
@@ -7,7 +7,7 @@
 CLOOG_VERSION = 0.18.4
 CLOOG_SITE = http://www.bastoul.net/cloog/pages/download
 CLOOG_LICENSE = LGPLv2.1+
-CLOOG_DEPENDENCIES = gmp isl
+HOST_CLOOG_DEPENDENCIES = host-gmp host-isl
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
 CLOOG_LIBTOOL_PATCH = NO
-- 
2.1.0
