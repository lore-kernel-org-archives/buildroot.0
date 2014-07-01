From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:33:30 +0200
Subject: [Buildroot] [git commit] rpm: add license information
Message-ID: <20140701224922.546209D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ccc3fad985e985c151f398210e281bfe5a360e94
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rpm/rpm.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
