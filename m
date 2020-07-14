From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:06:16 +0200
Subject: [Buildroot] [git commit] package/exiv2: really disable samples
Message-ID: <20200714130313.88E4F86EF6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=918842133127e1f95a7ba5e8832d81f439c0cff3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

EXIV2_ENABLE_BUILD_SAMPLES has been renamed into EXIV2_BUILD_SAMPLES
since version 0.27 and
https://github.com/Exiv2/exiv2/commit/60d436c96960fa314e2d12d017440253ce280d51

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/exiv2/exiv2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exiv2/exiv2.mk b/package/exiv2/exiv2.mk
index 7f38473609..fa19a76282 100644
--- a/package/exiv2/exiv2.mk
+++ b/package/exiv2/exiv2.mk
@@ -10,7 +10,7 @@ EXIV2_INSTALL_STAGING = YES
 EXIV2_LICENSE = GPL-2.0+
 EXIV2_LICENSE_FILES = COPYING
 
-EXIV2_CONF_OPTS += -DEXIV2_ENABLE_BUILD_SAMPLES=OFF
+EXIV2_CONF_OPTS += -DEXIV2_BUILD_SAMPLES=OFF
 
 # The following CMake variable disables a TRY_RUN call in the -pthread
 # test which is not allowed when cross-compiling.
