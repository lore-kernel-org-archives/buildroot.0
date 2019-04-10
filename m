From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 10 Apr 2019 19:31:09 +0200
Subject: [Buildroot] [git commit] package/lldpd: remove --without-json
Message-ID: <20190410172749.738C08D295@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2bbe9c41c69176d09863c356e307de2d9ed5cb94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

json option has been removed in version 0.9.7 with
https://github.com/vincentbernat/lldpd/commit/06987a24ce053cbb57f8853bbf544bc7c067c8aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lldpd/lldpd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/lldpd/lldpd.mk b/package/lldpd/lldpd.mk
index 8d554ae5e2..506b6f136d 100644
--- a/package/lldpd/lldpd.mk
+++ b/package/lldpd/lldpd.mk
@@ -31,7 +31,6 @@ LLDPD_CONF_OPTS = \
 	--without-embedded-libevent \
 	--without-snmp \
 	--without-xml \
-	--without-json \
 	--without-seccomp \
 	--without-libbsd \
 	--disable-hardening \
