From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:42:12 +0200
Subject: [Buildroot] [git commit] libiconv: add license information
Message-ID: <20140701224921.F19489D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=36ed586e17f631112ad05f658c430651a2e22a19
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libiconv/libiconv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libiconv/libiconv.mk b/package/libiconv/libiconv.mk
index ee313ce..52e2349 100644
--- a/package/libiconv/libiconv.mk
+++ b/package/libiconv/libiconv.mk
@@ -7,6 +7,8 @@
 LIBICONV_VERSION = 1.14
 LIBICONV_SITE = $(BR2_GNU_MIRROR)/libiconv
 LIBICONV_INSTALL_STAGING = YES
+LIBICONV_LICENSE = GPLv3+ (iconv program), LGPLv2+ (library)
+LIBICONV_LICENSE_FILES = COPYING COPYING.LIB
 
 # Remove not used preloadable libiconv.so
 define LIBICONV_TARGET_REMOVE_PRELOADABLE_LIBS
