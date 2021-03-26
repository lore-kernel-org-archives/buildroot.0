From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 26 Mar 2021 20:08:56 +0100
Subject: [Buildroot] [PATCH 2/2] package/freeswitch: bump version to 1.10.6
In-Reply-To: <20210326190856.704217-1-bernd.kuhls@t-online.de>
References: <20210326190856.704217-1-bernd.kuhls@t-online.de>
Message-ID: <20210326190856.704217-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://github.com/signalwire/freeswitch/releases/tag/v1.10.6

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/freeswitch/freeswitch.hash | 4 ++--
 package/freeswitch/freeswitch.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/freeswitch/freeswitch.hash b/package/freeswitch/freeswitch.hash
index d95e05c0b1..dc5a67980f 100644
--- a/package/freeswitch/freeswitch.hash
+++ b/package/freeswitch/freeswitch.hash
@@ -1,5 +1,5 @@
-# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.5.-release.tar.xz.sha256
-sha256  3e26600767a82946eca94af2c8f14712783aa83db5fb1cc57585f544aecce327 freeswitch-1.10.5.-release.tar.xz
+# From https://files.freeswitch.org/freeswitch-releases/freeswitch-1.10.6.-release.tar.xz.sha256
+sha256  9a08d4e184e6d715e1c12c43a0f901597151752ef236f0a37e40996272b5c38d  freeswitch-1.10.6.-release.tar.xz
 # Locally computed
 sha256  75c933202f40939cdc3827fce20a1efdaa38291e2b5a65d234eb16e2cffda66a  COPYING
 sha256  c3e3388768dae8bf4edcc4108f95be815b8a05c0b0aef6e4c3d8df81affdfa34  docs/OPENH264_BINARY_LICENSE.txt
diff --git a/package/freeswitch/freeswitch.mk b/package/freeswitch/freeswitch.mk
index 7219880530..63f6324af2 100644
--- a/package/freeswitch/freeswitch.mk
+++ b/package/freeswitch/freeswitch.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREESWITCH_VERSION = 1.10.5
+FREESWITCH_VERSION = 1.10.6
 FREESWITCH_SOURCE = freeswitch-$(FREESWITCH_VERSION).-release.tar.xz
 FREESWITCH_SITE = https://files.freeswitch.org/freeswitch-releases
 # External modules need headers/libs from staging
-- 
2.29.2
