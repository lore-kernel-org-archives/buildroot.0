From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 17 Jun 2019 19:39:25 +0200
Subject: [Buildroot] [git commit] package/meson: bump to version 0.51.0
Message-ID: <20190617173849.8F01E8F531@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46106db4562465844995df4d9d0c96f29e9d536b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 9e60fa6349..da031e8cd7 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.50.1/meson-0.50.1.tar.gz.asc
-sha256 f68f56d60c80a77df8fc08fa1016bc5831605d4717b622c96212573271e14ecc meson-0.50.1.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.51.0/meson-0.51.0.tar.gz.asc
+sha256 2f75fdf6d586d3595c03a07afcd0eaae11f68dd33fea5906a434d22a409ed63f meson-0.51.0.tar.gz
 sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30 COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index cf62b0ddde..5b5100cccc 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.50.1
+MESON_VERSION = 0.51.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
