From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Aug 2018 15:38:42 +0200
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-mainline: add hash file for
 tarball
Message-ID: <20180825133843.116694-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

sunxi-mali-mainline package has not hash file.

Add hash file with sha256sum for tarball resulting from git download.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-mainline/sunxi-mali-mainline.hash | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sunxi-mali-mainline/sunxi-mali-mainline.hash

diff --git a/package/sunxi-mali-mainline/sunxi-mali-mainline.hash b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
new file mode 100644
index 0000000000..5d9d1a52b4
--- /dev/null
+++ b/package/sunxi-mali-mainline/sunxi-mali-mainline.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 72969ecf470b9e5ce787c2f8f36242926e1e892af0891924ee59a2cd206de39f  sunxi-mali-mainline-d691cb93884ca8ac67860502117bbec283dc19aa.tar.gz
-- 
2.17.1
