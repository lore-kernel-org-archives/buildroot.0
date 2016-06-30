From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Thu, 30 Jun 2016 08:37:40 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: indentation cleanup
Message-ID: <1467268660-17280-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/domoticz/domoticz.mk | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f39c075..adcf061 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -8,8 +8,15 @@ DOMOTICZ_VERSION = 3.4834
 DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPLv3
 DOMOTICZ_LICENSE_FILES = License.txt
-DOMOTICZ_DEPENDENCIES = boost host-pkgconf libcurl lua mosquitto openssl \
-        sqlite zlib
+DOMOTICZ_DEPENDENCIES = \
+	boost \
+	host-pkgconf \
+	libcurl \
+	lua \
+	mosquitto \
+	openssl \
+	sqlite \
+	zlib
 
 # Due to the dependency on mosquitto, domoticz depends on
 # !BR2_STATIC_LIBS so set USE_STATIC_BOOST to OFF
-- 
1.9.1
