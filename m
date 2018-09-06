From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Sep 2018 21:40:54 +0200
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline: add hash
 file for tarball
Message-ID: <20180906194808.19F4682B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5f5d8b730cf40976cc6266845b21e11875f42c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

sunxi-mali-mainline package has not hash file.

Add hash file with sha256sum for tarball resulting from git download.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sunxi-mali-mainline/sunxi-mali-mainline.hash | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
new file mode 100644
index 0000000000..5d9d1a52b4
--- /dev/null
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
