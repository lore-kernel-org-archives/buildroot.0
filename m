From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 6 Dec 2018 22:17:38 +0100
Subject: [Buildroot] [git commit] package/pulseview: drop boost thread
Message-ID: <20181206211401.549088886E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2d2b519e6291513571208b830bc8c9a97fb277c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to 0.4.0, boost thread is not needed anymore:
https://sigrok.org/gitweb/?p=pulseview.git;a=commit;h=b8f1cdeba7cf6c2b749ff60102ce4e260fa1309e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pulseview/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/pulseview/Config.in b/package/pulseview/Config.in
index 301acf7d90..a42fdcd879 100644
--- a/package/pulseview/Config.in
+++ b/package/pulseview/Config.in
@@ -18,7 +18,6 @@ config BR2_PACKAGE_PULSEVIEW
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_SYSTEM
-	select BR2_PACKAGE_BOOST_THREAD
 	select BR2_PACKAGE_BOOST_SERIALIZATION
 	help
 	  PulseView is a Qt based logic analyzer, oscilloscope
