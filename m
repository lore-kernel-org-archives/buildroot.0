From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 1 Oct 2014 14:02:51 +0200
Subject: [Buildroot] [git commit] bind: bump to version 9.9.6
Message-ID: <20141001120417.B516C9D7EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f284a1170897790f16d745ee91df5845d05e0fd4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash |    2 ++
 package/bind/bind.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
