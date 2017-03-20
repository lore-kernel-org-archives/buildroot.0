From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Mar 2017 23:34:01 +0100
Subject: [Buildroot] [git commit] package/lcms2: add support for host variant
Message-ID: <20170320225510.0737382601@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ce6e1da7bd73721694ebdd29183311170f52491a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed for upcoming ghostscript package.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lcms2/lcms2.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 9a4cf5e..29f8ac8 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -31,4 +31,5 @@ else
 LCMS2_CONF_OPTS += --without-zlib
 endif
 
+$(eval $(host-autotools-package))
 $(eval $(autotools-package))
