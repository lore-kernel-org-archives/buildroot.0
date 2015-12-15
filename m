From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2015 22:02:33 +0100
Subject: [Buildroot] [git commit] collectd: comma separate licenses
Message-ID: <20151215210844.0248D80409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d6184cdf3ac222879cab9ed90b26e5b39acf1eda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/collectd/collectd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/collectd/collectd.mk b/package/collectd/collectd.mk
index 6e1ea5c..d7fd8f9 100644
--- a/package/collectd/collectd.mk
+++ b/package/collectd/collectd.mk
@@ -9,7 +9,7 @@ COLLECTD_SITE = http://collectd.org/files
 COLLECTD_SOURCE = collectd-$(COLLECTD_VERSION).tar.bz2
 COLLECTD_CONF_ENV = ac_cv_lib_yajl_yajl_alloc=yes
 COLLECTD_INSTALL_STAGING = YES
-COLLECTD_LICENSE = GPLv2 LGPLv2.1
+COLLECTD_LICENSE = GPLv2, LGPLv2.1
 COLLECTD_LICENSE_FILES = COPYING
 # For 0001-build-add-libavltree-libcommon-libheap-dependencies.patch
 COLLECTD_AUTORECONF = YES
