From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2013 11:54:24 +0200
Subject: [Buildroot] [git commit] docker: add license info
Message-ID: <20131026101628.C72539BBC3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b73c7219bf35272bdcb83010a5196b57ffaa4731
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker/docker.mk |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/package/docker/docker.mk b/package/docker/docker.mk
index 255860b..9a9d26b 100644
--- a/package/docker/docker.mk
+++ b/package/docker/docker.mk
@@ -8,6 +8,10 @@ DOCKER_VERSION = 1.5
 DOCKER_SITE = http://icculus.org/openbox/2/docker
 DOCKER_DEPENDENCIES = host-pkgconf libglib2 xlib_libX11
 
+DOCKER_LICENSE = GPLv2+
+# The 'or later' is specified at the end of the README, so include that one too.
+DOCKER_LICENSE_FILES = COPYING README
+
 define DOCKER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
 		XLIBPATH=$(STAGING_DIR)/usr/lib
