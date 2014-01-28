From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Jan 2014 20:18:08 +0100
Subject: [Buildroot] [git commit] iw: bump to version 3.14
Message-ID: <20140128192132.537CF9C696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=890d2a37287881c8e53e0e63a45d575bf4eb60c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iw/iw.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/iw/iw.mk b/package/iw/iw.mk
index 13d92b7..cfab481 100644
--- a/package/iw/iw.mk
+++ b/package/iw/iw.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IW_VERSION = 3.13
+IW_VERSION = 3.14
 IW_SOURCE = iw-$(IW_VERSION).tar.xz
 IW_SITE = $(BR2_KERNEL_MIRROR)/software/network/iw
 IW_LICENSE = iw license
