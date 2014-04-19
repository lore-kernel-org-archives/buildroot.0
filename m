From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 19 Apr 2014 22:57:54 +0200
Subject: [Buildroot] [PATCH 2/8] coxpcall: bump to version 1.15.0
In-Reply-To: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
References: <1397941080-24157-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <1397941080-24157-3-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/coxpcall/coxpcall.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/coxpcall/coxpcall.mk b/package/coxpcall/coxpcall.mk
index 11f823f..ec147db 100644
--- a/package/coxpcall/coxpcall.mk
+++ b/package/coxpcall/coxpcall.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COXPCALL_VERSION = 1.14.0-1
-COXPCALL_SUBDIR  = coxpcall-1_14_0
+COXPCALL_VERSION = 1.15.0-1
+COXPCALL_SUBDIR  = coxpcall
 COXPCALL_LICENSE = MIT
 
 $(eval $(luarocks-package))
-- 
1.9.1
