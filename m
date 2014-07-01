From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 2 Jul 2014 00:39:39 +0200
Subject: [Buildroot] [git commit] tinyhttpd: add license information
Message-ID: <20140701224922.7C0A19D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4eb83a5efb04efcd0aa8b5c7ffaf1b74ad176631
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tinyhttpd/tinyhttpd.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
