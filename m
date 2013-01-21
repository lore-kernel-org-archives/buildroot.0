From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 21 Jan 2013 18:29:48 -0300
Subject: [Buildroot] [PATCH 08/10] libao: add license information
In-Reply-To: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
References: <1358803790-30245-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1358803790-30245-8-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libao/libao.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libao/libao.mk b/package/libao/libao.mk
index aee85a9..9e7ef05 100644
--- a/package/libao/libao.mk
+++ b/package/libao/libao.mk
@@ -8,6 +8,8 @@ LIBAO_VERSION = 1.1.0
 LIBAO_SITE = http://downloads.xiph.org/releases/ao
 LIBAO_DEPENDENCIES = host-pkgconf
 LIBAO_INSTALL_STAGING = YES
+LIBAO_LICENSE = GPLv2
+LIBAO_LICENSE_FILES = COPYING
 LIBAO_CONF_OPT = --disable-esd --disable-wmm --disable-arts \
 			--disable-nas --disable-pulse
 
-- 
1.7.12.4
