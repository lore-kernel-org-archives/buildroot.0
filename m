From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 22:17:39 +0100
Subject: [Buildroot] [git commit] cjson: fix download URL
Message-ID: <20121210212803.35B9B9A188@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=190ef5bac13a1387b526309c194638bfdb6f6e23
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Downloads.sourceforge.net doesn't like the double '/'.

Reported-by: Viallard Anthony <viallard@syscom-instruments.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
Acked-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/cjson/cjson.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cjson/cjson.mk b/package/cjson/cjson.mk
index ccc6010..55af800 100644
--- a/package/cjson/cjson.mk
+++ b/package/cjson/cjson.mk
@@ -5,7 +5,7 @@
 #############################################################
 CJSON_VERSION         = undefined
 CJSON_SOURCE          = cJSONFiles.zip
-CJSON_SITE            = http://downloads.sourceforge.net/project/cjson/
+CJSON_SITE            = http://downloads.sourceforge.net/project/cjson
 CJSON_INSTALL_STAGING = YES
 CJSON_LICENSE         = MIT
 
