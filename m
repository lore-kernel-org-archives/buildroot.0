From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon,  1 Jul 2019 12:30:29 -0400
Subject: [Buildroot] [PATCH 1/1] Standardize my email address.
Message-ID: <20190701163029.5819-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

This changes the email address I use to just my standard aduskett at gmail.com
email address.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/heirloom-mailx/0002-fix-libressl-support.patch        | 4 ++--
 package/libglib2/0001-fix-compile-time-atomic-detection.patch | 2 +-
 package/libsepol/0001-support-static-only.patch               | 4 ++--
 package/libsepol/0002-revert-ln-relative.patch                | 2 +-
 ...auto-type-sizeof-rework-autotest-to-be-cross-compila.patch | 2 +-
 package/php/0003-configure-disable-the-phar-tool.patch        | 2 +-
 ...1-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch | 4 ++--
 package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch   | 4 ++--
 .../python3/0032-fix-building-on-older-distributions.patch    | 4 ++--
 package/setools/0001-remove-werror-flag-from-setup.patch      | 4 ++--
 ...Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch | 2 +-
 package/systemd/0001-install-don-t-use-ln-relative.patch      | 4 ++--
 12 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/heirloom-mailx/0002-fix-libressl-support.patch b/package/heirloom-mailx/0002-fix-libressl-support.patch
index 0fafa4ae0b..b54aaaf73c 100644
--- a/package/heirloom-mailx/0002-fix-libressl-support.patch
+++ b/package/heirloom-mailx/0002-fix-libressl-support.patch
@@ -1,5 +1,5 @@
 From aad28d30af6c3a74c522dd61943788e908860c84 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Fri, 4 Aug 2017 07:22:47 -0400
 Subject: [PATCH] fix libressl support
 
@@ -10,7 +10,7 @@ heirloom-mailx has two small issues when compiling against LibreSSL:
   - SSLv3_client_method function is used (LibreSSL does not support SSLv3)
     Solution: "Guard" the code with #ifndef OPENSSL_NO_SSL3
 
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  openssl.c | 7 +++++++
  1 file changed, 7 insertions(+)
diff --git a/package/libglib2/0001-fix-compile-time-atomic-detection.patch b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
index 527757d9c5..9d30468bdf 100644
--- a/package/libglib2/0001-fix-compile-time-atomic-detection.patch
+++ b/package/libglib2/0001-fix-compile-time-atomic-detection.patch
@@ -9,7 +9,7 @@ Upstream-Status: Merged
 See : https://gitlab.gnome.org/GNOME/glib/issues/1063
 
 Signed-off-by: Brendan Heading <brendanheading@gmail.com>
-Signed-off-by: Adam Duskett <aduskett@codeblue.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  glib/gthread-posix.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/libsepol/0001-support-static-only.patch b/package/libsepol/0001-support-static-only.patch
index f475dcad18..b3eb608f7b 100644
--- a/package/libsepol/0001-support-static-only.patch
+++ b/package/libsepol/0001-support-static-only.patch
@@ -1,5 +1,5 @@
 From 2140db697c7f1da2a0a3f7bbcb14c1a0dade84e5 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 9 Oct 2017 16:28:12 -0400
 Subject: [PATCH] Add support for static-only build
 
@@ -10,7 +10,7 @@ libraries. It allows to support cases where the target architecture
 does not have support for shared libraries.
 
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
 ---
diff --git a/package/libsepol/0002-revert-ln-relative.patch b/package/libsepol/0002-revert-ln-relative.patch
index acac908be0..40dabc38de 100644
--- a/package/libsepol/0002-revert-ln-relative.patch
+++ b/package/libsepol/0002-revert-ln-relative.patch
@@ -1,5 +1,5 @@
 From 16b2b0e21e10727065042a1baabd1a887757c65c Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 9 Oct 2017 16:29:36 -0400
 Subject: [PATCH] Makefile: revert libsepol: use ln --relative to create .so symlinks
 
diff --git a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
index 5b1a50b264..332cb85bb3 100644
--- a/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
+++ b/package/nginx/0001-auto-type-sizeof-rework-autotest-to-be-cross-compila.patch
@@ -15,7 +15,7 @@ Refresh for 1.8.0.
 Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
 [martin at barkynet.com: Updated for 1.10.0]
 Signed-off-by: Martin Bark <martin@barkynet.com>
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Refresh for 1.12.0
 ---
  auto/types/sizeof | 37 ++++++++++++++++++++++++++++---------
diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index 396a806496..829cdf9f91 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -10,7 +10,7 @@ on the target.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 [Gustavo: update for autoreconf/configure.in]
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [Aduskett: update for 7.3.0]
 ---
  configure.ac | 9 ++-------
