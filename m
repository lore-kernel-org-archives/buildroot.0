From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 24 Jun 2016 13:11:21 +0200
Subject: [Buildroot] [git commit] webrtc-audio-processing: bump to version
	0.3
Message-ID: <20160624111141.C39A581D7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27797d9d278fd76a3f55fcdbcd450130f8f19d61
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed by the recent pulseaudio version bump:

https://lwn.net/Articles/692424/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webrtc-audio-processing/webrtc-audio-processing.hash | 2 +-
 package/webrtc-audio-processing/webrtc-audio-processing.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.hash b/package/webrtc-audio-processing/webrtc-audio-processing.hash
index afba5a9..fe07119 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.hash
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	ed4b52f9c2688b97628035a5565377d74704d7c04de4254a768df3342c7afedc	webrtc-audio-processing-0.1.tar.xz
+sha256	756e291d4f557d88cd50c4fe3b8454ec238362d22cedb3e6173240d90f0a80fa  webrtc-audio-processing-0.3.tar.xz
diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 92fcba9..587f1aa 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
+WEBRTC_AUDIO_PROCESSING_VERSION = 0.3
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
