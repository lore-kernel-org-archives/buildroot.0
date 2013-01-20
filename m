From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Jan 2013 20:22:37 +0100
Subject: [Buildroot] [PATCH 8/8] speex: add license informations
In-Reply-To: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358709757-1929-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358709757-1929-8-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/speex/speex.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/speex/speex.mk b/package/speex/speex.mk
index 917de34..2fe179c 100644
--- a/package/speex/speex.mk
+++ b/package/speex/speex.mk
@@ -5,6 +5,9 @@
 #############################################################
 SPEEX_VERSION = 1.2rc1
 SPEEX_SITE = http://downloads.us.xiph.org/releases/speex
+SPEEX_LICENSE = BSD-3c
+SPEEX_LICENSE_FILES = COPYING
+
 SPEEX_INSTALL_STAGING = YES
 SPEEX_DEPENDENCIES = libogg
 SPEEX_CONF_OPT = --with-ogg-libraries=$(STAGING_DIR)/usr/lib \
-- 
1.7.9.5
