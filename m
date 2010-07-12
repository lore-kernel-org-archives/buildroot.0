From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 12 Jul 2010 15:44:43 +0200
Subject: [Buildroot] [git commit master 1/1] busybox: default to v1.17.x
Message-ID: <20100712134511.59B0682887@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=7add5f57f981af6aa9fac5a515c9798f571cbc52
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index dd13b3f..a513380 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_BUSYBOX
 
 choice
 	prompt "BusyBox Version"
-	default BR2_BUSYBOX_VERSION_1_16_X
+	default BR2_BUSYBOX_VERSION_1_17_X
 	help
 	  Select the version of BusyBox you wish to use.
 
-- 
1.7.1
