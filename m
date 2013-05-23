From: Gilles Talis <gilles.talis@gmail.com>
Date: Thu, 23 May 2013 11:09:04 -0700
Subject: [Buildroot] [PATCH v2 4/5] portaudio: add license information
Message-ID: <1369332544-5438-1-git-send-email-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/portaudio/portaudio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 34b0bd9..0efec5c 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -9,6 +9,8 @@ PORTAUDIO_SITE = http://www.portaudio.com/archives
 PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
+PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
+PORTAUDIO_LICENSE_FILES = LICENSE.txt
 
 PORTAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_PORTAUDIO_WITH_ALSA),alsa-lib)
-- 
1.7.4.1
