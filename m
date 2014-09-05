From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 5 Sep 2014 20:54:37 +0200
Subject: [Buildroot] [git commit] mdadm: bump to version 3.3.2
Message-ID: <20140905185547.5A5029D5EF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5b7acc23d91c55fcf943ce0c6d3b9278621fdc44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mdadm/mdadm.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index b258881..01fc77a 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDADM_VERSION = 3.3.1
+MDADM_VERSION = 3.3.2
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPLv2+
