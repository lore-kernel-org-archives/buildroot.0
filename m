From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 27 Feb 2011 22:25:58 +0100
Subject: [Buildroot] [git commit master 1/1] webif: mark as deprecated
Message-ID: <20110227212630.8BB2F8F77C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=eb6dcf8c1c77ac7504f501c27b2e7175e13666ff
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It's long dead upstream and hasn't seen any updates since it got added
back in 2008.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/webif/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/webif/Config.in b/package/webif/Config.in
index 56ed545..2ecbf36 100644
--- a/package/webif/Config.in
+++ b/package/webif/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_WEBIF
 	bool "webif - Status Console"
 	depends on BR2_PACKAGE_BUSYBOX # httpd
+	depends on BR2_DEPRECATED
 	select BR2_PACKAGE_HASERL
 	help
 	  A web interface for showing different network status. This package
-- 
1.7.3.4
