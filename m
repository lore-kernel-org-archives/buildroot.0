From: Antoine Tenart <antoine.tenart@bootlin.com>
Date: Thu, 14 Jun 2018 13:44:15 +0200
Subject: [Buildroot] [PATCH] package/cryptodev-linux: add an hash for the
 license file
Message-ID: <20180614114415.2657-1-antoine.tenart@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a locally computed hash for the license file to track possible
updates.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
---
 package/cryptodev-linux/cryptodev-linux.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index ad7cb615e60b..eeb481d6aad9 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,2 +1,3 @@
 # Locally calculated
 sha256 994ed2f715dd3786f534d5215ae7ae4735b84cff28ea41080ff3501bf1503944 cryptodev-linux-f60aa08c63fc02780554a0a12180a478ca27d49f.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
-- 
2.17.1
