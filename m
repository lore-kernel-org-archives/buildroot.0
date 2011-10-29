From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 29 Oct 2011 16:35:47 +0200
Subject: [Buildroot] [git commit] pulseaudio: needs host-intltool
Message-ID: <20111029155944.E8DE68EBC2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=296eb11299d1240b3570aba5abb8374a0911bf44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/pulseaudio/pulseaudio.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/pulseaudio/pulseaudio.mk b/package/multimedia/pulseaudio/pulseaudio.mk
index 5e68dfb..a2d0552 100644
--- a/package/multimedia/pulseaudio/pulseaudio.mk
+++ b/package/multimedia/pulseaudio/pulseaudio.mk
@@ -14,7 +14,7 @@ PULSEAUDIO_CONF_OPT = \
 	--disable-legacy-database-entry-format
 
 PULSEAUDIO_DEPENDENCIES = \
-	host-pkg-config libtool json-c libsndfile speex \
+	host-pkg-config libtool json-c libsndfile speex host-intltool \
 	$(if $(BR2_PACKAGE_LIBINTL),libintl) \
 	$(if $(BR2_PACKAGE_LIBATOMIC_OPS),libatomic_ops) \
 	$(if $(BR2_PACKAGE_LIBSAMPLERATE),libsamplerate) \
