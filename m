From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Sun, 10 Mar 2013 19:32:42 +0100
Subject: [Buildroot] [PATCH 01/10] directfb: bumping version to 1.6.3
In-Reply-To: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
References: <1362940371-25899-1-git-send-email-c.schoenert@gmail.com>
Message-ID: <1362940371-25899-2-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
 package/directfb/directfb.mk |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/directfb/directfb.mk b/package/directfb/directfb.mk
index 4f05ed2..8c701db 100644
--- a/package/directfb/directfb.mk
+++ b/package/directfb/directfb.mk
@@ -3,8 +3,8 @@
 # directfb
 #
 #############################################################
-DIRECTFB_VERSION_MAJOR = 1.4
-DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).17
+DIRECTFB_VERSION_MAJOR = 1.6
+DIRECTFB_VERSION = $(DIRECTFB_VERSION_MAJOR).3
 DIRECTFB_SITE = http://www.directfb.org/downloads/Core/DirectFB-$(DIRECTFB_VERSION_MAJOR)
 DIRECTFB_SOURCE = DirectFB-$(DIRECTFB_VERSION).tar.gz
 DIRECTFB_LICENSE = LGPLv2.1+
-- 
1.7.10.4
