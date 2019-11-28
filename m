From: Mark Corbin <mark@dibsco.co.uk>
Date: Thu, 28 Nov 2019 12:28:52 +0000
Subject: [Buildroot] [PATCH 1/1] package/libhid: update the upstream URL in
 Config.in
Message-ID: <20191128122852.31052-1-mark@dibsco.co.uk>
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
 package/libhid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libhid/Config.in b/package/libhid/Config.in
index e6f2012860..ec66308061 100644
--- a/package/libhid/Config.in
+++ b/package/libhid/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBHID
 	help
 	  Userspace library for accessing USB HID devices
 
-	  http://libhid.alioth.debian.org
+	  https://directory.fsf.org/wiki/Libhid
 
 comment "libhid needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
