From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Oct 2011 00:07:28 -0300
Subject: [Buildroot] [PATCH 14/25] libmpd: bump to version 11.8.17
In-Reply-To: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
References: <1318648059-30431-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1318648059-30431-14-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/libmpd/libmpd.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/multimedia/libmpd/libmpd.mk b/package/multimedia/libmpd/libmpd.mk
index a58b537..9fd12f5 100644
--- a/package/multimedia/libmpd/libmpd.mk
+++ b/package/multimedia/libmpd/libmpd.mk
@@ -3,9 +3,9 @@
 # libmpd
 #
 #############################################################
-LIBMPD_VERSION = 0.17.0
-LIBMPD_SOURCE = libmpd-$(LIBMPD_VERSION).tar.gz
-LIBMPD_SITE = http://download.sarine.nl/download/Programs/gmpc/$(LIBMPD_VERSION)/
+
+LIBMPD_VERSION = 11.8.17
+LIBMPD_SITE = http://download.sarine.nl/Programs/gmpc/11.8.16
 LIBMPD_INSTALL_STAGING = YES
 LIBMPD_DEPENDENCIES = libglib2
 
-- 
1.7.3.4
