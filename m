From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 29 Jun 2021 21:59:16 +0200
Subject: [Buildroot] [git commit] package/portaudio: bump to version
 v190700_20210406
Message-ID: <20210629192723.D9AC78E52E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9ab8b9cd7ed666b3f4d224e3a1cb58868fc11bbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note, that the download URL has changed for the new release.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
[yann.morin.1998 at free.fr: move 'v' out of _VERSION]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/portaudio/portaudio.hash | 2 +-
 package/portaudio/portaudio.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index 0cf754c7d5..58798dda87 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v190600_20161030
-PORTAUDIO_SITE = http://www.portaudio.com/archives
-PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
+PORTAUDIO_VERSION = 190700_20210406
+PORTAUDIO_SITE = http://files.portaudio.com/archives
+PORTAUDIO_SOURCE = pa_stable_v$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
 PORTAUDIO_MAKE = $(MAKE1)
 PORTAUDIO_LICENSE = portaudio license (MIT-like plus special clause)
