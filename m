From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 28 Nov 2018 17:12:40 +0100
Subject: [Buildroot] [PATCH 10/11] pulseaudio: update dependency to
 fftw-single
In-Reply-To: <1543421561-37355-9-git-send-email-gwenj@trabucayre.com>
References: <1543421561-37355-1-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-2-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-3-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-4-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-5-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-6-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-7-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-8-git-send-email-gwenj@trabucayre.com>
 <1543421561-37355-9-git-send-email-gwenj@trabucayre.com>
Message-ID: <1543421561-37355-10-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 package/pulseaudio/pulseaudio.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pulseaudio/pulseaudio.mk b/package/pulseaudio/pulseaudio.mk
index d1c35654cf..ef744e6696 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -21,7 +21,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW),fftw) \
+	$(if $(BR2_PACKAGE_FFTW_PRECISION_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
-- 
2.19.2
