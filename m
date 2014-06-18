From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:04:41 +0200
Subject: [Buildroot] [git commit] can-utils: switch homepage now that
	berlios is gone
Message-ID: <20140618123420.2765A9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8a92adb4e0a9351737ff9035bb264b310415870e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unfortunately the gitorious page/wiki says nothing useful so use the
elinux.org page for now.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/can-utils/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/can-utils/Config.in b/package/can-utils/Config.in
index d5d4297..307f069 100644
--- a/package/can-utils/Config.in
+++ b/package/can-utils/Config.in
@@ -6,4 +6,4 @@ config BR2_PACKAGE_CAN_UTILS
 	  networking stack.
 	  This package provides various tools for this stack.
 
-	  http://developer.berlios.de/projects/socketcan/
+	  http://elinux.org/Can-utils
