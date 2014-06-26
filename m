From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 17:01:34 +0200
Subject: [Buildroot] [git commit] sredird: add license information
Message-ID: <20140626151144.463769D018@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e7ca809148f7068c3c926782b190b7d78949aa05
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sredird/sredird.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/sredird/sredird.mk b/package/sredird/sredird.mk
index afb2dff..0a0f398 100644
--- a/package/sredird/sredird.mk
+++ b/package/sredird/sredird.mk
@@ -7,6 +7,8 @@
 SREDIRD_VERSION = 2.2.1-1.1
 SREDIRD_SOURCE = sredird_$(SREDIRD_VERSION).tar.gz
 SREDIRD_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/s/sredird
+SREDIRD_LICENSE = GPLv2+
+SREDIRD_LICENSE_FILES = COPYING
 
 define SREDIRD_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
