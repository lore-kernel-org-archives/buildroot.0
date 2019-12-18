From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 14:02:55 +0000
Subject: [Buildroot] [PATCH 1/1] package/usbmount: update the upstream URL
 in Config.in
Message-ID: <20191218140255.18913-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(Err)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
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
-- 
2.20.1
