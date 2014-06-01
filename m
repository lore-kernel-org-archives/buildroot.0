From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  1 Jun 2014 23:03:33 +0200
Subject: [Buildroot] [PATCH 09/26] package/tvheadend: bump version
In-Reply-To: <cover.1401656581.git.yann.morin.1998@free.fr>
References: <cover.1401656581.git.yann.morin.1998@free.fr>
Message-ID: <8822d8454e6ff99dbcb7364e9cfd72f5c4ff75a6.1401656581.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Lotta fixes all over the tree.
Still no new release... :-/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tvheadend/tvheadend.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index ac4c290..244e129 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 6482d33ba90848018c530018e5c38992b8ac921c
+TVHEADEND_VERSION = 0ebca1b3dbb6a18d8adcf66a32b5922ce769b9b5
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPLv3+
 TVHEADEND_LICENSE_FILES = LICENSE
-- 
1.8.3.2
