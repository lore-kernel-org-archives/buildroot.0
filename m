From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:50 -0300
Subject: [Buildroot] [PATCH 10/10] lame: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-10-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/multimedia/lame/lame.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/multimedia/lame/lame.mk b/package/multimedia/lame/lame.mk
index a251f02..4f6b8fd 100644
--- a/package/multimedia/lame/lame.mk
+++ b/package/multimedia/lame/lame.mk
@@ -12,6 +12,8 @@ LAME_DEPENDENCIES = host-pkgconf
 LAME_INSTALL_STAGING = YES
 LAME_CONF_ENV = GTK_CONFIG=/bin/false
 LAME_CONF_OPT = --enable-dynamic-frontends
+LAME_LICENSE = LGPLv2
+LAME_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_PACKAGE_LIBSNDFILE),y)
 LAME_DEPENDENCIES += libsndfile
-- 
1.7.12.4
