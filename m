From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 11 Apr 2010 21:10:35 +0200
Subject: [Buildroot] [git commit master] Move the command-related options to
	a submenu
Message-ID: <20100411195035.874BE20B81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=159292658f7a55ce80d25be204a305f6f2384cf5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/Config.in b/Config.in
index 7e51c84..9a33b89 100644
--- a/Config.in
+++ b/Config.in
@@ -15,6 +15,8 @@ source "target/device/Config.in"
 
 menu "Build options"
 
+menu "Commands"
+
 config BR2_WGET
 	string "Wget command"
 	default "wget --passive-ftp -nd"
@@ -67,6 +69,8 @@ config BR2_TAR_OPTIONS
 	  E.g. " -v --exclude='*.svn*'" to exclude all .svn internal files
 	  and to be verbose.
 
+endmenu
+
 config BR2_DL_DIR
 	string "Download dir"
 	default "$(TOPDIR)/dl"
-- 
1.6.3.3
