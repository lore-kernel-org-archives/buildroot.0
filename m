From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 24 Jun 2014 15:55:23 -0300
Subject: [Buildroot] [PATCH 17/54] libsvgtiny: add license information
In-Reply-To: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403636160-11807-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403636160-11807-17-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libsvgtiny/libsvgtiny.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libsvgtiny/libsvgtiny.mk b/package/libsvgtiny/libsvgtiny.mk
index dd40452..a2d494e 100644
--- a/package/libsvgtiny/libsvgtiny.mk
+++ b/package/libsvgtiny/libsvgtiny.mk
@@ -8,6 +8,8 @@ LIBSVGTINY_SITE = svn://svn.netsurf-browser.org/trunk/libsvgtiny
 LIBSVGTINY_VERSION = 12121
 LIBSVGTINY_INSTALL_STAGING = YES
 LIBSVGTINY_DEPENDENCIES = libxml2 host-gperf host-pkgconf
+LIBSVGTINY_LICENSE = MIT
+LIBSVGTINY_LICENSE_FILES = README
 
 define LIBSVGTINY_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) PREFIX=/usr
-- 
1.8.5.5
