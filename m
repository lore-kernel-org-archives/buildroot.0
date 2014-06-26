From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:19 -0300
Subject: [Buildroot] [PATCH 51/53] webrtc-audio-processing: add license
	information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-51-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/webrtc-audio-processing/webrtc-audio-processing.mk | 2 ++
 1 file changed, 2 insertions(+)

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
-- 
1.8.5.5
