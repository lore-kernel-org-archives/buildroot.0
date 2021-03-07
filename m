From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 7 Mar 2021 21:54:45 +0100
Subject: [Buildroot] [git commit branch/next] package/libuhttpd: bump
 version to 3.10.1
Message-ID: <20210307205417.D9154887DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d1133a6927bf8cf920b6b39ad1ed9ab5aa395e7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index e772cc84ee..4b0b5027c6 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  78b1c670e4f259346a1e49e57d158c619eace23f0b72821b0ff2ba991f7dcc51  libuhttpd-3.10.0.tar.gz
+sha256  6e7a9ad61e3d0ab5bd4d20b274b850542dff8057a8fcf6c36ce59eb34818f61f  libuhttpd-3.10.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 06d7bc7d5e..326c78face 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.10.0
+LIBUHTTPD_VERSION = 3.10.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
