From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 16:34:26 +0200
Subject: [Buildroot] [git commit] sane-backends: add license information
Message-ID: <20140626143652.B88709D0D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cafb9d5089d3cba1309d4e43ef803e48e3d54b62
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sane-backends/sane-backends.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
index 52c5aa7..6a6fa0b 100644
--- a/package/sane-backends/sane-backends.mk
+++ b/package/sane-backends/sane-backends.mk
@@ -7,6 +7,8 @@
 SANE_BACKENDS_VERSION = 1.0.22
 SANE_BACKENDS_SITE = http://sources.buildroot.net/
 SANE_BACKENDS_CONFIG_SCRIPTS = sane-config
+SANE_BACKENDS_LICENSE = GPLv2+
+SANE_BACKENDS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBUSB),y)
 SANE_BACKENDS_DEPENDENCIES += libusb
