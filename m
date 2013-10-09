From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Oct 2013 22:35:07 +0200
Subject: [Buildroot] [git commit] mongoose: needs mmu
Message-ID: <20131009203638.151189A45E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ea7f661c3e38b71d3e4ed161e9e11e396070e73
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mongoose/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/mongoose/Config.in b/package/mongoose/Config.in
index 7199712..1668476 100644
--- a/package/mongoose/Config.in
+++ b/package/mongoose/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MONGOOSE
 	bool "mongoose"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	help
 	  Mongoose is a small and easy to use web server
 
