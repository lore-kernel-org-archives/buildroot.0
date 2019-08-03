From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  3 Aug 2019 11:38:58 +0200
Subject: [Buildroot] [PATCH 3/3] package/mosquitto: update help text in
 Config.in
In-Reply-To: <20190803093858.144555-1-titouan.christophe@railnova.eu>
References: <20190803093858.144555-1-titouan.christophe@railnova.eu>
Message-ID: <20190803093858.144555-4-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

(and add myself to DEVELOPERS)

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 DEVELOPERS                  |  1 +
 package/mosquitto/Config.in | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 74f52d26fd..a2017ef593 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2247,6 +2247,7 @@ N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
 N:	Titouan Christophe <titouan.christophe@railnova.eu>
+F:	package/mosquitto/
 F:	package/redis/
 
 N:	Trent Piepho <tpiepho@impinj.com>
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 8f2561c2d8..272035f18b 100644
--- a/package/mosquitto/Config.in
+++ b/package/mosquitto/Config.in
@@ -1,13 +1,21 @@
 config BR2_PACKAGE_MOSQUITTO
 	bool "mosquitto"
 	help
-	  Mosquitto is an open source message broker that implements
-	  the MQ Telemetry Transport protocol versions 3.1 and
-	  3.1.1. MQTT provides a lightweight method of carrying out
-	  messaging using a publish/subscribe model. This makes it
-	  suitable for "machine to machine" messaging such as with low
-	  power sensors or mobile devices such as phones, embedded
-	  computers or microcontrollers like the Arduino.
+	  Eclipse Mosquitto is an open source (EPL/EDL licensed) message
+	  broker that implements the MQTT protocol versions 5.0, 3.1.1
+	  and 3.1. Mosquitto is lightweight and is suitable for use on
+	  all devices from low power single board computers to full
+	  servers.
+
+	  The MQTT protocol provides a lightweight method of carrying
+	  out messaging using a publish/subscribe model. This makes it
+	  suitable for Internet of Things messaging such as with low
+	  power sensors or mobile devices such as phones,
+	  embedded computers or microcontrollers.
+
+	  The Mosquitto project also provides a C library for
+	  implementing MQTT clients, and the very popular mosquitto_pub
+	  and mosquitto_sub command line MQTT clients.
 
 	  http://mosquitto.org/
 
-- 
2.21.0
