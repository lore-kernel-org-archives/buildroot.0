From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 9 Feb 2015 10:53:50 +0000
Subject: [Buildroot] [PATCH] fluxbox: bump version to 1.3.7
Message-ID: <1423479230-14283-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Bump version to 1.3.7
- Update the hash file
- Use xz instead of bz2 to save disk space and bandwidth

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
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
-- 
1.7.1
