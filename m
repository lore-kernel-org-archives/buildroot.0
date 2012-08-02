From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 02 Aug 2012 19:52:42 -0000
Subject: [Buildroot] [git commit branch/next] pthread-stubs: fix incorrect
	indentation
Message-ID: <20120802195241.070948C999@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7c96b50aac61bcfbfbd7e2ef56396303a856d785
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/pthread-stubs/Config.in |    7 +++----
 1 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/pthread-stubs/Config.in b/package/x11r7/pthread-stubs/Config.in
index de13e87..c17f7da 100644
--- a/package/x11r7/pthread-stubs/Config.in
+++ b/package/x11r7/pthread-stubs/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PTHREAD_STUBS
 	bool "pthread-stubs"
 	help
-		This library provides weak aliases for pthread functions not
-		provided in libc or otherwise available by default.
-
-		http://xcb.freedesktop.org/
+	  This library provides weak aliases for pthread functions not
+	  provided in libc or otherwise available by default.
 
+	  http://xcb.freedesktop.org/
