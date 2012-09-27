From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Sep 2012 18:14:29 -0300
Subject: [Buildroot] [PATCH 2/2] libxml2: add license info
In-Reply-To: <1348780469-23859-1-git-send-email-gustavo@zacarias.com.ar>
References: <1348780469-23859-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1348780469-23859-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libxml2/libxml2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index ad11236..71f2bd1 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -8,6 +8,8 @@ LIBXML2_VERSION = 2.8.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
+LIBXML2_LICENSE = MIT
+LIBXML2_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
-- 
1.7.8.6
