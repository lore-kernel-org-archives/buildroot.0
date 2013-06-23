From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 23 Jun 2013 22:40:54 +0200
Subject: [Buildroot] [PATCH 3/4] package/tvheadend: bump version for libav
	fixes
In-Reply-To: <cover.1372019882.git.yann.morin.1998@free.fr>
References: <cover.1372019882.git.yann.morin.1998@free.fr>
Message-ID: <ed0c7b1d697278b8bab9da2bcc351c9dfedf7f94.1372019882.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 81cb062..4f9a148 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION           = 5513b44
+TVHEADEND_VERSION           = 6cb8eaa
 TVHEADEND_SITE              = git://github.com/tvheadend/tvheadend.git
 TVHEADEND_LICENSE           = GPLv3+
 TVHEADEND_LICENSE_FILES     = LICENSE
-- 
1.8.1.2
