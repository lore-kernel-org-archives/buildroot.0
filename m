From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:20:52 -0300
Subject: [Buildroot] [PATCH 24/53] libaio: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-24-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libaio/libaio.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libaio/libaio.mk b/package/libaio/libaio.mk
index b66c9f5..664640b 100644
--- a/package/libaio/libaio.mk
+++ b/package/libaio/libaio.mk
@@ -8,6 +8,8 @@ LIBAIO_VERSION = 0.3.109
 LIBAIO_SOURCE = libaio_$(LIBAIO_VERSION).orig.tar.gz
 LIBAIO_SITE = http://snapshot.debian.org/archive/debian/20110227T085214Z/pool/main/liba/libaio/
 LIBAIO_INSTALL_STAGING = YES
+LIBAIO_LICENSE = LGPLv2.1+
+LIBAIO_LICENSE_FILES = COPYING
 
 define LIBAIO_BUILD_CMDS
   $(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
-- 
1.8.5.5
