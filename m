From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 14 Nov 2015 23:25:19 +0200
Subject: [Buildroot] [PATCH next] cryptsetup: fix hash source link
Message-ID: <d1579e432c34bfb462bef4142262658db0c2c47a.1447536319.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e770f957df85..8fbbc7d3fb4c 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
 sha256	075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148	cryptsetup-1.7.0.tar.xz
-- 
2.6.2
