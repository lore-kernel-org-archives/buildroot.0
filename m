From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 26 Dec 2020 18:26:58 +0100
Subject: [Buildroot] [git commit] package/opencv3: bump to version 3.4.13
Message-ID: <20201226170943.AD40D88162@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3cfb8a8393a1683846e3df3fc2cf67a865ff6a51
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/opencv/opencv/wiki/ChangeLog#version3413

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.hash | 2 +-
 package/opencv3/opencv3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 545108a738..04eed67cfe 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c8919dfb5ead6be67534bf794cb0925534311f1cd5c6680f8164ad1813c88d13  opencv3-3.4.12.tar.gz
+sha256  70230049194ae03ed8bfaab6cd1388569aa1b5c482d8b50d3af1cd2ae5a0b95d  opencv3-3.4.13.tar.gz
 sha256  a5a7cf90fe5ac9763baad852cf69cf9d9b89bff934a679fdc5c8fcecaeba9a25  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 3e3e5987a5..2bf70261c7 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.12
+OPENCV3_VERSION = 3.4.13
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
