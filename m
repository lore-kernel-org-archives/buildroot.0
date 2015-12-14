From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 14 Dec 2015 10:10:56 -0300
Subject: [Buildroot] [PATCH 17/45] collectd: comma separate licenses
In-Reply-To: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
References: <1450098684-17399-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1450098684-17399-18-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6e1ea5c..d7fd8f9 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -9,7 +9,7 @@ COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-COLLECTD_LICENSE = GPLv2 LGPLv2.1
+COLLECTD_LICENSE = GPLv2, LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 # For 0001-build-add-libavltree-libcommon-libheap-dependencies.patch
 COLLECTD_AUTORECONF = YES
-- 
2.4.10
