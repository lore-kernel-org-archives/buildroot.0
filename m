From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 6 Feb 2017 15:24:21 +0100
Subject: [Buildroot] [git commit] nginx-naxsi: bump to version 0.55.2
Message-ID: <20170206144900.59BBC80DB8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=efc93ffadddfd8467bb88f155cbc07796554ec14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/nginx-naxsi/nginx-naxsi.hash | 2 +-
 package/nginx-naxsi/nginx-naxsi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx-naxsi/nginx-naxsi.hash b/package/nginx-naxsi/nginx-naxsi.hash
index e545a1d..967f788 100644
--- a/package/nginx-naxsi/nginx-naxsi.hash
+++ b/package/nginx-naxsi/nginx-naxsi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	45dd0df7a6b0b6aa9c64eb8c39a8e294d659d87fb18e192cf58f1402f3cdb0a8	nginx-naxsi-0.55.1.tar.gz
+sha256	256378564e36b8f222adb8fbe746529e73413c6cbe2b0e5574f41dfd62d92577	nginx-naxsi-0.55.2.tar.gz
diff --git a/package/nginx-naxsi/nginx-naxsi.mk b/package/nginx-naxsi/nginx-naxsi.mk
index 1c5bd8d..fb5e00a 100644
--- a/package/nginx-naxsi/nginx-naxsi.mk
+++ b/package/nginx-naxsi/nginx-naxsi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_NAXSI_VERSION = 0.55.1
+NGINX_NAXSI_VERSION = 0.55.2
 NGINX_NAXSI_SITE = $(call github,nbs-system,naxsi,$(NGINX_NAXSI_VERSION))
 NGINX_NAXSI_LICENSE = GPLv2+ with OpenSSL exception
 NGINX_NAXSI_LICENSE_FILES = naxsi_src/naxsi_json.c
