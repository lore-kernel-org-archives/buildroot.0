From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  3 Dec 2012 11:46:05 -0300
Subject: [Buildroot] [PATCH 07/14] ed: bump to version 1.7
In-Reply-To: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
References: <1354545972-26783-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1354545972-26783-7-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ed/ed.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/ed/ed.mk b/package/ed/ed.mk
index a97e19b..2bb8e0e 100644
--- a/package/ed/ed.mk
+++ b/package/ed/ed.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-ED_VERSION = 1.6
+ED_VERSION = 1.7
 ED_SITE = $(BR2_GNU_MIRROR)/ed
 ED_CONF_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 		LDFLAGS="$(TARGET_LDFLAGS)"
+ED_LICENSE = GPLv3+
+ED_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.7.8.6
