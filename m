From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 6 Aug 2014 19:44:20 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 3.16.0
Message-ID: <20140806174511.1688C9D3C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=250e8a9adad6263276a0e6b9e5768c080fa28660
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Tested-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index ad7fcf4..17c3c36 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.15.0
+IPROUTE2_VERSION = 3.16.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex
