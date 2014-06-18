From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 18 Jun 2014 14:04:08 +0200
Subject: [Buildroot] [git commit] tstools: switch homepage now that berlios
	is gone
Message-ID: <20140618123420.0FB2C9D041@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4d4dc4a996e3739be18906171bae1a04413fa26b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tstools/Config.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/tstools/Config.in b/package/tstools/Config.in
index 6712b0f..c6c2696 100644
--- a/package/tstools/Config.in
+++ b/package/tstools/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_TSTOOLS
 	  cable and satellite data. Program Stream (PS) is typically
 	  used to store data on DVDs.
 
-	  http://tstools.berlios.de/
+	  https://code.google.com/p/tstools/
 
 comment "tstools needs a toolchain w/ largefile"
 	depends on !BR2_LARGEFILE
