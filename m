From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 28 Oct 2016 15:17:43 +0200
Subject: [Buildroot] [git commit] package/libglob: fix license typo
Message-ID: <20161028131746.6FEC281836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=566858f6a1d65dda466942e4c84e40e3ce95e06f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libglob/libglob.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libglob/libglob.mk b/package/libglob/libglob.mk
index 534f936..cd6922e 100644
--- a/package/libglob/libglob.mk
+++ b/package/libglob/libglob.mk
@@ -7,7 +7,7 @@
 LIBGLOB_VERSION = 1.0
 LIBGLOB_SITE = $(call github,voidlinux,libglob,$(LIBGLOB_VERSION))
 LIBGLOB_LICENSE = BSD-3c
-LIBGLOB_LICENSE_FILE = LICENSE
+LIBGLOB_LICENSE_FILES = LICENSE
 LIBGLOB_INSTALL_STAGING = YES
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
