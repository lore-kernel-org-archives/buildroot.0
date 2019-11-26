From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 19:36:32 +0000
Subject: [Buildroot] [PATCH 1/1] package/iw: update the upstream URL in
 Config.in
Message-ID: <20191126193632.12823-1-mark@dibsco.co.uk>
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
 package/iw/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/iw/Config.in b/package/iw/Config.in
index fd73b20992..8a74e3b2ad 100644
--- a/package/iw/Config.in
+++ b/package/iw/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_IW
 	help
 	  Utility for wireless devices using the mac80211 kernel stack
 
-	  http://wireless.kernel.org/en/users/Documentation/iw
+	  https://wireless.wiki.kernel.org/en/users/documentation/iw
 
 comment "iw needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
