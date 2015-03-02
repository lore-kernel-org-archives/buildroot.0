From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:16 -0000
Subject: [Buildroot] [git commit] fluxbox: bump version to 1.3.7
Message-ID: <20150302222715.B1FF88057D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e741c161a49db2bc09c7ccd4fd1f1449a32fe294
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Bump version to 1.3.7
- Update the hash file
- Use xz instead of bz2 to save disk space and bandwidth

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fluxbox/fluxbox.hash |    2 +-
 package/fluxbox/fluxbox.mk   |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/fluxbox/fluxbox.hash b/package/fluxbox/fluxbox.hash
index bfbbd7f..b18582b 100644
--- a/package/fluxbox/fluxbox.hash
+++ b/package/fluxbox/fluxbox.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  05cc2149b79155121cb0fff6d4fd0289e3edb669390714e0b54071bec987e686  fluxbox-1.3.6.tar.bz2
+sha256  fc8c75fe94c54ed5a5dd3fd4a752109f8949d6df67a48e5b11a261403c382ec0  fluxbox-1.3.7.tar.xz
diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index 30255c4..c8e4289 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-FLUXBOX_VERSION = 1.3.6
-FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.bz2
+FLUXBOX_VERSION = 1.3.7
+FLUXBOX_SOURCE = fluxbox-$(FLUXBOX_VERSION).tar.xz
 FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBOX_VERSION)
 FLUXBOX_LICENSE = MIT
 FLUXBOX_LICENSE_FILES = COPYING
