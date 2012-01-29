From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 29 Jan 2012 20:03:13 +0100
Subject: [Buildroot] [git commit] libxcb: fix help text indentation
Message-ID: <20120129222324.C7FEF9092E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dc662b1a6c7a8ec0cde8b4b623d7c07fb3f65f80
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/libxcb/Config.in |   10 ++++------
 1 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/x11r7/libxcb/Config.in b/package/x11r7/libxcb/Config.in
index fb48a02..9554529 100644
--- a/package/x11r7/libxcb/Config.in
+++ b/package/x11r7/libxcb/Config.in
@@ -5,10 +5,8 @@ config BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XLIB_LIBXDMCP
 	select BR2_PACKAGE_XLIB_LIBXAU
 	help
-		The X protocol C-language Binding (XCB) is a replacement for
-		Xlib featuring a small footprint, latency hiding, direct access
-		to the protocol, improved threading support, and extensibility.
-
-		http://xcb.freedesktop.org/
-
+	  The X protocol C-language Binding (XCB) is a replacement for
+	  Xlib featuring a small footprint, latency hiding, direct access
+	  to the protocol, improved threading support, and extensibility.
 
+	  http://xcb.freedesktop.org/
