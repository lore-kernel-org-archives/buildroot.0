From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 4 Oct 2020 11:51:47 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.3.1
Message-ID: <20201004094313.05C2784777@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9d4f7fe429194ec57c4a65fe82e4539084e40b21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index b7c839a5f0..e52b13bb2e 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  161aac7a09ed143278804f8f55ed3c1dd3c813cd68418325ca8862acdaf8a163  libuhttpd-3.3.0.tar.gz
+sha256  970d79e064c294fa5798c67e2a20bbd22317a69225e0478399460fa64aa36894  libuhttpd-3.3.1.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index f2cb6e650e..29e1c97d69 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.3.0
+LIBUHTTPD_VERSION = 3.3.1
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
