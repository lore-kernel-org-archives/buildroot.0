From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 29 Oct 2009 12:35:00 +0100
Subject: [Buildroot] [git commit master] toolchain/gcc: bump 4.4.x version
Message-ID: <20091029113533.C56C377764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=065d0e76dfe73948516c2fe3d7c06ec4b04bac3e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                                            |    2 +-
 .../gcc/{4.4.1 => 4.4.2}/100-uclibc-conf.patch     |    0
 .../{4.4.1 => 4.4.2}/301-missing-execinfo_h.patch  |    0
 .../gcc/{4.4.1 => 4.4.2}/302-c99-snprintf.patch    |    0
 .../305-libmudflap-susv3-legacy.patch              |    0
 .../810-arm-softfloat-libgcc.patch                 |    0
 toolchain/gcc/Config.in                            |    2 +-
 7 files changed, 2 insertions(+), 2 deletions(-)
 rename toolchain/gcc/{4.4.1 => 4.4.2}/100-uclibc-conf.patch (100%)
 rename toolchain/gcc/{4.4.1 => 4.4.2}/301-missing-execinfo_h.patch (100%)
 rename toolchain/gcc/{4.4.1 => 4.4.2}/302-c99-snprintf.patch (100%)
 rename toolchain/gcc/{4.4.1 => 4.4.2}/305-libmudflap-susv3-legacy.patch (100%)
 rename toolchain/gcc/{4.4.1 => 4.4.2}/810-arm-softfloat-libgcc.patch (100%)

diff --git a/CHANGES b/CHANGES
index 36a1372..b32fe0d 100644
--- a/CHANGES
+++ b/CHANGES
@@ -3,7 +3,7 @@
 	New packages: divine, gvfs, libarchive, libmicrohttpd,
 	sdl_sound, swfdec, sysstat
 
-	Updated/fixed packages: autoconf, busybox, directfb, dnsmasq,
+	Updated/fixed packages: autoconf, busybox, gcc, directfb, dnsmasq,
 	e2fsprogs, festival, gstreamer, gst-plugins-bad, gst-plugins-base,
 	gst-plugins-good, imagemagick, iptables, kernel-headers, kismet,
 	libelf, libevent, libglib2, liblockfile, libmad, libpcap, libupnp,
diff --git a/toolchain/gcc/4.4.1/100-uclibc-conf.patch b/toolchain/gcc/4.4.2/100-uclibc-conf.patch
similarity index 100%
rename from toolchain/gcc/4.4.1/100-uclibc-conf.patch
rename to toolchain/gcc/4.4.2/100-uclibc-conf.patch
diff --git a/toolchain/gcc/4.4.1/301-missing-execinfo_h.patch b/toolchain/gcc/4.4.2/301-missing-execinfo_h.patch
similarity index 100%
rename from toolchain/gcc/4.4.1/301-missing-execinfo_h.patch
rename to toolchain/gcc/4.4.2/301-missing-execinfo_h.patch
diff --git a/toolchain/gcc/4.4.1/302-c99-snprintf.patch b/toolchain/gcc/4.4.2/302-c99-snprintf.patch
similarity index 100%
rename from toolchain/gcc/4.4.1/302-c99-snprintf.patch
rename to toolchain/gcc/4.4.2/302-c99-snprintf.patch
diff --git a/toolchain/gcc/4.4.1/305-libmudflap-susv3-legacy.patch b/toolchain/gcc/4.4.2/305-libmudflap-susv3-legacy.patch
similarity index 100%
rename from toolchain/gcc/4.4.1/305-libmudflap-susv3-legacy.patch
rename to toolchain/gcc/4.4.2/305-libmudflap-susv3-legacy.patch
diff --git a/toolchain/gcc/4.4.1/810-arm-softfloat-libgcc.patch b/toolchain/gcc/4.4.2/810-arm-softfloat-libgcc.patch
similarity index 100%
rename from toolchain/gcc/4.4.1/810-arm-softfloat-libgcc.patch
rename to toolchain/gcc/4.4.2/810-arm-softfloat-libgcc.patch
diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index db7e32e..774057e 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -105,7 +105,7 @@ config BR2_GCC_VERSION
 	default "4.3.2"     if BR2_GCC_VERSION_4_3_2
 	default "4.3.3"     if BR2_GCC_VERSION_4_3_3
 	default "4.3.4"     if BR2_GCC_VERSION_4_3_4
-	default "4.4.1"     if BR2_GCC_VERSION_4_4_X
+	default "4.4.2"     if BR2_GCC_VERSION_4_4_X
 	default "4.3"       if BR2_GCC_VERSION_4_3
 
 config BR2_TOOLCHAIN_SYSROOT
-- 
1.6.3.3
