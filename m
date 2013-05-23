From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 23 May 2013 20:56:17 +0200
Subject: [Buildroot] [git commit] portaudio: add license information
Message-ID: <20130523205039.A44509A4E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4344ffd28259dd67f030e4d13af1c13618442b11
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
