From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:54 -0300
Subject: [Buildroot] [PATCH 26/53] libconfuse: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-26-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libconfuse/libconfuse.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libconfuse/libconfuse.mk b/package/libconfuse/libconfuse.mk
index 66cabd3..8a0d80f 100644
--- a/package/libconfuse/libconfuse.mk
+++ b/package/libconfuse/libconfuse.mk
@@ -9,6 +9,8 @@ LIBCONFUSE_SOURCE = confuse-$(LIBCONFUSE_VERSION).tar.gz
 LIBCONFUSE_SITE = http://savannah.nongnu.org/download/confuse/
 LIBCONFUSE_INSTALL_STAGING = YES
 LIBCONFUSE_CONF_OPT = --disable-rpath
+LIBCONFUSE_LICENSE = ISC
+LIBCONFUSE_LICENSE_FILES = src/confuse.c
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
1.8.5.5
