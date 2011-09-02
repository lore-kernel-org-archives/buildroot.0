From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  2 Sep 2011 11:04:51 -0300
Subject: [Buildroot] [PATCH 03/13] libcuefile: bump to r475
In-Reply-To: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
References: <1314972301-5067-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1314972301-5067-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libcuefile/libcuefile.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/multimedia/libcuefile/libcuefile.mk b/package/multimedia/libcuefile/libcuefile.mk
index 86ec070..765c5a2 100644
--- a/package/multimedia/libcuefile/libcuefile.mk
+++ b/package/multimedia/libcuefile/libcuefile.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCUEFILE_VERSION = r453
+LIBCUEFILE_VERSION = r475
 LIBCUEFILE_SITE = http://files.musepack.net/source
 LIBCUEFILE_SOURCE = libcuefile_$(LIBCUEFILE_VERSION).tar.gz
 LIBCUEFILE_INSTALL_STAGING = YES
-- 
1.7.3.4
