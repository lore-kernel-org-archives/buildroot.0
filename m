From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 02 Aug 2012 19:52:57 -0000
Subject: [Buildroot] [git commit branch/next] linux: define license
Message-ID: <20120802195251.A5CED8D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=67f1836d27a144d3934706a34aa5b866d41096cd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 linux/linux.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f165dda..bd3e23e 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -4,6 +4,8 @@
 #
 ###############################################################################
 LINUX_VERSION=$(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
+LINUX_LICENSE = GPLv2
+LINUX_LICENSE_FILES = COPYING
 
 # Compute LINUX_SOURCE and LINUX_SITE from the configuration
 ifeq ($(LINUX_VERSION),custom)
