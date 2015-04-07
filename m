From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  7 Apr 2015 14:18:13 -0300
Subject: [Buildroot] [PATCH] espeak: fix legal info
Message-ID: <1428427093-28727-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The file is License.txt, not License.txt (so, the other english). Fixes:
http://autobuild.buildroot.net/results/a8b/a8b2b93e96901fe4fdfb64e1941c5c45bd52c742/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/espeak/espeak.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/espeak/espeak.mk b/package/espeak/espeak.mk
index bb9a247..0aa049e 100644
--- a/package/espeak/espeak.mk
+++ b/package/espeak/espeak.mk
@@ -9,7 +9,7 @@ ESPEAK_VERSION = $(ESPEAK_VERSION_MAJOR).04
 ESPEAK_SOURCE = espeak-$(ESPEAK_VERSION)-source.zip
 ESPEAK_SITE = http://downloads.sourceforge.net/project/espeak/espeak/espeak-$(ESPEAK_VERSION_MAJOR)
 ESPEAK_LICENSE = GPLv3+
-ESPEAK_LICENSE_FILES = Licence.txt
+ESPEAK_LICENSE_FILES = License.txt
 
 ifeq ($(BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_ALSA),y)
 ESPEAK_AUDIO_BACKEND = portaudio
-- 
2.0.5
