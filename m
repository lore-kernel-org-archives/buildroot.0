From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 13 Jan 2016 22:04:25 +0100
Subject: [Buildroot] [git commit] package/portaudio: bump to version
	v19_20140130
Message-ID: <20160113210835.9C188826B9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a8b11b478be5a6535560b47b1eb0ba4a2786e110
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/portaudio/portaudio.hash | 2 +-
 package/portaudio/portaudio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/portaudio/portaudio.hash b/package/portaudio/portaudio.hash
index b83e9d9..2a19316 100644
--- a/package/portaudio/portaudio.hash
+++ b/package/portaudio/portaudio.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	9c26d1330d506496789edafe55b0386f20d83c4aa2c0e3f81fbeb0f114ab1b99	pa_stable_v19_20111121.tgz
+sha256	8fe024a5f0681e112c6979808f684c3516061cc51d3acc0b726af98fc96c8d57	pa_stable_v19_20140130.tgz
diff --git a/package/portaudio/portaudio.mk b/package/portaudio/portaudio.mk
index 0353d65..d1ef07a 100644
--- a/package/portaudio/portaudio.mk
+++ b/package/portaudio/portaudio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PORTAUDIO_VERSION = v19_20111121
+PORTAUDIO_VERSION = v19_20140130
 PORTAUDIO_SITE = http://www.portaudio.com/archives
 PORTAUDIO_SOURCE = pa_stable_$(PORTAUDIO_VERSION).tgz
 PORTAUDIO_INSTALL_STAGING = YES
