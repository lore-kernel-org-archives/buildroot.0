From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:31:17 +0200
Subject: [Buildroot] [git commit] libaio: add license information
Message-ID: <20140701224921.CF0C29D132@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9015adcfd3b157017a4ee77c8713c224b1f6e6c5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libaio/libaio.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

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
