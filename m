From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Mar 2015 08:36:01 +0100
Subject: [Buildroot] [git commit] bind: bump to version 9.9.7
Message-ID: <20150303074049.7CB6080481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb107525484304ddc47332c215d0bbeb5995b856
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bind/bind.hash |    4 ++--
 package/bind/bind.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index aac0a84..6bbd00f 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.6-P2/bind-9.9.6-P2.tar.gz.sha256.asc
-sha256	5e882f453a8c799a121272f68bdb90936ce97bb857f8c2b3af1c8ba3d1b749ed	bind-9.9.6-P2.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7/bind-9.9.7.tar.gz.sha256.asc
+sha256	3f23e7fcb363a2594ed1f065868c2c1080a93636a4fcb4c47f9e164e2cd74c66	bind-9.9.7.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index ad41330..96ed23e 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.6-P2
+BIND_VERSION = 9.9.7
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
