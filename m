From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:32 +0200
Subject: [Buildroot] [PATCH 03/69] bdwgc: add explicit dependencies for host
	variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-4-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/bdwgc/bdwgc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index 4603151166fd..0e9054df3c69 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -11,6 +11,7 @@ BDWGC_INSTALL_STAGING = YES
 BDWGC_LICENSE = bdwgc license
 BDWGC_LICENSE_FILES = README.QUICK
 BDWGC_DEPENDENCIES = libatomic_ops host-pkgconf
+HOST_BDWGC_DEPENDENCIES = host-libatomic_ops host-pkgconf
 
 # The libtool shipped with the package is bogus and generates some
 # -L/usr/lib flags. It uses a version not supported by Buildroot
-- 
2.1.0
