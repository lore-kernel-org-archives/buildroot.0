From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Sun, 19 Aug 2012 16:18:30 -0400
Subject: [Buildroot] [PATCH 8/8] librsync: add license info
In-Reply-To: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
References: <1345407510-10058-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1345407510-10058-8-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/librsync/librsync.mk |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/librsync/librsync.mk b/package/librsync/librsync.mk
index 864297b..f0f543f 100644
--- a/package/librsync/librsync.mk
+++ b/package/librsync/librsync.mk
@@ -6,6 +6,8 @@
 LIBRSYNC_VERSION:=0.9.7
 LIBRSYNC_SOURCE:=librsync-$(LIBRSYNC_VERSION).tar.gz
 LIBRSYNC_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/librsync/
+LIBRSYNC_LICENSE = LGPLv2.1+
+LIBRSYNC_LICENSE_FILES = COPYING
 LIBRSYNC_INSTALL_STAGING = YES
 LIBRSYNC_DEPENDENCIES = zlib bzip2 popt
 
-- 
1.7.9.5
