From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 26 Nov 2019 15:35:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/gadgetfs-test: add an upstream URL
 to Config.in
Message-ID: <20191126153505.31916-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add an upstream URL to the help text in Config.in. This
addresses the 'Missing' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/gadgetfs-test/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gadgetfs-test/Config.in b/package/gadgetfs-test/Config.in
index ca14c91b41..c22134c4a5 100644
--- a/package/gadgetfs-test/Config.in
+++ b/package/gadgetfs-test/Config.in
@@ -4,6 +4,8 @@ config BR2_PACKAGE_GADGETFS_TEST
 	help
 	  Test program for gadgetfs from linux-usb.org
 
+	  https://mirror.egtvedt.no/avr32linux.org/twiki/pub/Main/GadgetFsTest/
+
 if BR2_PACKAGE_GADGETFS_TEST
 
 config BR2_PACKAGE_GADGETFS_TEST_USE_AIO
-- 
2.20.1
