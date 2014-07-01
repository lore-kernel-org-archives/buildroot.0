From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:43:21 +0200
Subject: [Buildroot] [git commit] webrtc-audio-processing: add license
	information
Message-ID: <20140701224922.893489D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=348212420a0c4170bc41c42481a167781ad31af8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../webrtc-audio-processing.mk                     |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/webrtc-audio-processing/webrtc-audio-processing.mk b/package/webrtc-audio-processing/webrtc-audio-processing.mk
index 9f76cba..69f7f01 100644
--- a/package/webrtc-audio-processing/webrtc-audio-processing.mk
+++ b/package/webrtc-audio-processing/webrtc-audio-processing.mk
@@ -8,6 +8,8 @@ WEBRTC_AUDIO_PROCESSING_VERSION = 0.1
 WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
 WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing/
 WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
+WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3c
+WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_SOFT_FLOAT),y)
 WEBRTC_AUDIO_PROCESSING_CONF_OPT += --with-ns-mode=fixed
