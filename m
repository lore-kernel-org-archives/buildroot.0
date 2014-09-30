From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 30 Sep 2014 20:13:22 -0300
Subject: [Buildroot] [PATCH] bind: bump to version 9.9.6
Message-ID: <1412118802-1121-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/bind/bind.hash | 2 ++
 package/bind/bind.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/bind/bind.hash

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
new file mode 100644
index 0000000..9cf9801
--- /dev/null
+++ b/package/bind/bind.hash
@@ -0,0 +1,2 @@
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6/bind-9.9.6.tar.gz.*.asc
+sha256	6b9432644a3bfa41695354543bd9e2547104e35f3c7354a416a030a4cdd1c514	bind-9.9.6.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index e0784e6..eac6e78 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.5-P1
+BIND_VERSION = 9.9.6
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
-- 
2.0.4
