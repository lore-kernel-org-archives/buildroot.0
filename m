From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 17:23:07 +0100
Subject: [Buildroot] [git commit] portaudio: bump to version 190600_20161030
Message-ID: <20170204162522.463438164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbc5bdf8b95f15719efb4aa69fe2f9277d6fce57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portaudio/portaudio.hash | 2 +-
 package/portaudio/portaudio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
index 2a19316..ca7baf7 100644
--- a/package/portaudio/portaudio.hash
+++ b/package/portaudio/portaudio.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	8fe024a5f0681e112c6979808f684c3516061cc51d3acc0b726af98fc96c8d57	pa_stable_v19_20140130.tgz
+sha256	f5a21d7dcd6ee84397446fa1fa1a0675bb2e8a4a6dceb4305a8404698d8d1513	pa_stable_v190600_20161030.tgz
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index d1ef07a..0cf754c 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v19_20140130
+PORTAUDIO_VERSION = v190600_20161030
 PORTAUDIO_SITE = http://www.portaudio.com/archives
 PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
