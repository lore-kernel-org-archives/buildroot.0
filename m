From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 22:22:25 +0200
Subject: [Buildroot] [git commit] libxml2: add license info
Message-ID: <20121004205123.D921F997BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b601212e98358b0796549b7cdf4d1b619acb628e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libxml2/libxml2.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libxml2/libxml2.mk b/package/libxml2/libxml2.mk
index 44d15e7..b63200f 100644
--- a/package/libxml2/libxml2.mk
+++ b/package/libxml2/libxml2.mk
@@ -8,6 +8,8 @@ LIBXML2_VERSION = 2.8.0
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
 LIBXML2_AUTORECONF = YES
+LIBXML2_LICENSE = MIT
+LIBXML2_LICENSE_FILES = COPYING
 
 ifneq ($(BR2_LARGEFILE),y)
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
