From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Mar 2012 21:26:36 +0100
Subject: [Buildroot] [git commit] network-manager: remove double libnl
	dependency
Message-ID: <20120311203130.77B7C90D41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e2b124d2a848660d022e9f1d74badf34454b6b0c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/network-manager/Config.in |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
index 9708a11..fb0c0e9 100644
--- a/package/network-manager/Config.in
+++ b/package/network-manager/Config.in
@@ -8,7 +8,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
 	select BR2_PACKAGE_DBUS_GLIB
 	select BR2_PACKAGE_UDEV
 	select BR2_PACKAGE_UDEV_ALL_EXTRAS
-	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBNL
 	select BR2_PACKAGE_UTIL_LINUX
