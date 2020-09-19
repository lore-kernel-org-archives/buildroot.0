From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 19 Sep 2020 22:00:16 +0200
Subject: [Buildroot] [git commit] package/wayland-utils: change download url
 to https
Message-ID: <20200919200134.E59A080066@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f0c1a010b8c599632b6df751e18b109dd440ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change download url to https (as given by the original announcement [1]
    and redirected by the http url)

Fixes:

  - http://autobuild.buildroot.net/results/84ad38933e4f42b74c3185c8c5e777fd714c9601
  >>> wayland-utils 1.0.0 Downloading[27m
  --2020-09-14 13:53:35--  http://wayland.freedesktop.org/releases/wayland-utils-1.0.0.tar.xz
  Resolving wayland.freedesktop.org (wayland.freedesktop.org)... 35.227.58.183
  Connecting to wayland.freedesktop.org (wayland.freedesktop.org)|35.227.58.183|:80... connected.
  HTTP request sent, awaiting response... 308 Permanent Redirect
  2020-09-14 13:53:35 ERROR 308: Permanent Redirect.

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-July/041565.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/wayland-utils/wayland-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/wayland-utils/wayland-utils.mk b/package/wayland-utils/wayland-utils.mk
index 5269454b7e..30a33b61d6 100644
--- a/package/wayland-utils/wayland-utils.mk
+++ b/package/wayland-utils/wayland-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WAYLAND_UTILS_VERSION = 1.0.0
-WAYLAND_UTILS_SITE = http://wayland.freedesktop.org/releases
+WAYLAND_UTILS_SITE = https://wayland.freedesktop.org/releases
 WAYLAND_UTILS_SOURCE = wayland-utils-$(WAYLAND_UTILS_VERSION).tar.xz
 WAYLAND_UTILS_LICENSE = MIT
 WAYLAND_UTILS_LICENSE_FILES = COPYING
