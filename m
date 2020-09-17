From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 17 Sep 2020 21:40:51 +0200
Subject: [Buildroot] [git commit] package/weston: change download url to
 https
Message-ID: <20200917193145.970C18B8E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f6ef93b72733bb36d23bc60cb31909743c6a67d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- change download url to https (as given by the original announcement [1]
    and redirected by the http url)

Fixes:

  - http://autobuild.buildroot.net/results/00b9e1ccb97d9ff5c2ee0e856288f689bdab52ee

  >>> weston 9.0.0 Downloading[23m
  --2020-09-15 14:10:22--  http://wayland.freedesktop.org/releases/weston-9.0.0.tar.xz
  Resolving wayland.freedesktop.org (wayland.freedesktop.org)... 35.227.58.183
  Connecting to wayland.freedesktop.org (wayland.freedesktop.org)|35.227.58.183|:80... connected.
  HTTP request sent, awaiting response... 308 Permanent Redirect
  2020-09-15 14:10:23 ERROR 308: Permanent Redirect.

[1] https://lists.freedesktop.org/archives/wayland-devel/2020-September/041595.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a20f16ab46..f59963bf2e 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 WESTON_VERSION = 9.0.0
-WESTON_SITE = http://wayland.freedesktop.org/releases
+WESTON_SITE = https://wayland.freedesktop.org/releases
 WESTON_SOURCE = weston-$(WESTON_VERSION).tar.xz
 WESTON_LICENSE = MIT
 WESTON_LICENSE_FILES = COPYING
