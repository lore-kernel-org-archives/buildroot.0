From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Feb 2013 17:01:14 +0100
Subject: [Buildroot] [PATCH 1/7] package/usbredir: update to version 0.6
In-Reply-To: <cover.1359993560.git.yann.morin.1998@free.fr>
References: <cover.1359993560.git.yann.morin.1998@free.fr>
Message-ID: <f5c06bd5a6b45b336c3f3b96c388ae37e06a465c.1359993560.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/usbredir/usbredir.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/usbredir/usbredir.mk b/package/usbredir/usbredir.mk
index f0530a7..efdb1be 100644
--- a/package/usbredir/usbredir.mk
+++ b/package/usbredir/usbredir.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBREDIR_VERSION         = 0.4.4
+USBREDIR_VERSION         = 0.6
 USBREDIR_SOURCE          = usbredir-$(USBREDIR_VERSION).tar.bz2
 USBREDIR_SITE            = http://spice-space.org/download/usbredir
 USBREDIR_LICENSE         = LGPLv2.1+
-- 
1.7.2.5
