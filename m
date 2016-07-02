From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:31 +0200
Subject: [Buildroot] [PATCH 02/69] axfsutils: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-3-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/axfsutils/axfsutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/axfsutils/axfsutils.mk b/package/axfsutils/axfsutils.mk
index 6c9c58bbf340..1bd62809af92 100644
--- a/package/axfsutils/axfsutils.mk
+++ b/package/axfsutils/axfsutils.mk
@@ -8,7 +8,7 @@ AXFSUTILS_VERSION = 64886703fdff6cfc64eb20fbe7d7295bbeec867b
 AXFSUTILS_SITE = $(call github,jaredeh,axfs,$(AXFSUTILS_VERSION))
 AXFSUTILS_LICENSE = GPLv2
 AXFSUTILS_LICENSE_FILES = mkfs.axfs-legacy/COPYING
-AXFSUTILS_DEPENDENCIES = host-zlib
+HOST_AXFSUTILS_DEPENDENCIES = host-zlib
 
 # The 'new' mkfs.axfs version requires GNUstep which is not a buildroot
 # prerequisite. The 'legacy' one works just as well without that requirement.
-- 
2.1.0
