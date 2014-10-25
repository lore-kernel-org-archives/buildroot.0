From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:25:33 +0200
Subject: [Buildroot] [git commit] package/*: update snapshot.debian.org
	snapshot dates
Message-ID: <20141025095905.505E5B13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=da330e508c2d95e898ac52a2aa39426a5f6d0506
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/alsamixergui/alsamixergui.mk     |    2 +-
 package/cdrkit/cdrkit.mk                 |    2 +-
 package/heirloom-mailx/heirloom-mailx.mk |    2 +-
 package/libaio/libaio.mk                 |    2 +-
 package/rt-tests/rt-tests.mk             |    2 +-
 package/setserial/setserial.mk           |    2 +-
 6 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/alsamixergui/alsamixergui.mk b/package/alsamixergui/alsamixergui.mk
index c762543..4f21127 100644
--- a/package/alsamixergui/alsamixergui.mk
+++ b/package/alsamixergui/alsamixergui.mk
@@ -6,7 +6,7 @@
 
 ALSAMIXERGUI_VERSION = 0.9.0rc2-1
 ALSAMIXERGUI_SOURCE = alsamixergui_$(ALSAMIXERGUI_VERSION).orig.tar.gz
-ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20080319T000000Z/pool/main/a/alsamixergui
+ALSAMIXERGUI_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/a/alsamixergui
 ALSAMIXERGUI_AUTORECONF = YES
 
 ALSAMIXERGUI_CONF_ENV = ac_cv_lib_fltk_numericsort=yes \
diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 3f2b429..2e4bb1f 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -6,7 +6,7 @@
 
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
-CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20101018T151929Z/pool/main/c/cdrkit/
+CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
diff --git a/package/heirloom-mailx/heirloom-mailx.mk b/package/heirloom-mailx/heirloom-mailx.mk
index c1e3ed1..7343479 100644
--- a/package/heirloom-mailx/heirloom-mailx.mk
+++ b/package/heirloom-mailx/heirloom-mailx.mk
@@ -6,7 +6,7 @@
 
 HEIRLOOM_MAILX_VERSION = 12.5
 HEIRLOOM_MAILX_SOURCE = heirloom-mailx_$(HEIRLOOM_MAILX_VERSION).orig.tar.gz
-HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20110427T035506Z/pool/main/h/heirloom-mailx
+HEIRLOOM_MAILX_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/h/heirloom-mailx
 HEIRLOOM_MAILX_LICENSE = BSD-4c, Bellcore (base64), OpenVision (imap_gssapi), RSA Data Security (md5), Network Working Group (hmac), MPLv1.1 (nss)
 HEIRLOOM_MAILX_LICENSE_FILES = COPYING
 
diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index 3988d65..53ad7eb 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -6,7 +6,7 @@
 
 LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
-LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio
+LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/liba/libaio
 LIBAIO_INSTALL_STAGING = YES
 LIBAIO_LICENSE = LGPLv2.1+
 LIBAIO_LICENSE_FILES = COPYING
diff --git a/package/rt-tests/rt-tests.mk b/package/rt-tests/rt-tests.mk
index caa7959..94f4b1e 100644
--- a/package/rt-tests/rt-tests.mk
+++ b/package/rt-tests/rt-tests.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20111202T222101Z/pool/main/r/rt-tests
+RT_TESTS_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/r/rt-tests
 RT_TESTS_VERSION = 0.83
 RT_TESTS_SOURCE = rt-tests_$(RT_TESTS_VERSION).orig.tar.gz
 RT_TESTS_LICENSE = GPLv2+
diff --git a/package/setserial/setserial.mk b/package/setserial/setserial.mk
index ffdf129..561fbe9 100644
--- a/package/setserial/setserial.mk
+++ b/package/setserial/setserial.mk
@@ -7,7 +7,7 @@
 SETSERIAL_VERSION = 2.17
 SETSERIAL_PATCH = setserial_2.17-45.3.diff.gz
 SETSERIAL_SOURCE = setserial_$(SETSERIAL_VERSION).orig.tar.gz
-SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20131001T214925Z/pool/main/s/setserial
+SETSERIAL_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/s/setserial
 SETSERIAL_LICENSE = GPLv2
 SETSERIAL_LICENSE_FILES = debian/copyright
 # make all also builds setserial.cat which needs nroff
