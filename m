From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Sep 2009 17:46:06 +0200
Subject: [Buildroot] [git commit master] libmicrohttpd: cleanup Config.in
Message-ID: <20090921154655.E0F2D77764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=c5388a1c6267023bc3f99196582e09b52137e1e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- 'n' is default, so no need to mention it explicit
- Add homepage URL

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libmicrohttpd/Config.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index c8cfd5d..de656ad 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_LIBMICROHTTPD
 	bool "libmicrohttpd"
 	select BR2_PACKAGE_LIBGCRYPT
-	default n
 	help
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
+
+	  http://www.gnu.org/software/libmicrohttpd/
-- 
1.6.3.3
