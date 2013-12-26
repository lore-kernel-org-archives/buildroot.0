From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 26 Dec 2013 10:02:26 +0800
Subject: [Buildroot] [PATCH] cramfs: add licensing info
Message-ID: <1388023346.6811.1.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/cramfs/cramfs.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cramfs/cramfs.mk b/package/cramfs/cramfs.mk
index 0f29dd0..710aaa8 100644
--- a/package/cramfs/cramfs.mk
+++ b/package/cramfs/cramfs.mk
@@ -6,6 +6,8 @@
 
 CRAMFS_VERSION = 1.1
 CRAMFS_SITE = http://downloads.sourceforge.net/project/cramfs/cramfs/$(CRAMFS_VERSION)
+CRAMFS_LICENSE = GPLv2+
+CRAMFS_LICENSE_FILES = COPYING
 
 CRAMFS_DEPENDENCIES = zlib
 
-- 
1.8.1.2
