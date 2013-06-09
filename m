From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun,  9 Jun 2013 09:37:14 -0300
Subject: [Buildroot] [PATCH] dosfstools: upstream tarball site changed
Message-ID: <1370781434-15528-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changed their distribution tarball site.
Thanks go to Andrew Scheller from bug #6308 for noticing and reporting.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/dosfstools/dosfstools.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dosfstools/dosfstools.mk b/package/dosfstools/dosfstools.mk
index 624198c..7482bc8 100644
--- a/package/dosfstools/dosfstools.mk
+++ b/package/dosfstools/dosfstools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 DOSFSTOOLS_VERSION = 3.0.16
-DOSFSTOOLS_SITE = http://fossies.org/linux/misc
+DOSFSTOOLS_SITE = http://daniel-baumann.ch/files/software/dosfstools
 DOSFSTOOLS_LICENSE = GPLv3+
 DOSFSTOOLS_LICENSE_FILES = COPYING
 DOSFSTOOLS_LDFLAGS = $(TARGET_LDFLAGS)
-- 
1.8.1.5
