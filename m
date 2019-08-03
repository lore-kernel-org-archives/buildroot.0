From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 3 Aug 2019 13:14:48 +0200
Subject: [Buildroot] [git commit] package/mosquitto: update help text in
 Config.in
Message-ID: <20190803111211.E447D839CA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ad98587f11a631d3add0bc9838201e9113336996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

(and add myself to DEVELOPERS)

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                  |  1 +
 package/mosquitto/Config.in | 22 +++++++++++++++-------
 2 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 4338d6ec84..6b30e14136 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2267,6 +2267,7 @@ N:	Timo Ketola <timo.ketola@exertus.fi>
 F:	package/fbgrab/
 
 N:	Titouan Christophe <titouan.christophe@railnova.eu>
+F:	package/mosquitto/
 F:	package/redis/
 
 N:	Trent Piepho <tpiepho@impinj.com>
diff --git a/package/mosquitto/Config.in b/package/mosquitto/Config.in
index 1b3d1070f8..b4effa36be 100644
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
 
