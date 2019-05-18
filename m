From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 18 May 2019 21:57:05 +0200
Subject: [Buildroot] [git commit branch/next] package/cog: mark for
 installation to the staging tree
Message-ID: <20190518195121.3F225810CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=085165153a9a8afe90e908002a04cf9caf81bbf1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The cog package includes libraries and headers, so installing it
to the staging tree allows having those available for development.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
