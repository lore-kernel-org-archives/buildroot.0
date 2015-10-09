From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 9 Oct 2015 15:23:46 +0200
Subject: [Buildroot] [git commit] bind: bump to version 9.9.8
Message-ID: <20151009132403.BCB6C81F4D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5fa81e745b2bc6f9beb6656b973ebb5a9dc5585
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/bind/bind.hash |    4 ++--
 package/bind/bind.mk   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/bind/bind.hash b/package/bind/bind.hash
index 4c9fc40..7f52c55 100644
--- a/package/bind/bind.hash
+++ b/package/bind/bind.hash
@@ -1,2 +1,2 @@
-# Verified from ftp://ftp.isc.org/isc/bind9/9.9.7-P3/bind-9.9.7-P3.tar.gz.sha256.asc
-sha256	cb737dce18350890f350dd7d3bc836c62ea440103dfde184c09bc18cfad8a844	bind-9.9.7-P3.tar.gz
+# Verified from ftp://ftp.isc.org/isc/bind9/9.9.8/bind-9.9.8.tar.gz.sha256.asc
+sha256	643997cdb0dd232a4c9f7c0f1436841fbf325c6b7269e6490bf5f380eda344e3	bind-9.9.8.tar.gz
diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index 95051d1..e93b356 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BIND_VERSION = 9.9.7-P3
+BIND_VERSION = 9.9.8
 BIND_SITE = ftp://ftp.isc.org/isc/bind9/$(BIND_VERSION)
 BIND_INSTALL_STAGING = YES
 BIND_CONFIG_SCRIPTS = bind9-config isc-config.sh
