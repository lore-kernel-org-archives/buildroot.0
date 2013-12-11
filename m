From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:25:37 +0100
Subject: [Buildroot] [git commit] libcdaudio: add licensing info
Message-ID: <20131211213615.650009BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f36827703a3b2ed6eb18643fbd151e74ff885114
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcdaudio/libcdaudio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
