From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 16 Mar 2015 15:31:34 +0200
Subject: [Buildroot] [PATCH] network-manager: add upstream hash origin
Message-ID: <090227948fb9d30792dcbc78385333cc261d5fa1.1426512694.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The commit log in c511ca937d4 (network-manager: add hash file) claimed to fix
hash origin, but didn't actually do so.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/network-manager/network-manager.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index 07513a923c4a..401108eef557 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,2 +1,2 @@
-# Locally computed:
+# From http://ftp.gnome.org/pub/GNOME/sources/NetworkManager/1.0/NetworkManager-1.0.0.sha256sum
 sha256  3a66afec670c975edd9832e620b725a5f16ed267a1b9e1b2d51ef27250d85947  NetworkManager-1.0.0.tar.xz
-- 
2.1.4
