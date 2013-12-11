From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Dec 2013 10:23:44 -0300
Subject: [Buildroot] [PATCH 11/16] libcdaudio: add licensing info
In-Reply-To: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
References: <1386768229-29485-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1386768229-29485-11-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcdaudio/libcdaudio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 06f8926..814239b 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -8,5 +8,7 @@ LIBCDAUDIO_VERSION = 0.99.12p2
 LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio/$(LIBCDAUDIO_VERSION)/
 LIBCDAUDIO_INSTALL_STAGING = YES
 LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
+LIBCDAUDIO_LICENSE = GPLv2+
+LIBCDAUDIO_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.3.2
