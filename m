From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Sep 2018 21:28:23 +0200
Subject: [Buildroot] [git commit] package/connman: simplify upstream URL
Message-ID: <20180920192836.1831E88674@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b7de9139e99e1957fb0bdf8540840087fd60d640
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The "For more information, see" is a bit useless, and not having the
URL alone on its own line prevents scripted URL checking.

Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/connman/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/connman/Config.in b/package/connman/Config.in
index 253c604e88..5177c939a4 100644
--- a/package/connman/Config.in
+++ b/package/connman/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_CONNMAN
 	  for managing internet connections within embedded devices
 	  running the Linux operating system.
 
-	  For more information, see https://01.org/connman
+	  https://01.org/connman
 
 if BR2_PACKAGE_CONNMAN
 
