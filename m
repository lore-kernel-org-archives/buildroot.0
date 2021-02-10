From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 11 Feb 2021 00:16:38 +0100
Subject: [Buildroot] [PATCH/next v1 5/7] package/ustream-ssl: bump version
 to 68d0924
In-Reply-To: <20210210231640.5262-1-ps.report@gmx.net>
References: <20210210231640.5262-1-ps.report@gmx.net>
Message-ID: <20210210231640.5262-5-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change download url to https

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/ustream-ssl/ustream-ssl.hash | 2 +-
 package/ustream-ssl/ustream-ssl.mk   | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/ustream-ssl/ustream-ssl.hash b/package/ustream-ssl/ustream-ssl.hash
index 60672b38b3..ecf6124fe1 100644
--- a/package/ustream-ssl/ustream-ssl.hash
+++ b/package/ustream-ssl/ustream-ssl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  f09474dbe4680b51cc0c6a088807102d64954764ef58c2a1e3231e3a77c4b01f  ustream-ssl-23a3f2830341acd1db149175baf7315a33bd0edb-br1.tar.gz
+sha256  e77e579b718085c1447339e0fcd5385b85a783d5c92544e48a6b37b1695a7f39  ustream-ssl-68d09243b6fd4473004b27ff6483352e76e6af1a-br1.tar.gz
 sha256  90dd1590cf400a548438e2575e1ff46d8fb8cebae7d09f544aae7e059e30b6c5  ustream-ssl.h
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
-- 
2.30.0
