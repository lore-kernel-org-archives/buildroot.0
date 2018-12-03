From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Dec 2018 23:05:57 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/freetype: bump
 version to 2.9
Message-ID: <20181203220631.821DD8A6A3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daef1c454f45cb4731e1d1a9cdaede4551c78d1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Changelog:
https://sourceforge.net/projects/freetype/files/freetype2/2.9/

Upstream changed its project URL to https in docs/FTL.TXT. We do the
same in Config.in and update the license hash for docs/FTL.TXT.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 0d386f8847ef1849794237378b8d9a4740059d1d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/freetype/Config.in     |  2 +-
 package/freetype/freetype.hash | 10 +++++-----
 package/freetype/freetype.mk   |  2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/freetype/Config.in b/package/freetype/Config.in
index ded87388e8..06c6a8546d 100644
--- a/package/freetype/Config.in
+++ b/package/freetype/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_FREETYPE
 	help
 	  a free, high-quality and portable font engine.
 
-	  http://www.freetype.org/
+	  https://www.freetype.org/
diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 51d018465f..806375c058 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,9 +1,9 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.8.1/
-md5	bf0a210b6fe781228fa0e4a80691a521		freetype-2.8.1.tar.bz2
-sha1	417bb3747c4ac95b6f2652024a53fad45581fa1c	freetype-2.8.1.tar.bz2
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.9/
+md5	513c403c110016fdc7e537216a642b1d		freetype-2.9.tar.bz2
+sha1	94c4399b1a55c5892812e732843fcb4a7c2fe657	freetype-2.9.tar.bz2
 
 # Locally calculated
-sha256	e5435f02e02d2b87bb8e4efdcaa14b1f78c9cf3ab1ed80f94b6382fb6acc7d78	freetype-2.8.1.tar.bz2
+sha256	e6ffba3c8cef93f557d1f767d7bc3dee860ac7a3aaff588a521e081bc36f4c8a	freetype-2.9.tar.bz2
 sha256	fd056de4196903a676208ef58cfddafc7d583d1f28fa2e44c309cf84a59e62fb	docs/LICENSE.TXT
-sha256	4a9a548027a2c1d37788519dea833294c9c81f1ebc280e817f41f50d0c642d78	docs/FTL.TXT
+sha256	08c135755dd589039470f1fdbb400daaabaaa50d0b366d19cebff4d22986baa1	docs/FTL.TXT
 sha256	c4120c6752c910c299e3bd9cb3a46ff262c268303ca2069b61f92f10a5656c18	docs/GPLv2.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index e755c82378..1b3a9d1755 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.8.1
+FREETYPE_VERSION = 2.9
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.bz2
 FREETYPE_SITE = http://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
