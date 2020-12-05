From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 5 Dec 2020 21:23:59 +0100
Subject: [Buildroot] [git commit] package/meson: bump version to 0.56.0
Message-ID: <20201205201041.9FC6681944@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ce80dffe43413f9d954eac7bb69798c6bfdf01a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 9d278ef906..b1f36ab9c3 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.55.3/meson-0.55.3.tar.gz.asc
-sha256  6bed2a25a128bbabe97cf40f63165ebe800e4fcb46db8ab7ef5c2b5789f092a5  meson-0.55.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.56.0/meson-0.56.0.tar.gz.asc
+sha256  291dd38ff1cd55fcfca8fc985181dd39be0d3e5826e5f0013bf867be40117213  meson-0.56.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index d39e66cf05..e45eddcd7f 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.55.3
+MESON_VERSION = 0.56.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
