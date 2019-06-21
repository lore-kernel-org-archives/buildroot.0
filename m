From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Jun 2019 22:36:55 +0200
Subject: [Buildroot] [git commit] package/uboot-tools: fix legal-info
Message-ID: <20190621203651.075BF81191@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5540aac66be192a51e0e139714a37811b72e21f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add hash for LICENSE file

Fixes:

$: make uboot-tools-legal-info
 >>> uboot-tools 2019.04 Collecting legal info
 ERROR: No hash found for Licenses/gpl-2.0.txt

Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.hash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.hash b/package/uboot-tools/uboot-tools.hash
index 9a92018235..b8b06a2911 100644
--- a/package/uboot-tools/uboot-tools.hash
+++ b/package/uboot-tools/uboot-tools.hash
@@ -1,2 +1,3 @@
 # Locally computed:
 sha256  76b7772d156b3ddd7644c8a1736081e55b78828537ff714065d21dbade229bef  u-boot-2019.04.tar.bz2
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  Licenses/gpl-2.0.txt
