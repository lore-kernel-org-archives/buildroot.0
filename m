From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2019 22:08:50 +0100
Subject: [Buildroot] [git commit branch/2019.08.x] package/ortp: update the
 upstream URL in Config.in
Message-ID: <20191205210734.2406B8812B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=da6225920210d7d149c04ed2213a3f31d255f306
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.08.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit c3c12bd9a3dec29dfe718e1639365313588001ff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
