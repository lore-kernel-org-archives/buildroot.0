From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Feb 2021 23:27:32 +0100
Subject: [Buildroot] [git commit branch/next] package/ustream-ssl: bump
 version to 68d0924
Message-ID: <20210213221553.D5BC581358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2766ac8d577074b478ff8f65bbea9ccea3cdb5ad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

- change download url to https

- change hash of ustream-ssl.h, which is used as license file. There
  are no changes to the license text, only changes in the code.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ustream-ssl/ustream-ssl.hash | 4 ++--
 package/ustream-ssl/ustream-ssl.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index 60672b38b3..0c51a977cc 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f09474dbe4680b51cc0c6a088807102d64954764ef58c2a1e3231e3a77c4b01f  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb-br1.tar.gz
-sha256  90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
+sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-br1.tar.gz
+sha256  cf28f0f01a57423983fa062eb0f04bb1a78891863cb58c53059c3d8cb52c1dd4  ustream-ssl.h
diff --git a/package/ustream-ssl/ustream-ssl.mk b/package/ustream-ssl/ustream-ssl.mk
index 7804eb5d38..bee8d7de15 100644
--- a/package/ustream-ssl/ustream-ssl.mk
+++ b/package/ustream-ssl/ustream-ssl.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-USTREAM_SSL_VERSION = 23a3f2830341acd1db149175baf7315a33bd0edb
-USTREAM_SSL_SITE = git://git.openwrt.org/project/ustream-ssl.git
+USTREAM_SSL_VERSION = 68d09243b6fd4473004b27ff6483352e76e6af1a
+USTREAM_SSL_SITE = https://git.openwrt.org/project/ustream-ssl.git
+USTREAM_SSL_SITE_METHOD = git
 USTREAM_SSL_LICENSE = ISC
 USTREAM_SSL_LICENSE_FILES = ustream-ssl.h
 USTREAM_SSL_INSTALL_STAGING = YES
