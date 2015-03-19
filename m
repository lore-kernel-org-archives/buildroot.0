From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 19 Mar 2015 09:27:36 +0000
Subject: [Buildroot] [PATCH 1/2] trinity: bump version to v1.5
Message-ID: <1426757257-2057-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/trinity/trinity.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 5f8a707..ecd82f8 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRINITY_VERSION = c8c41f99500b5854c2061a08962b8908c872d852
+TRINITY_VERSION = v1.5
 TRINITY_SITE = $(call github,kernelslacker,trinity,$(TRINITY_VERSION))
 TRINITY_LICENSE = GPLv2
 TRINITY_LICENSE_FILES = COPYING
-- 
1.7.1
