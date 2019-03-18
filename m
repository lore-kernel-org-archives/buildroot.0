From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Mar 2019 22:10:20 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/libiio: bump to
 version 0.15
Message-ID: <20190318210758.9891B8B8A7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=268ff8cdca6ecb1996074e3c9041d4fc1df6abd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

This change bumps libiio, to version 0.15.
This version is currently the most stable version in the series. It
contains several fixes over 0.14.

0.16 & 0.17 have been released but they have some issues with backwards
compatibility, so they are not yet recommended.

Changelog for version 0.15 (over 0.14).
Link:
  https://github.com/analogdevicesinc/libiio/releases/tag/v0.15

Signed-off-by: Alexandru Ardelean <ardeleanalex@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 8478bd526f2369addf98579804bbbee01334a024)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiio/libiio.hash | 2 +-
 package/libiio/libiio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.hash b/package/libiio/libiio.hash
index fbb4bccb90..800b2ee8f4 100644
--- a/package/libiio/libiio.hash
+++ b/package/libiio/libiio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 12063db7a9366aa00bfd789db30afaddb29686bc29b3ce1e5d4adfe1c3b42527  libiio-0.14.tar.gz
+sha256 a729f8ff48137ad271a3e2951f322b35c1bf2ec075b488d75c8bd071c693fd19  libiio-0.15.tar.gz
 sha256 102900208eef27b766380135906d431dba87edaa7ec6aa72e6ebd3dd67f3a97b  COPYING.txt
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index d2376bca34..2371a71063 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIIO_VERSION = 0.14
+LIBIIO_VERSION = 0.15
 LIBIIO_SITE = $(call github,analogdevicesinc,libiio,v$(LIBIIO_VERSION))
 LIBIIO_INSTALL_STAGING = YES
 LIBIIO_LICENSE = LGPL-2.1+
