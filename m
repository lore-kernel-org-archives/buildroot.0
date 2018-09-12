From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 12 Sep 2018 21:11:14 +0200
Subject: [Buildroot] [git commit] package/bluez-alsa: bump to version 1.3.1
Message-ID: <20180912191026.60CF885278@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9a580a4f31ac6c6bb2db2defe278fa047880c89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bluez-alsa/bluez-alsa.hash | 2 +-
 package/bluez-alsa/bluez-alsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 5036f82eaa..3463ecf8d3 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  20005c4a153346ea7941973e9b7bd0b228417351f2e8ce88d1c02cc62bca188e  bluez-alsa-v1.3.0.tar.gz
+sha256  29dad23877d0cf46a16e2f8d3746219e89068c33d052059caf1caaacd8b40cac  bluez-alsa-v1.3.1.tar.gz
 sha256  4738489ada14818fe4c53ce86223d7b2f4c1f57cb1f93d62c973c94a89080e83  LICENSE.txt
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index fdf7e464a7..5c0bb4f12b 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = v1.3.0
+BLUEZ_ALSA_VERSION = v1.3.1
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE.txt
