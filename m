From: Grzegorz Blach <grzegorz@blach.pl>
Date: Sat, 15 Dec 2018 01:19:24 +0100
Subject: [Buildroot] [PATCH 3/3] package/python-pigpio: fix WWW address
In-Reply-To: <20181215001924.1779-1-grzegorz@blach.pl>
References: <20181215001924.1779-1-grzegorz@blach.pl>
Message-ID: <20181215001924.1779-3-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
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
-- 
2.19.2
