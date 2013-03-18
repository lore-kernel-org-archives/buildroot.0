From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 18 Mar 2013 23:04:42 +0100
Subject: [Buildroot] [git commit] package/libconfuse: add host variant
Message-ID: <20130318221420.15ABA9B169@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3007e5894972f27e318adc8c8b1c3a618d5188e3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Needed later by genimage.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libconfuse/libconfuse.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 2fa8241..d88a209 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -10,3 +10,4 @@ LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
