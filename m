From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:42:25 +0200
Subject: [Buildroot] [git commit branch/next] sane-backends: handle
	sane-config script
Message-ID: <20130511204540.BC69E9A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=971d3f1fbc620277eb8a5108cd825b497bcd3870
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/sane-backends/sane-backends.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 496dca4..9022845 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -6,6 +6,7 @@
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SOURCE = sane-backends-$(SANE_BACKENDS_VERSION).tar.gz
 SANE_BACKENDS_SITE = https://alioth.debian.org/frs/download.php/3503
+SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
