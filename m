From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 23 Jan 2010 23:08:25 +0100
Subject: [Buildroot] [git commit master] toolchain/gcc: bump 4.4.x version
Message-ID: <20100124202019.5B82E776BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6c26a600d0e328c1ab4a31b6e33f2d26baffc3c3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../gcc/{4.4.2 => 4.4.3}/100-uclibc-conf.patch     |    0
 .../{4.4.2 => 4.4.3}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.2 => 4.4.3}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 toolchain/gcc/Config.in                            |    2 +-
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/gcc/{4.4.2 => 4.4.3}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.4.2 => 4.4.3}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.4.2 => 4.4.3}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.4.2 => 4.4.3}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.4.2 => 4.4.3}/810-arm-softfloat-libgcc.patch (100%)

diff --git a/CHANGES b/CHANGES
index 4f780e7..a53c568 100644
--- a/CHANGES
+++ b/CHANGES
@@ -1,6 +1,6 @@
 2010.02, Not yet released:
 
-	Toolchain: uClibc 0.9.30.2
+	Toolchain: uClibc 0.9.30.2, gcc 4.4.3
 
 	New packages: libcdaudio, libdvdnav, libdvdread, hostapd, tcpreplay
 
diff --git a/toolchain/gcc/4.4.2/100-uclibc-conf.patch b/toolchain/gcc/4.4.3/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.2/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.3/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.2/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.3/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.2/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.3/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.2/302-c99-snprintf.patch b/toolchain/gcc/4.4.3/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.2/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.3/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.2/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.3/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.2/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.3/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.2/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.3/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.2/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.3/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 10cb841..847a2eb 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -88,7 +88,7 @@ config BR2_GCC_VERSION
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
-	default "4.4.2"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.3"     if BR2_GCC_VERSION_4_4_X
 	default $BR2_GCC_SNAP_DATE if BR2_GCC_VERSION_SNAP
 
 config BR2_TOOLCHAIN_SYSROOT
-- 
1.6.3.3
