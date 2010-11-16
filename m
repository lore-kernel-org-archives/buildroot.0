From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 16 Nov 2010 09:12:54 -0500
Subject: [Buildroot] [PATCH] m4: version bump to 1.4.15
Message-ID: <1289916774-27881-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
 package/m4/m4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/m4/m4.mk b/package/m4/m4.mk
index 7f2e333..d713b6d 100644
--- a/package/m4/m4.mk
+++ b/package/m4/m4.mk
@@ -3,7 +3,7 @@
 # m4
 #
 #############################################################
-M4_VERSION = 1.4.9
+M4_VERSION = 1.4.15
 M4_SOURCE = m4-$(M4_VERSION).tar.bz2
 M4_SITE = $(BR2_GNU_MIRROR)/m4
 
-- 
1.7.3.2
