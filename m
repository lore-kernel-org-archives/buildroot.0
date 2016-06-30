From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Jul 2016 00:05:49 +0200
Subject: [Buildroot] [git commit] package/domoticz: indentation cleanup
Message-ID: <20160630220646.D876081E5E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=13cfedf5fbc7f02fc8c9c9b34ca0f0368cee96bd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
