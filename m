From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 11 May 2013 22:40:09 +0200
Subject: [Buildroot] [git commit branch/next] libcdaudio: handle
	libcdaudio-config script
Message-ID: <20130511204538.D3B339A0DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7fb8e6a55636a2161dbf9a3fc41a0d0d24b74591
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libcdaudio/libcdaudio.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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
