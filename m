From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 Aug 2018 10:49:03 +0200
Subject: [Buildroot] [PATCH 3/3] sunxi-mali-mainline-driver: add hash file
 for git tarball
In-Reply-To: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
References: <20180827084903.111735-1-giulio.benetti@micronovasrl.com>
Message-ID: <20180827084903.111735-3-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is not hash file in sunxi-mali-mainline-driver package.

Create sunxi-mali-mainline-driver.hash and add sha256 for git tarball.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 .../sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash  | 2 ++
 1 file changed, 2 insertions(+)
 create mode 100644 package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash

diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
new file mode 100644
index 0000000000..bcc794743d
--- /dev/null
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 9f479f8ac5e013e33568901b942baf6797464ea9b7f340ee38cd469b4fd2b038  sunxi-mali-mainline-driver-8e6b7d25b13089d53dbfc1ebd9e8737b0dc809cb.tar.gz
-- 
2.17.1
