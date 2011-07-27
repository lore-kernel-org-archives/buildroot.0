From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Jul 2011 21:10:13 +0200
Subject: [Buildroot] [git commit] busybox: BR2_PACKAGE_BUSYBOX_SHOW_OTHER:
	remove conditional check
Message-ID: <20110727195458.C46728B51B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=4e3ae5ccaba22b6db443a768c8c6a5f2b14d01af
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It is already within an 'if BR2_PACKAGE_BUSYBOX' section.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 283e59f..488b124 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -56,7 +56,7 @@ config BR2_PACKAGE_BUSYBOX_CONFIG
 	  Most people will just use the default BusyBox configuration file.
 
 config BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
-	bool "Show packages that are also provided by busybox" if BR2_PACKAGE_BUSYBOX
+	bool "Show packages that are also provided by busybox"
 	help
 	  Show packages in menuconfig that are potentially also provided
 	  by busybox.
-- 
1.7.3.4
