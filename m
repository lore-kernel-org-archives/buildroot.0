From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:03:24 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libfribidi:
 enable host build
Message-ID: <20191223075903.8C7048DEC1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a6a2420a95911bbbf757d81d03c3e8f7cda5672d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 4bfa49d1957e1381324a8c532739ee46f18063cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libfribidi/libfribidi.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 4394623592..0e17be6db0 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -13,3 +13,4 @@ LIBFRIBIDI_INSTALL_STAGING = YES
 LIBFRIBIDI_DEPENDENCIES = host-pkgconf
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
