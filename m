From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:11 -0300
Subject: [Buildroot] [PATCH 05/54] libart: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-5-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libart/libart.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libart/libart.mk b/package/libart/libart.mk
index 39c72cc..a103f23 100644
--- a/package/libart/libart.mk
+++ b/package/libart/libart.mk
@@ -11,5 +11,7 @@ LIBART_SITE = http://ftp.gnome.org/pub/gnome/sources/libart_lgpl/$(LIBART_VERSIO
 LIBART_AUTORECONF = YES
 LIBART_INSTALL_STAGING = YES
 LIBART_CONFIG_SCRIPTS = libart2-config
+LIBART_LICENSE = LGPLv2+
+LIBART_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
-- 
1.8.5.5
