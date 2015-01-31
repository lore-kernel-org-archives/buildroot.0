From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 31 Jan 2015 23:19:24 +0100
Subject: [Buildroot] [git commit] package/mcelog: bump version to v109
Message-ID: <20150131222039.D5F848046F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=07ca4768694c857ab6a98e668083a145c75a3f26
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mcelog/mcelog.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index da338ba..5857403 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = v105
+MCELOG_VERSION = v109
 MCELOG_SITE = $(BR2_KERNEL_MIRROR)/scm/utils/cpu/mce/mcelog.git
 MCELOG_SITE_METHOD = git
 MCELOG_LICENSE = GPLv2
