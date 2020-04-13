From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 13 Apr 2020 08:56:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/mc: fix gpm typo
Message-ID: <20200413065648.1086539-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix typo added by commit 9cae8f557b9d3f18ccf3694155f452d6b55de5f6

Fixes:
 - http://autobuild.buildroot.org/results/3c9eb8a0db26770e69d47eee70100a556dd130b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
2.25.1
