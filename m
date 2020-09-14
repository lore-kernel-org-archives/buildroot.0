From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 14 Sep 2020 08:41:48 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.3.0
Message-ID: <20200914063320.BE35C7FD9D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=819a4207f6a5c3b579cb5191b03b51ebec4298ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index 22357cd5eb..66fd2f07a2 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b47623f023d6a1218f2cb078bcc9019949a7f30acce79423e524a481d4bc834d  libuhttpd-3.2.0.tar.gz
+sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.2.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 1bb071b3e4..f2cb6e650e 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.2.0
+LIBUHTTPD_VERSION = 3.3.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
