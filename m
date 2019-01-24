From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 24 Jan 2019 12:37:26 +0100
Subject: [Buildroot] [git commit branch/2018.02.x] package/xenomai: drop
 consecutive empty lines
Message-ID: <20190124113645.CF2CF812DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6430aa503c4a8b26f8ad5804aabff4b3a8f27dd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit 4219c58c (xenomai: remove unnecessary autoreconf) introduced a
check-package warning:

1 warnings generated
package/xenomai/xenomai.mk:27: consecutive empty lines

https://gitlab.com/buildroot.org/buildroot/-/jobs/143155797

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit d2e1617cccb9c3183fae5cba78633e1b39e8a6a4)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/xenomai/xenomai.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index d88e969adb..98f550af60 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -24,7 +24,6 @@ XENOMAI_LICENSE_FILES = debian/copyright include/COPYING kernel/cobalt/COPYING \
 
 XENOMAI_DEPENDENCIES = host-pkgconf
 
-
 XENOMAI_INSTALL_STAGING = YES
 XENOMAI_INSTALL_TARGET_OPTS = DESTDIR=$(TARGET_DIR) install-user
 XENOMAI_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) install-user
