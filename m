From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:29:48 +0200
Subject: [Buildroot] [git commit] jsmin: add license information
Message-ID: <20140701224921.C991A9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=02b1d48537d7579ca6f82770bba19ce366e86614
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/jsmin/jsmin.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/jsmin/jsmin.mk b/package/jsmin/jsmin.mk
index 3ef3047..957b686 100644
--- a/package/jsmin/jsmin.mk
+++ b/package/jsmin/jsmin.mk
@@ -6,6 +6,8 @@
 
 JSMIN_VERSION = a9b47554d5684a55301a2eb7ca8480b7ee7630d4
 JSMIN_SITE = $(call github,douglascrockford,JSMin,$(JSMIN_VERSION))
+JSMIN_LICENSE = MIT
+JSMIN_LICENSE_FILES = jsmin.c
 
 define JSMIN_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) jsmin
