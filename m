From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Sep 2011 08:26:07 +0200
Subject: [Buildroot] [git commit] mcookie: fix Config.in indentation
Message-ID: <20110930063212.DC7608DC07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9e045df4e12b268417f62f70df4afc1441f8efbf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/x11r7/mcookie/Config.in |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/mcookie/Config.in b/package/x11r7/mcookie/Config.in
index 1462a7b..2e9cfc7 100644
--- a/package/x11r7/mcookie/Config.in
+++ b/package/x11r7/mcookie/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MCOOKIE
 	bool "mcookie"
 	help
-		cookie generator for X server
-
-		http://www.x.org
+	  cookie generator for X server
 
+	  http://www.x.org
