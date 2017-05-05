From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 May 2017 14:32:45 +0200
Subject: [Buildroot] [git commit] bluez5_utils: correct the experimental
	option text
Message-ID: <20170505123802.DBEFE7FB66@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8c76c028bc552d6f3f0e33ce35915b1e034e7178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In BlueZ 5.44 the --enable-experimental configure option only controls the
build of the Nokia OBEX PC Suite plugin. Correct the option prompt and help
text.

Cc: Marcin Bis <marcin@bis.org.pl>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bluez5_utils/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 285560a..f8e3540 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -57,9 +57,9 @@ config BR2_PACKAGE_BLUEZ5_UTILS_DEPRECATED
 	  ciptool, gatttool.
 
 config BR2_PACKAGE_BLUEZ5_UTILS_EXPERIMENTAL
-	bool "build experimental plugins"
+	bool "build experimental obexd plugin"
 	help
-	  Build BlueZ 5.x experimental plugins (SAP, NFC, ...).
+	  Build BlueZ 5.x experimental Nokia OBEX PC Suite plugin
 
 config BR2_PACKAGE_BLUEZ5_PLUGINS_SIXAXIS
 	bool "build sixaxis plugin"