diff --git a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
index 4cfe969a40..57833d8176 100644
--- a/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
+++ b/package/policycoreutils/0001-Add-DESTDIR-to-all-paths-that-use-an-absolute-path.patch
@@ -1,5 +1,5 @@
 From 85763549c53b2907dab094163f1404b2233f8029 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 9 Oct 2017 16:51:20 -0400
 Subject: [PATCH] Add DESTDIR to setfiles
 
@@ -12,7 +12,7 @@ accomodate version 2.5
 
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
 ---
diff --git a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
index 0b53044180..ffe5fcbd44 100644
--- a/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
+++ b/package/policycoreutils/0002-Add-PREFIX-to-host-paths.patch
@@ -1,5 +1,5 @@
 From a221304344b3f9db7e86d928cf97d77542bcf456 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Mon, 9 Oct 2017 16:47:19 -0400
 Subject: [PATCH] Add PREFIX to host paths
 
@@ -10,7 +10,7 @@ Updated to work with version 2.5
 
 Signed-off-by: Clayton Shotwell <clayton.shotwell@rockwellcollins.com>
 Signed-off-by: Niranjan Reddy <niranjan.reddy@rockwellcollins.com>
-Signed-off-by: Adam Duskett <AdamDuskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Update for 2.8]
 ---
diff --git a/package/python3/0032-fix-building-on-older-distributions.patch b/package/python3/0032-fix-building-on-older-distributions.patch
index 0f7ee2a25f..8b848d383d 100644
--- a/package/python3/0032-fix-building-on-older-distributions.patch
+++ b/package/python3/0032-fix-building-on-older-distributions.patch
@@ -1,5 +1,5 @@
 From ba10bac420398270a0b992e85d93383373d5fcac Mon Sep 17 00:00:00 2001
-From: Adam Duskett <aduskett@greenlots.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 16 Aug 2018 14:52:37 -0700
 Subject: [PATCH] fix building on older distributions
 
@@ -15,7 +15,7 @@ safe to change os.replace back to os.rename.
 This change fixes building on older systems such as CentOS7, that only come
 with python 2.
 
-Signed-off-by: Adam Duskett <aduskett@greenlots.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  Tools/scripts/update_file.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/setools/0001-remove-werror-flag-from-setup.patch b/package/setools/0001-remove-werror-flag-from-setup.patch
index b1446e2ec3..4f6d2efb96 100644
--- a/package/setools/0001-remove-werror-flag-from-setup.patch
+++ b/package/setools/0001-remove-werror-flag-from-setup.patch
@@ -1,12 +1,12 @@
 From b2fe84bfd00117d4897f1f2e8f83d3410eb188b8 Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Thu, 12 Oct 2017 22:04:58 -0400
 Subject: [PATCH] remove werror flag from setup
 
 Compilers older than gcc6 will generate uninitialized variable warnings which
 will cause compiling to fail.
 
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  setup.py | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
diff --git a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
index 1ef1cd69bc..508087ff2c 100644
--- a/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
+++ b/package/setools/0002-Do-not-export-use-setools.InfoFlowAnalysis-and-setoo.patch
@@ -12,7 +12,7 @@ Therefore it's better to use setools.infoflow.InfoFlowAnalysis and
 setools.dta.DomainTransitionAnalysis and let the package containing
 sedta and seinfoflow to require python3-networkx
 
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 ---
  sedta                       | 3 ++-
  seinfoflow                  | 3 ++-
diff --git a/package/systemd/0001-install-don-t-use-ln-relative.patch b/package/systemd/0001-install-don-t-use-ln-relative.patch
index 7933207780..d00a8db63f 100644
--- a/package/systemd/0001-install-don-t-use-ln-relative.patch
+++ b/package/systemd/0001-install-don-t-use-ln-relative.patch
@@ -1,5 +1,5 @@
 From 7f4a12d25bbb5859d266f32f7a3d794bb62c354e Mon Sep 17 00:00:00 2001
-From: Adam Duskett <Adamduskett@outlook.com>
+From: Adam Duskett <aduskett@gmail.com>
 Date: Sun, 31 Dec 2017 12:46:04 -0500
 Subject: [PATCH] install: don't use ln --relative
 
@@ -20,7 +20,7 @@ while we do :  /usr/sbin/foo -> ../../usr/bin/foo
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 [aduskett at gmail.com: Added meson.build section and dirname wrapper in add-wants]
 [aduskett at gmail.com: Update for systemd v237]
-Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
+Signed-off-by: Adam Duskett <aduskett@gmail.com>
 [tpiepho at impinj.com: Fix add-wants wrapper]
 Signed-off-by: Trent Piepho <tpiepho@impinj.com>
 ---
-- 
2.21.0
