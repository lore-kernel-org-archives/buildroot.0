From: Ian Haylock <haylocki@yahoo.co.uk>
Date: Sat,  2 Jan 2016 11:59:41 +0000
Subject: [Buildroot] [PATCH 1/2] New package RPi-GPIO
Message-ID: <1451735982-5703-1-git-send-email-haylocki@yahoo.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Ian Haylock <haylocki@yahoo.co.uk>
---
 package/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/Config.in b/package/Config.in
index f58f2be..4051251 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -690,6 +690,7 @@ menu "External python modules"
 	source "package/python-pyyaml/Config.in"
 	source "package/python-pyzmq/Config.in"
 	source "package/python-requests/Config.in"
+	source "package/python-rpi-gpio/Config.in"
 	source "package/python-rtslib-fb/Config.in"
 	source "package/python-serial/Config.in"
 	source "package/python-setuptools/Config.in"
-- 
2.6.4
