From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 16:40:22 +0100
Subject: [Buildroot] [git commit] package/python-pigpio: fix upstream URL
 address
Message-ID: <20181216154513.A2BCF86AC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f0886e95f8cd57fb7987828e0a361eabe9d50109
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pigpio/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pigpio/Config.in b/package/python-pigpio/Config.in
index 08c37cb9b2..4c9152a621 100644
--- a/package/python-pigpio/Config.in
+++ b/package/python-pigpio/Config.in
@@ -5,4 +5,4 @@ config BR2_PACKAGE_PYTHON_PIGPIO
 	  which talks to the pigpio daemon to allow control
 	  of the general purpose input outputs (GPIO).
 
-	  http://abyz.co.uk/rpi/pigpio/python.html
+	  http://abyz.me.uk/rpi/pigpio/python.html
