From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 4 Oct 2012 00:02:10 +0200
Subject: [Buildroot] [git commit] iproute2: bump to version 3.6.0
Message-ID: <20121003220400.18B52971BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2bd4ee3e39c4d84280622e8082468efbf687da07
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/iproute2/iproute2.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 90588a3..62328ab 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.5.1
+IPROUTE2_VERSION = 3.6.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
 IPROUTE2_LICENSE = GPLv2
