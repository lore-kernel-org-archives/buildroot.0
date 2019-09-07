From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 7 Sep 2019 23:06:26 +0200
Subject: [Buildroot] [git commit] package/libdvdread: bump version to 6.0.1
Message-ID: <20190907211229.54BC98D3E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19626437f1b5b17d0934df03d694223d1498dde1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://code.videolan.org/videolan/libdvdread/blob/master/NEWS

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libdvdread/libdvdread.hash | 4 ++--
 package/libdvdread/libdvdread.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdvdread/libdvdread.hash b/package/libdvdread/libdvdread.hash
index 44a3f98468..e21d6002dc 100644
--- a/package/libdvdread/libdvdread.hash
+++ b/package/libdvdread/libdvdread.hash
@@ -1,5 +1,5 @@
-# From http://download.videolan.org/pub/videolan/libdvdread/6.0.0/libdvdread-6.0.0.tar.bz2.sha256
-sha256	b33b1953b4860545b75f6efc06e01d9849e2ea4f797652263b0b4af6dd10f935	libdvdread-6.0.0.tar.bz2
+# From http://download.videolan.org/pub/videolan/libdvdread/6.0.1/libdvdread-6.0.1.tar.bz2.sha256
+sha256	28ce4f0063883ca4d37dfd40a2f6685503d679bca7d88d58e04ee8112382d5bd	libdvdread-6.0.1.tar.bz2
 
 # Hash for license file:
 sha256	d6cb0e9e560f51085556949a84af12b79a00f10ab8b66c752537faf7cd665572	COPYING
diff --git a/package/libdvdread/libdvdread.mk b/package/libdvdread/libdvdread.mk
index f41a188f8e..10255a1616 100644
--- a/package/libdvdread/libdvdread.mk
+++ b/package/libdvdread/libdvdread.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDVDREAD_VERSION = 6.0.0
+LIBDVDREAD_VERSION = 6.0.1
 LIBDVDREAD_SOURCE = libdvdread-$(LIBDVDREAD_VERSION).tar.bz2
 LIBDVDREAD_SITE = http://www.videolan.org/pub/videolan/libdvdread/$(LIBDVDREAD_VERSION)
 LIBDVDREAD_INSTALL_STAGING = YES
