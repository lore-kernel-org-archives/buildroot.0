From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2013 12:28:45 +0100
Subject: [Buildroot] [git commit] mdadm: bump to version 3.3
Message-ID: <20131216113554.D50B99C0A8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ed1ab10e766c7f3191dc4d9b39a93ce5fd9a08da
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Christophe Vu-Brugier <cvubrugier@yahoo.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index e678591..4418986 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDADM_VERSION = 3.2.6
+MDADM_VERSION = 3.3
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPLv2+
