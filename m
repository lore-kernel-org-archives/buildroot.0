From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Nov 2016 10:57:43 +0100
Subject: [Buildroot] [git commit] olsr: fix package name display
Message-ID: <20161119095747.851DD818CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef5596aa03b6376604305b20527e6de51e2b6f11
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the package name, olsr, instead of the tarball file name.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/olsr/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/olsr/Config.in b/package/olsr/Config.in
index 2f3d024..85c5b4d 100644
--- a/package/olsr/Config.in
+++ b/package/olsr/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_OLSR
-	bool "olsrd"
+	bool "olsr"
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS
