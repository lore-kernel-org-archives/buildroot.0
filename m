From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 29 Aug 2020 20:38:56 +0200
Subject: [Buildroot] [git commit] CHANGES: fix typos in 2020.08-rcX notes
Message-ID: <20200829183157.1E5E887145@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2915d1bd323bde196f5492c09665285d6b96a493
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 CHANGES | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/CHANGES b/CHANGES
index 251d664d69..ea2749788e 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,7 +2,7 @@
 
 	Fixes all over the tree.
 
-	Infrastructure: Ensure RPATH entries thay may be needed for
+	Infrastructure: Ensure RPATH entries that may be needed for
 	dlopen() are not dropped by patchelf.
 
 	Toolchain: Drop old GCC 6 based external Sourcery AMD64
@@ -57,7 +57,7 @@
 
 	#12876: nodejs fails to build when host-icu has been built before
 	#13111: python-gunicorn: missing dependency on python-setuptools
-	#12121: wpa_supplicant fails to build without libopenssl enabled
+	#13121: wpa_supplicant fails to build without libopenssl enabled
 	#13146: raspberrypi3_defconfig: "Inappropriate ioctl for device"..
 	#13156: package live555 new license
 	#13166: python-rpi-gpio: does not work against aarch64, unint..
