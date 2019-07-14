From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Jul 2019 16:11:41 +0200
Subject: [Buildroot] [git commit] package/glib-networking: drop
 ca_certificates
Message-ID: <20190714141051.B63E27FBA9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=023c5328d4bf6b1a31565375947d09c2d8ca8078
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ca_certificates option is no more available since
https://gitlab.gnome.org/GNOME/glib-networking/commit/72a83a4cbcf4c0214f3131991fabe41c41d33cd6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glib-networking/glib-networking.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/glib-networking/glib-networking.mk b/package/glib-networking/glib-networking.mk
index 163f1b0dd2..b11f3a4a67 100644
--- a/package/glib-networking/glib-networking.mk
+++ b/package/glib-networking/glib-networking.mk
@@ -16,7 +16,6 @@ GLIB_NETWORKING_DEPENDENCIES = \
 	gnutls
 
 GLIB_NETWORKING_CONF_OPTS = \
-	-Dca_certificates_path=/etc/ssl/certs/ca-certificates.crt \
 	-Dlibproxy_support=false \
 	-Dgnome_proxy_support=false \
 	-Dpkcs11_support=false
