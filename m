From: =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>
Date: Wed,  4 Nov 2015 19:46:06 +0100
Subject: [Buildroot] [PATCH 1/2] package/nginx: fix a typo
Message-ID: <1446662767-15730-1-git-send-email-nrubinstein@aldebaran.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: No? Rubinstein <nrubinstein@aldebaran.com>
---
 package/nginx/nginx.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 32a337c..8e23bd8 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -19,7 +19,7 @@ NGINX_CONF_OPTS = \
 
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
-# See system/skeleton/passwd
+# See system/skeleton/etc/passwd
 #   username: www-data    uid: 33
 #   groupname: www-data   gid: 33
 #
-- 
2.1.4
