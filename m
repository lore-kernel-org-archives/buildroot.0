From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 16:43:00 +0200
Subject: [Buildroot] [git commit] package/x11r7/xdiver_xf86-input-tslib:
	update download url and add hash file
Message-ID: <20150630144328.B5A8C81789@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f3a2c8a724ee97fc941fc01e2401eedd6c37feae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The old url fallback to http://www.pengutronix.de/software/ptxdist/ instead
of http://www.pengutronix.de/software/xf86-input-tslib/download/ breaking
the download.

To avoid such problems in the future, we also add a hash file to this
package.

[Thomas: add hash file.]

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../xdriver_xf86-input-tslib.hash                  |    2 ++
 .../xdriver_xf86-input-tslib.mk                    |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
new file mode 100644
index 0000000..9eb3f1d
--- /dev/null
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 5f46fdef095a6e44a69e0f0b57c7d665224b26d990d006611236d8332e85b105  xf86-input-tslib-0.0.6.tar.bz2
diff --git a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
index c9a1995..cd8c10a 100644
--- a/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
+++ b/package/x11r7/xdriver_xf86-input-tslib/xdriver_xf86-input-tslib.mk
@@ -6,7 +6,7 @@
 
 XDRIVER_XF86_INPUT_TSLIB_VERSION = 0.0.6
 XDRIVER_XF86_INPUT_TSLIB_SOURCE = xf86-input-tslib-$(XDRIVER_XF86_INPUT_TSLIB_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.ptxdist.org/software/xf86-input-tslib/download
+XDRIVER_XF86_INPUT_TSLIB_SITE = http://www.pengutronix.de/software/xf86-input-tslib/download
 XDRIVER_XF86_INPUT_TSLIB_LICENSE = MIT
 XDRIVER_XF86_INPUT_TSLIB_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_TSLIB_DEPENDENCIES = \
