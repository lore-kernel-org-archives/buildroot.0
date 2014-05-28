From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 17:06:59 +0200
Subject: [Buildroot] [PATCH] package/exim: security bump
Message-ID: <1401289619-17456-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump exim to get an urgent security fix.

We should not be impacted, since we're not building with DMARC (where
the flaw is), but better safe than sorry.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/exim/exim.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index b780b85..0f9c6af 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.82
+EXIM_VERSION = 4.82.1
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.bz2
 EXIM_SITE = ftp://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPLv2+
-- 
1.8.3.2
