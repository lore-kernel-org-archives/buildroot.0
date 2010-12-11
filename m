From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 Dec 2010 02:25:21 +0100
Subject: [Buildroot] [git commit master 1/1] busybox: default to 1.18
Message-ID: <20101211012556.551CD8DF0B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=bf5c0c8ab00007a4854101d9771e9abb7611aa98
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/busybox/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/busybox/Config.in b/package/busybox/Config.in
index 48ba1c8..72722b9 100644
--- a/package/busybox/Config.in
+++ b/package/busybox/Config.in
@@ -13,7 +13,7 @@ if BR2_PACKAGE_BUSYBOX
 
 choice
 	prompt "BusyBox Version"
-	default BR2_BUSYBOX_VERSION_1_17_X
+	default BR2_BUSYBOX_VERSION_1_18_X
 	help
 	  Select the version of BusyBox you wish to use.
 
-- 
1.7.2.2
