From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 11 Jun 2015 09:59:21 +0200
Subject: [Buildroot] [git commit] package/lxc: bump version to 1.1.2
Message-ID: <20150611080522.182F481E2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b8b6d670b2924a069d0e189f781b1dcafbf9ce3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Hoang Tran <hoang.tran@vnoss.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lxc/lxc.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lxc/lxc.mk b/package/lxc/lxc.mk
index 11a89f2..c7ebda4 100644
--- a/package/lxc/lxc.mk
+++ b/package/lxc/lxc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LXC_VERSION = 1.0.6
+LXC_VERSION = 1.1.2
 LXC_SITE = https://linuxcontainers.org/downloads
 LXC_LICENSE = LGPLv2.1+
 LXC_LICENSE_FILES = COPYING
