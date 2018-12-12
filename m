From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Wed, 12 Dec 2018 08:45:38 +0100
Subject: [Buildroot] [PATCH v2 13/14] pulseaudio: update dependency to
 fftw-single
In-Reply-To: <20181212074539.11656-1-gwenj@trabucayre.com>
References: <20181212074539.11656-1-gwenj@trabucayre.com>
Message-ID: <20181212074539.11656-13-gwenj@trabucayre.com>
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
index d1c35654cf..c91af22935 100644
--- a/package/pulseaudio/pulseaudio.mk
+++ b/package/pulseaudio/pulseaudio.mk
@@ -21,7 +21,7 @@ PULSEAUDIO_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_AVAHI_DAEMON),avahi) \
 	$(if $(BR2_PACKAGE_DBUS),dbus) \
 	$(if $(BR2_PACKAGE_OPENSSL),openssl) \
-	$(if $(BR2_PACKAGE_FFTW),fftw) \
+	$(if $(BR2_PACKAGE_FFTW_SINGLE),fftw-single) \
 	$(if $(BR2_PACKAGE_SYSTEMD),systemd)
 
 ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
-- 
2.19.2
