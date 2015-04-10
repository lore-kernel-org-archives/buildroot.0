From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 10 Apr 2015 15:26:49 -0300
Subject: [Buildroot] [PATCH] procps-ng: needs gettextize
Message-ID: <1428690409-7183-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.org/results/904/90401cdb471f9e9582e2ca2ad07fb3db148420d7/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/procps-ng/procps-ng.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 4ee60f3..07e98b9 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -13,6 +13,7 @@ PROCPS_NG_INSTALL_STAGING = YES
 PROCPS_NG_DEPENDENCIES = ncurses host-pkgconf
 # For 0002-use-pkgconfig-for-ncursesw-cflags.patch
 PROCPS_NG_AUTORECONF = YES
+PROCPS_NG_GETTEXTIZE = YES
 
 # If both procps-ng and busybox are selected, make certain procps-ng
 # wins the fight over who gets to have their utils actually installed.
-- 
2.0.5
