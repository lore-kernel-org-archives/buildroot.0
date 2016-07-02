From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:46 +0200
Subject: [Buildroot] [PATCH 17/69] heimdal: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-18-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/heimdal/heimdal.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index 626e68e9469b..8199229c727d 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -6,7 +6,7 @@
 
 HEIMDAL_VERSION = 1.6rc2
 HEIMDAL_SITE = http://www.h5l.org/dist/src
-HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
+HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf
 HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
-- 
2.1.0
