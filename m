From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 10 May 2013 18:29:28 +0200
Subject: [Buildroot] [PATCH 06/16] libcdaudio: handle libcdaudio-config
	script
In-Reply-To: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1368203379-3385-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1368203379-3385-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcdaudio/libcdaudio.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcdaudio/libcdaudio.mk b/package/libcdaudio/libcdaudio.mk
index 203a8aa..92efabc 100644
--- a/package/libcdaudio/libcdaudio.mk
+++ b/package/libcdaudio/libcdaudio.mk
@@ -10,5 +10,6 @@ LIBCDAUDIO_SITE = http://downloads.sourceforge.net/project/libcdaudio/libcdaudio
 LIBCDAUDIO_AUTORECONF = YES
 LIBCDAUDIO_LIBTOOL_PATCH = YES
 LIBCDAUDIO_INSTALL_STAGING = YES
+LIBCDAUDIO_CONFIG_SCRIPTS = libcdaudio-config
 
 $(eval $(autotools-package))
-- 
1.7.9.5
