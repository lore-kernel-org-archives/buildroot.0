From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 14 Jun 2021 08:33:46 +0000
Subject: [Buildroot] [PATCH 1/1] package/bluez-alsa: bump to version 3.1.0
Message-ID: <20210614083346.361221-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/bluez-alsa/bluez-alsa.hash | 2 +-
 package/bluez-alsa/bluez-alsa.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bluez-alsa/bluez-alsa.hash b/package/bluez-alsa/bluez-alsa.hash
index 6be93bc045..f6e7294681 100644
--- a/package/bluez-alsa/bluez-alsa.hash
+++ b/package/bluez-alsa/bluez-alsa.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  8b9bc36be922c10c6628ddf84b13dfadfeb3ab0bcf72bad842c66f3120abc6b2  bluez-alsa-3.0.0.tar.gz
+sha256  d9a878d9fd7f18842c9c8ed83bc96cab684753c90f2751d575a3cdd776ec78a5  bluez-alsa-3.1.0.tar.gz
 sha256  60253922a459245128c34eb379cbda7c76936636d4c10edc576663a0f560dd4d  LICENSE
diff --git a/package/bluez-alsa/bluez-alsa.mk b/package/bluez-alsa/bluez-alsa.mk
index 9262a7f66b..f81720f767 100644
--- a/package/bluez-alsa/bluez-alsa.mk
+++ b/package/bluez-alsa/bluez-alsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BLUEZ_ALSA_VERSION = 3.0.0
+BLUEZ_ALSA_VERSION = 3.1.0
 BLUEZ_ALSA_SITE = $(call github,Arkq,bluez-alsa,v$(BLUEZ_ALSA_VERSION))
 BLUEZ_ALSA_LICENSE = MIT
 BLUEZ_ALSA_LICENSE_FILES = LICENSE
-- 
2.32.0
