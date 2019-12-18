From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 12:16:34 +0000
Subject: [Buildroot] [PATCH 1/1] package/spidev_test: update the upstream
 URL in Config.in
Message-ID: <20191218121634.531-1-mark@dibsco.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
---
 package/spidev_test/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
index 0d8214cc29..44990c66b6 100644
--- a/package/spidev_test/Config.in
+++ b/package/spidev_test/Config.in
@@ -14,4 +14,4 @@ config BR2_PACKAGE_SPIDEV_TEST
 	  This means you won't have quad-pumped SPI support if your
 	  toolchain is too old.
 
-	  https://www.kernel.org/doc/Documentation/spi/spidev_test.c
+	  https://www.kernel.org/doc/html/latest/spi/index.html
-- 
2.20.1
