From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Oct 2020 19:26:34 +0200
Subject: [Buildroot] [git commit] package/libuhttpd: bump version to 3.4.0
Message-ID: <20201014172338.0BC778F8C1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d093629f31fa490227981221e980ba91bffd985a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuhttpd/libuhttpd.hash | 2 +-
 package/libuhttpd/libuhttpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuhttpd/libuhttpd.hash b/package/libuhttpd/libuhttpd.hash
index e52b13bb2e..bcded4a983 100644
--- a/package/libuhttpd/libuhttpd.hash
+++ b/package/libuhttpd/libuhttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  970d79e064c294fa5798c67e2a20bbd22317a69225e0478399460fa64aa36894  libuhttpd-3.3.1.tar.gz
+sha256  c77a404e2a666dda6c731cee977cfa8c2aa433e167222cbd28dd0c91a5c80570  libuhttpd-3.4.0.tar.gz
 sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuhttpd/libuhttpd.mk b/package/libuhttpd/libuhttpd.mk
index 29e1c97d69..71e7754bab 100644
--- a/package/libuhttpd/libuhttpd.mk
+++ b/package/libuhttpd/libuhttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUHTTPD_VERSION = 3.3.1
+LIBUHTTPD_VERSION = 3.4.0
 LIBUHTTPD_SITE = https://github.com/zhaojh329/libuhttpd/releases/download/v$(LIBUHTTPD_VERSION)
 LIBUHTTPD_LICENSE = MIT
 LIBUHTTPD_LICENSE_FILES = LICENSE
