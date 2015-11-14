From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 14 Nov 2015 23:04:14 +0100
Subject: [Buildroot] [git commit branch/next] cryptsetup: fix hash source
	link
Message-ID: <20151114222605.0C9EB81A1D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8058e622b5dd78b1ad9a11d2efd8fca5c2a8c98b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptsetup/cryptsetup.hash |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cryptsetup/cryptsetup.hash b/package/cryptsetup/cryptsetup.hash
index e770f95..8fbbc7d 100644
--- a/package/cryptsetup/cryptsetup.hash
+++ b/package/cryptsetup/cryptsetup.hash
@@ -1,2 +1,2 @@
-# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.6/sha256sums.asc
+# From https://www.kernel.org/pub/linux/utils/cryptsetup/v1.7/sha256sums.asc
 sha256	075524a7cc0db36d12119fa79116750accb1c6c8825d5faa2534b74b8ce3d148	cryptsetup-1.7.0.tar.xz
