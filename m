From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Dec 2013 22:25:34 +0100
Subject: [Buildroot] [git commit] libcgi: add licensing info
Message-ID: <20131211213615.5E4C19BFD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b7e022ff2f7cdf61c4521dcab22160584b7a7e1e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcgi/libcgi.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcgi/libcgi.mk b/package/libcgi/libcgi.mk
index f027d31..40a9f32 100644
--- a/package/libcgi/libcgi.mk
+++ b/package/libcgi/libcgi.mk
@@ -9,5 +9,6 @@ LIBCGI_SITE = http://downloads.sourceforge.net/project/libcgi/libcgi/$(LIBCGI_VE
 LIBCGI_INSTALL_STAGING = YES
 # use cross CC/AR rather than host
 LIBCGI_MAKE_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS)" AR="$(TARGET_AR)"
+LIBCGI_LICENSE = LGPLv2.1+
 
 $(eval $(autotools-package))
