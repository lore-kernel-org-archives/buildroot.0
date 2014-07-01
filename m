From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Jul 2014 23:18:45 +0200
Subject: [Buildroot] [git commit] fconfig: add license information
Message-ID: <20140701224921.7BA5F9D12D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=662e2e748da62cc98e0eae9bd3f47e0b344a2f4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fconfig/fconfig.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/fconfig/fconfig.mk b/package/fconfig/fconfig.mk
index 2288e79..ee741d7 100644
--- a/package/fconfig/fconfig.mk
+++ b/package/fconfig/fconfig.mk
@@ -6,6 +6,8 @@
 
 FCONFIG_VERSION = 20080329
 FCONFIG_SITE = http://andrzejekiert.ovh.org/software/fconfig/
+FCONFIG_LICENSE = GPLv2+
+FCONFIG_LICENSE_FILES = fconfig.c
 
 define FCONFIG_BUILD_CMDS
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
