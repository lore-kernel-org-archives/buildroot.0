From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 22 Jan 2012 16:31:46 +0100
Subject: [Buildroot] [git commit] libv4l: move under Libraries/Hardware
	handling
Message-ID: <20120122200858.6BF5B8FDDA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b66293db17a2378b6934225b5fd11613da88c407
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libv4 package mainly provides a library, so it makes more sense to
locate it here.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 2e91427..f219e37 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -185,7 +185,6 @@ source "package/input-tools/Config.in"
 source "package/iostat/Config.in"
 source "package/irda-utils/Config.in"
 source "package/kbd/Config.in"
-source "package/libv4l/Config.in"
 source "package/lm-sensors/Config.in"
 source "package/lsuio/Config.in"
 source "package/lvm2/Config.in"
@@ -325,6 +324,7 @@ source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
 source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
+source "package/libv4l/Config.in"
 endmenu
 
 menu "Javascript"
