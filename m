From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:17 -0300
Subject: [Buildroot] [PATCH 49/53] tinyhttpd: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-49-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/tinyhttpd/tinyhttpd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinyhttpd/tinyhttpd.mk b/package/tinyhttpd/tinyhttpd.mk
index 1a809f6..ec47fd9 100644
--- a/package/tinyhttpd/tinyhttpd.mk
+++ b/package/tinyhttpd/tinyhttpd.mk
@@ -6,6 +6,8 @@
 
 TINYHTTPD_VERSION = 0.1.0
 TINYHTTPD_SITE = http://downloads.sourceforge.net/project/tinyhttpd/tinyhttpd%20source/tinyhttpd%20$(TINYHTTPD_VERSION)
+TINYHTTPD_LICENSE = GPL
+TINYHTTPD_LICENSE_FILES = README
 
 define TINYHTTPD_BUILD_CMDS
 	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
-- 
1.8.5.5
