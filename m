From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 14:53:19 +0100
Subject: [Buildroot] [git commit] package/links: add --disable-graphics
Message-ID: <20160221135333.2DA2C7FDC4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96d2bdfe7db8935f27c402004bc3aa2626b0af44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/links/links.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/links/links.mk b/package/links/links.mk
index 43f21d6..ec1771e 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -36,6 +36,8 @@ LINKS_DEPENDENCIES += tiff
 else
 LINKS_CONF_OPTS += --without-libtiff
 endif
+else
+LINKS_CONF_OPTS += --disable-graphics
 endif
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
