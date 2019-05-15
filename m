From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed, 15 May 2019 21:38:54 +0300
Subject: [Buildroot] [PATCH 1/1] package/cog: mark for installation to the
 staging tree
Message-ID: <20190515183854.28123-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 43f13152c8..44ea62185d 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -6,6 +6,7 @@
 
 COG_VERSION = v0.2.0
 COG_SITE = $(call github,Igalia,cog,$(COG_VERSION))
+COG_INSTALL_STAGING = YES
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
 COG_LICENSE = MIT
 COG_LICENSE_FILES = COPYING
-- 
2.21.0
