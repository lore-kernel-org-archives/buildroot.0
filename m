From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 03 Sep 2012 20:06:05 -0000
Subject: [Buildroot] [git commit] iproute2: bump to version 3.5.0
Message-ID: <20120903200540.748479953E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a3d7601fb96997ffe507f0f81ec0581a2f010ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/iproute2/iproute2.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 27bc56f..c671e44 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,9 +4,11 @@
 #
 #############################################################
 
-IPROUTE2_VERSION = 3.4.0
+IPROUTE2_VERSION = 3.5.0
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_TARGET_SBINS = ctstat genl ifstat ip lnstat nstat routef routel rtacct rtmon rtpr rtstat ss tc
+IPROUTE2_LICENSE = GPLv2
+IPROUTE2_LICENSE_FILES = COPYING
 
 # If both iproute2 and busybox are selected, make certain we win
 # the fight over who gets to have their utils actually installed.
