From: Mark Corbin <mark@dibsco.co.uk>
Date: Fri, 29 Nov 2019 16:14:00 +0000
Subject: [Buildroot] [PATCH 1/1] package/ortp: update the upstream URL in
 Config.in
Message-ID: <20191129161400.19577-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/ortp/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ortp/Config.in b/package/ortp/Config.in
index 788eaf4bbb..052ff1d397 100644
--- a/package/ortp/Config.in
+++ b/package/ortp/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_ORTP
 	help
 	  oRTP, a Real-time Transport Protocol (RTP,RFC3550) library
 
-	  http://www.linphone.org/eng/documentation/dev/ortp.html
+	  https://www.linphone.org/technical-corner/ortp
 
 comment "ortp needs a toolchain w/ C++, threads"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
