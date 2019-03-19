From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 19 Mar 2019 20:10:26 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/flashrom: remove
 x86 dependency
Message-ID: <20190319191327.D042881E5A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=746578764eceb01a5dc6811686ece86e104b24b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit c125d445b018cca576c8ab1c20244116f434ee30)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/flashrom/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/flashrom/Config.in b/package/flashrom/Config.in
index f787bb3b62..948c774133 100644
--- a/package/flashrom/Config.in
+++ b/package/flashrom/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_FLASHROM
 	bool "flashrom"
-	depends on BR2_i386 || BR2_x86_64
 	help
 	  flashrom is a utility for identifying, reading, writing,
 	  verifying and erasing flash chips. It is designed to flash
