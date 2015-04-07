From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:04:26 +0200
Subject: [Buildroot] [git commit] espeak: fix legal info
Message-ID: <20150407200457.244A07FBD9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9b19145d4627fe08d1e7b7aaf11846123b39d069
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The file is License.txt, not License.txt (so, the other english). Fixes:
http://autobuild.buildroot.net/results/a8b/a8b2b93e96901fe4fdfb64e1941c5c45bd52c742/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/espeak/espeak.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
