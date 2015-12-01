From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Dec 2015 23:21:18 -0000
Subject: [Buildroot] [git commit] cryptsetup: fix hash source link
Message-ID: <20151201232116.EEB4A7F9FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8058e622b5dd78b1ad9a11d2efd8fca5c2a8c98b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e770f95..8fbbc7d 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
 sha256	075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148	cryptsetup-1.7.0.tar.xz
