From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 23:07:00 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/usbmount: update
 the upstream URL in Config.in
Message-ID: <20191223220036.108548DFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2d33d9667384e2befcba3f4eba20e1a4d39a930
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6fd8a74276c30cc01e0e8718479360138a7fb678)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/usbmount/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
index f87bd911f2..8ce0ce7613 100644
--- a/package/usbmount/Config.in
+++ b/package/usbmount/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_USBMOUNT
 	  devices when they are plugged in, and unmounts them when
 	  they are removed.
 
-	  http://usbmount.alioth.debian.org/
+	  https://wiki.debian.org/usbmount
 
 comment "usbmount requires udev to be enabled"
 	depends on !BR2_PACKAGE_HAS_UDEV
