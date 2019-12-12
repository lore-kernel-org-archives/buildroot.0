From: Aleksander Morgado <aleksander@aleksander.es>
Date: Thu, 12 Dec 2019 10:14:57 +0100
Subject: [Buildroot] [PATCH] libqmi: bump to version 1.24.2
Message-ID: <20191212091457.1943616-1-aleksander@aleksander.es>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Aleksander Morgado <aleksander@aleksander.es>
---

Hey!

There was a patch suggested for libqmi 1.24.0 in buildroot that didn't get merged yet, but it is no longer required with 1.24.2 as it was already included upstream, so please make sure it's dropped:
https://patchwork.ozlabs.org/patch/1186596/

Cheers!

---
 package/libqmi/libqmi.hash | 2 +-
 package/libqmi/libqmi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libqmi/libqmi.hash b/package/libqmi/libqmi.hash
index b0a703f3bd..6936fa6de9 100644
--- a/package/libqmi/libqmi.hash
+++ b/package/libqmi/libqmi.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256	aeb69f90c273467cce246176cba0967c6413f1995a976992770a597c4fe28c79  libqmi-1.24.0.tar.xz
+sha256	4ae4e476f960dbc0d04b1c0368776eb78edffd4421f3e4c074bb2bfb6375b282  libqmi-1.24.2.tar.xz
 sha256	8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/libqmi/libqmi.mk b/package/libqmi/libqmi.mk
index 62aa176e4f..51ddd2745f 100644
--- a/package/libqmi/libqmi.mk
+++ b/package/libqmi/libqmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-LIBQMI_VERSION = 1.24.0
+LIBQMI_VERSION = 1.24.2
 LIBQMI_SITE = http://www.freedesktop.org/software/libqmi
 LIBQMI_SOURCE = libqmi-$(LIBQMI_VERSION).tar.xz
 LIBQMI_LICENSE = LGPL-2.0+ (library), GPL-2.0+ (programs)
--
2.24.0
