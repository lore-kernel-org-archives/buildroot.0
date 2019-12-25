From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:36:11 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/spidev_test:
 update the upstream URL in Config.in
Message-ID: <20191225214909.6693A8E522@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a4c38147589da5723ad1cd46329826a82b8d98b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3661a3e3a9a788de8240078a4a344b9edb1fa9ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
