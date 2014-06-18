From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:04:00 +0200
Subject: [Buildroot] [git commit] tslib: switch homepage now that berlios is
	gone
Message-ID: <20140618123420.0863C9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=eed954e06e09cc3f035e0b80789c2f3bd260b516
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tslib/Config.in b/package/tslib/Config.in
index ef03f90..ee70807 100644
--- a/package/tslib/Config.in
+++ b/package/tslib/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_TSLIB
 	help
 	  Tslib is an abstraction layer for touchscreen panel events.
 
-	  http://tslib.berlios.de/
+	  https://github.com/kergoth/tslib
 
 comment "tslib needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
