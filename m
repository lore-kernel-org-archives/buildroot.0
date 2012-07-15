From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 15 Jul 2012 10:47:44 -0300
Subject: [Buildroot] [PATCH 5/6] cifs-utils: bump to version 5.5
In-Reply-To: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
References: <1342360065-10106-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1342360065-10106-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump cifs-utils to version 5.5
Also switch to http source instead of ftp.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index 0fdb689..15ed17a 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,6 +1,6 @@
-CIFS_UTILS_VERSION = 5.4
+CIFS_UTILS_VERSION = 5.5
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
-CIFS_UTILS_SITE    = ftp://ftp.samba.org/pub/linux-cifs/cifs-utils/
+CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
 
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
-- 
1.7.8.6
