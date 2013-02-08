From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  8 Feb 2013 18:32:57 +0100
Subject: [Buildroot] [PATCH 3/6] package/libconfuse: add host variant
In-Reply-To: <cover.1360344619.git.yann.morin.1998@free.fr>
References: <cover.1360344619.git.yann.morin.1998@free.fr>
Message-ID: <9832ab382fe5a635ee2a6c020347fa16ff91c1f9.1360344619.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Needed later by genimage.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
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
-- 
1.7.2.5
