From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:48 +0200
Subject: [Buildroot] [PATCH 19/69] isl: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-20-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/isl/isl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index bb79039e883a..74de125b609a 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -12,7 +12,7 @@ ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
-ISL_DEPENDENCIES = gmp
+HOST_ISL_DEPENDENCIES = host-gmp
 
 # Our libtool patch doesn't apply, and since this package is only
 # built for the host, we don't really care about it.
-- 
2.1.0
