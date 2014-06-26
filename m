From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jun 2014 16:21:11 -0300
Subject: [Buildroot] [PATCH 43/53] rpm: add license information
In-Reply-To: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
References: <1403810481-10025-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1403810481-10025-43-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rpm/rpm.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 97f64a2..f86ed00 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -8,6 +8,8 @@ RPM_VERSION_MAJOR = 5.2
 RPM_VERSION = $(RPM_VERSION_MAJOR).0
 RPM_SITE = http://rpm5.org/files/rpm/rpm-$(RPM_VERSION_MAJOR)/
 RPM_DEPENDENCIES = zlib beecrypt neon popt
+RPM_LICENSE = LGPLv2.1
+RPM_LICENSE_FILES = COPYING.LIB
 
 RPM_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -I$(STAGING_DIR)/usr/include/beecrypt -I$(STAGING_DIR)/usr/include/neon -DHAVE_MUTEX_THREAD_ONLY" \
 		ac_cv_va_copy=yes
-- 
1.8.5.5
