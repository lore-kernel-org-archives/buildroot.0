From: Mark Corbin <mark@dibsco.co.uk>
Date: Tue, 17 Dec 2019 12:51:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/python-crc16: update the upstream
 URL in Config.in
Message-ID: <20191217125105.20528-1-mark@dibsco.co.uk>
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
 package/python-crc16/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-crc16/Config.in b/package/python-crc16/Config.in
index 3fd8da7a85..b7a10b66ad 100644
--- a/package/python-crc16/Config.in
+++ b/package/python-crc16/Config.in
@@ -8,4 +8,4 @@ config BR2_PACKAGE_PYTHON_CRC16
 	  or transmission. There are many variants of CRC and CRC16,
 	  in particular.
 
-	  http://pycrc16.googlecode.com/
+	  https://code.google.com/archive/p/pycrc16/
-- 
2.20.1
