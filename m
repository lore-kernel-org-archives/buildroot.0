From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Jul 2012 23:45:25 +0200
Subject: [Buildroot] [git commit branch/next] bwm-ng: move bwm-ng from
	"Networking applications" to "System tools".
Message-ID: <20120802195256.3EA2C8E8F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b3e06f239b9c12074f88bdfd3c95b3cad0e9f1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

bwm-ng can monitor not only network bandwidth but also disk-io
bandwidth, so it is more appropriate to put bwm-ng into System tools.

Signed-off-by: Kelvin Cheung <keguang.zhang@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 6aabb8e..154b82c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -511,7 +511,6 @@ endif
 source "package/bind/Config.in"
 source "package/bmon/Config.in"
 source "package/bridge-utils/Config.in"
-source "package/bwm-ng/Config.in"
 source "package/can-utils/Config.in"
 source "package/connman/Config.in"
 source "package/ctorrent/Config.in"
@@ -658,6 +657,7 @@ source "package/attr/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/bootutils/Config.in"
 endif
+source "package/bwm-ng/Config.in"
 source "package/htop/Config.in"
 source "package/kmod/Config.in"
 if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
