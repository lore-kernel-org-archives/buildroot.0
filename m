From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon, 13 Jul 2015 16:57:12 +0200
Subject: [Buildroot] [PATCH] nfs-utils: Create missing directory sm.bak
Message-ID: <1436799432-24354-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/nfs-utils/S60nfs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/nfs-utils/S60nfs b/package/nfs-utils/S60nfs
index 5e2a2c9..e163d80 100755
--- a/package/nfs-utils/S60nfs
+++ b/package/nfs-utils/S60nfs
@@ -10,6 +10,7 @@
 
 mkdir -p /var/lock/subsys
 mkdir -p /run/nfs/sm
+mkdir -p /run/nfs/sm.bak
 touch /run/nfs/rmtab
 
 start() {
-- 
2.1.4
