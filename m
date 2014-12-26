From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Dec 2014 15:15:15 +0100
Subject: [Buildroot] [git commit] libxkbcommon: bump to version 0.5.0
Message-ID: <20141226141557.1814980074@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=afab8dc6038b54a3b0dea08858978f3a68885300
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libxkbcommon/libxkbcommon.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/libxkbcommon/libxkbcommon.mk b/package/libxkbcommon/libxkbcommon.mk
index 3bfe764..2d30506 100644
--- a/package/libxkbcommon/libxkbcommon.mk
+++ b/package/libxkbcommon/libxkbcommon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBXKBCOMMON_VERSION = 0.3.0
+LIBXKBCOMMON_VERSION = 0.5.0
 LIBXKBCOMMON_SITE = http://xkbcommon.org/download
 LIBXKBCOMMON_SOURCE = libxkbcommon-$(LIBXKBCOMMON_VERSION).tar.xz
 LIBXKBCOMMON_LICENSE = MIT/X11
