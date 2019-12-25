From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 25 Dec 2019 22:42:02 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/python-crc16:
 update the upstream URL in Config.in
Message-ID: <20191225214903.5F2058E4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0520ff615ebea036ec80d5ec86619dd0ef28d8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Update the upstream URL in the help text in Config.in. This
addresses the 'Invalid(404)' URL status in the package stats
web page output.

Signed-off-by: Mark Corbin <mark@dibsco.co.uk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit ff0d2dd1f2382d2602024e7008c9e6fd3255d67c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
