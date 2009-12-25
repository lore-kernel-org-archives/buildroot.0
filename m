From: Nigel Kukard <nkukard@lbsd.net>
Date: Fri, 25 Dec 2009 10:35:32 +0000
Subject: [Buildroot] [PATCH 1/1] Bump bootutils
In-Reply-To: <cover.1261737329.git.nkukard@lbsd.net>
References: <cover.1261737329.git.nkukard@lbsd.net>
Message-ID: <4d190ec0bfccedbc2d84f76f4de5bd8e7ed5d612.1261737329.git.nkukard@lbsd.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Nigel Kukard <nkukard@lbsd.net>
---
 package/bootutils/bootutils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/bootutils/bootutils.mk b/package/bootutils/bootutils.mk
index fda0a4d..dd22479 100644
--- a/package/bootutils/bootutils.mk
+++ b/package/bootutils/bootutils.mk
@@ -3,7 +3,7 @@
 # bootutils
 #
 #############################################################
-BOOTUTILS_VERSION = 0.0.9
+BOOTUTILS_VERSION = 1.0.0
 BOOTUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/bootutils
 
 BOOTUTILS_CONF_OPT = --prefix=/ --exec-prefix=/
-- 
1.6.4
