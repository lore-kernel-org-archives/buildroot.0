From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 17 Jan 2018 10:50:14 +0100
Subject: [Buildroot] [PATCH] DEVELOPERS: add myself to SELinux related
 packages
Message-ID: <20180117095014.32665-1-marcus.folkesson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 DEVELOPERS | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 0e754456cb..fe2c230142 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1070,6 +1070,10 @@ F:	package/libkcapi/
 
 N:	Marcus Folkesson <marcus.folkesson@gmail.com>
 F:	package/libostree/
+F:	package/libselinux/
+F:	package/libsemanage/
+F:	package/libsepol/
+F:	package/selinux-python/
 F:	utils/config
 F:	utils/diffconfig
 
-- 
2.15.1
