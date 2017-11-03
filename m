From: Samuel Martin <s.martin49@gmail.com>
Date: Fri,  3 Nov 2017 11:37:05 +0100
Subject: [Buildroot] [PATCH 30/31] package/util-linux: add license hash
In-Reply-To: <20171103103706.25574-1-s.martin49@gmail.com>
References: <20171103103706.25574-1-s.martin49@gmail.com>
Message-ID: <20171103103706.25574-31-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/util-linux/util-linux.hash | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 2c010797b5..65c63a0153 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,2 +1,9 @@
 # From https://www.kernel.org/pub/linux/utils/util-linux/v2.31/sha256sums.asc
 sha256 f9be7cdcf4fc5c5064a226599acdda6bdf3d86c640152ba01ea642d91108dc8a  util-linux-2.31.tar.xz
+# Locally computed
+sha256 1e4b65802b0df8115395c697029d03339f983d451a473a08643309c684410d9a  README.licensing
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Documentation/licenses/COPYING.GPLv2
+sha256 ba7640f00d93e72e92b94b9d71f25ec53bac2f1682f5c4adcccb0018359f60f8  Documentation/licenses/COPYING.UCB
+sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  Documentation/licenses/COPYING.LGPLv2.1
+sha256 9b718a9460fed5952466421235bc79eb49d4e9eacc920d7a9dd6285ab8fd6c6d  Documentation/licenses/COPYING.BSD-3
+sha256 996126b78a42dd2eeea1256d78b7fd6dec090ea196365c0ccb46adc32bc92460  sys-utils/rfkill.c
-- 
2.15.0
