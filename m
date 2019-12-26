From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 26 Dec 2019 23:41:05 +0100
Subject: [Buildroot] [PATCH 1/1] package/ecryptfs-utils: add hash for
 license file
Message-ID: <20191226224105.266292-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ecryptfs-utils/ecryptfs-utils.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ecryptfs-utils/ecryptfs-utils.hash b/package/ecryptfs-utils/ecryptfs-utils.hash
index 1e08661e25..8a0b111e5c 100644
--- a/package/ecryptfs-utils/ecryptfs-utils.hash
+++ b/package/ecryptfs-utils/ecryptfs-utils.hash
@@ -2,3 +2,4 @@
 md5 83513228984f671930752c3518cac6fd  ecryptfs-utils_111.orig.tar.gz
 # Locally computed
 sha256 112cb3e37e81a1ecd8e39516725dec0ce55c5f3df6284e0f4cc0f118750a987f  ecryptfs-utils_111.orig.tar.gz
+sha256 91df39d1816bfb17a4dda2d3d2c83b1f6f2d38d53e53e41e8f97ad5ac46a0cad  COPYING
-- 
2.24.0
