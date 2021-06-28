From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
Date: Mon, 28 Jun 2021 06:22:25 +0000
Subject: [Buildroot] [PATCH 1/1] package/portaudio: bump to version
 v190700_20210406
Message-ID: <20210628062225.134790-1-joerg.krause@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note, that the download URL has changed for the new release.

Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
---
 package/portaudio/portaudio.hash | 2 +-
 package/portaudio/portaudio.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
index 903d760ce0..ba3c506f18 100644
--- a/package/portaudio/portaudio.hash
+++ b/package/portaudio/portaudio.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513  pa_stable_v190600_20161030.tgz
+sha256  47efbf42c77c19a05d22e627d42873e991ec0c1357219c0d74ce6a2948cb2def  pa_stable_v190700_20210406.tgz
 sha256  ec52a1952d701f94e5135719a47376da4ee0b4a0201f1cafb49f61db6480ac3d  LICENSE.txt
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 0cf754c7d5..cc3f34cae8 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v190600_20161030
-PORTAUDIO_SITE = http://www.portaudio.com/archives
+PORTAUDIO_VERSION = v190700_20210406
+PORTAUDIO_SITE = http://files.portaudio.com/archives
 PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
-- 
2.32.0
