From: Mark Corbin <mark@dibsco.co.uk>
Date: Wed, 18 Dec 2019 11:39:38 +0000
Subject: [Buildroot] [PATCH 1/1] package/setserial: add an upstream URL to
 Config.in
Message-ID: <20191218113938.11819-1-mark@dibsco.co.uk>
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
 package/setserial/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/setserial/Config.in b/package/setserial/Config.in
index 4ff2477e84..1182cb063b 100644
--- a/package/setserial/Config.in
+++ b/package/setserial/Config.in
@@ -4,3 +4,5 @@ config BR2_PACKAGE_SETSERIAL
 	depends on BR2_USE_MMU
 	help
 	  Setserial : configuration of serial ports
+
+	  http://setserial.sourceforge.net/
-- 
2.20.1
