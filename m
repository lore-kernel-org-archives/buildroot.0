From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Wed, 10 Aug 2011 00:12:54 +0200
Subject: [Buildroot] [PATCH 21/22] diretcfb: remove --program-prefix
In-Reply-To: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
References: <1312927975-15543-1-git-send-email-yann.morin.1998@anciens.enib.fr>
Message-ID: <1312927975-15543-21-git-send-email-yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--program-prefix is now set in the auto-target infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 package/directfb/directfb.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 5af65d7..5e05451 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -12,7 +12,6 @@ DIRECTFB_INSTALL_STAGING = YES
 DIRECTFB_CONF_OPT = \
 	--localstatedir=/var \
 	--disable-explicit-deps \
-	--program-prefix='' \
 	--enable-zlib \
 	--enable-freetype \
 	--enable-fbdev \
-- 
1.7.2.5
