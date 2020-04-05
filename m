From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 5 Apr 2020 16:25:43 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.1.3
Message-ID: <20200405141204.B123A8B862@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e3c4eee3b7f20bbdc8b5f6bb3cc8ab5c94558127
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 65014cacf5..5c3359fdd3 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 9f938b75074f812375c5079189f8299c328e94801117ab1190a29fae0806f1a8  libuhttpd-3.1.2.tar.gz
+sha256 272e64fab9932039366270efa49dd4df98f5ebe8c76e51ae578594b37bf6eef4  libuhttpd-3.1.3.tar.gz
 sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index ce805e8f08..0d75176d41 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.1.2
+LIBUHTTPD_VERSION = 3.1.3
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
