From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 30 Jun 2013 15:28:31 +0200
Subject: [Buildroot] [git commit] sane-backends: fix download URL
Message-ID: <20130630133059.3328696997@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9ad42a480126a4cc466940318c600548bf854e9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/134/134d081dfb514d3bc20ef68f4ebec7d7e4bba8dc/

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sane-backends/sane-backends.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 96a6100..3b7076e 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -6,7 +6,7 @@
 
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
-SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/3503
+SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/file/3503
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
