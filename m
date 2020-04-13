From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 13 Apr 2020 08:56:16 +0200
Subject: [Buildroot] [PATCH 1/1] package/mc: fix typo in gpm dependency
Message-ID: <20200413065616.20674-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/3c9/3c9eb8a0db26770e69d47eee70100a556dd130b3/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mc/mc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mc/mc.mk b/package/mc/mc.mk
index 3deffeefee..f83905d89b 100644
--- a/package/mc/mc.mk
+++ b/package/mc/mc.mk
@@ -11,7 +11,7 @@ MC_LICENSE = GPL-3.0+
 MC_LICENSE_FILES = COPYING
 MC_DEPENDENCIES = libglib2 host-pkgconf
 
-ifeq ($(BR2_PACKAGE_GMP),y)
+ifeq ($(BR2_PACKAGE_GPM),y)
 MC_CONF_OPTS += --with-gpm-mouse
 MC_DEPENDENCIES += gpm
 else
-- 
2.25.0
