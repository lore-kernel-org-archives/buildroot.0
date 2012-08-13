From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 13 Aug 2012 17:02:36 -0300
Subject: [Buildroot] [PATCH 2/7] cifs-utils: bump to version 5.6
In-Reply-To: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
References: <1344888161-10068-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1344888161-10068-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cifs-utils/cifs-utils.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/cifs-utils/cifs-utils.mk b/package/cifs-utils/cifs-utils.mk
index e2530c0..cfa2b91 100644
--- a/package/cifs-utils/cifs-utils.mk
+++ b/package/cifs-utils/cifs-utils.mk
@@ -1,6 +1,8 @@
-CIFS_UTILS_VERSION = 5.5
+CIFS_UTILS_VERSION = 5.6
 CIFS_UTILS_SOURCE  = cifs-utils-$(CIFS_UTILS_VERSION).tar.bz2
 CIFS_UTILS_SITE    = http://ftp.samba.org/pub/linux-cifs/cifs-utils
+CIFS_UTILS_LICENSE = GPLv3
+CIFS_UTILS_LICENSE_FILES = COPYING
 
 define CIFS_UTILS_NO_WERROR
 	$(SED) 's/-Werror//' $(@D)/Makefile.in
-- 
1.7.8.6
