From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Sep 2014 13:37:49 +0200
Subject: [Buildroot] [git commit] procps-ng: add INSTALL_STAGING=YES
Message-ID: <20140905113825.004429D5EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5fd85ab0d16b2c0f54d596a211442a7209d95a2e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Procps-ng libraries needed in the staging directory by
the new package openvmtools.

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/procps-ng/procps-ng.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index 8f9caf3..c327b4f 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -9,6 +9,7 @@ PROCPS_NG_SOURCE = procps-ng-$(PROCPS_NG_VERSION).tar.xz
 PROCPS_NG_SITE = http://downloads.sourceforge.net/project/procps-ng/Production
 PROCPS_NG_LICENSE = GPLv2+, libproc and libps LGPLv2+
 PROCPS_NG_LICENSE_FILES = COPYING COPYING.LIB
+PROCPS_NG_INSTALL_STAGING = YES
 
 PROCPS_NG_DEPENDENCIES = ncurses
 
