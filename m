From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 1 Jun 2017 16:27:13 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/libmicrohttpd:
	security bump version to 0.9.55
Message-ID: <20170601144623.C5FAB7FC9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d0dc5fc6b081c99b0d1f0de5db791d64c5fbd1f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

For details refer to release notes:
http://lists.gnu.org/archive/html/info-gnu/2017-05/msg00014.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 8225042e0e8add24d698cba7232484481016f0a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 5c15b9d..a1460fd 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	54797f6e763d417627f89f60e4ae0a431dab0523f92f83def23ea02d0defafea	libmicrohttpd-0.9.52.tar.gz
+sha256 0c1cab8dc9f2588bd3076a28f77a7f8de9560cbf2d80e53f9a8696ada80ed0f8  libmicrohttpd-0.9.55.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 83791b3..8828eb5 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.52
+LIBMICROHTTPD_VERSION = 0.9.55
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
