From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Aug 2012 13:16:08 +0200
Subject: [Buildroot] [git commit] xinetd: Add license info
Message-ID: <20120804112012.ABC3E9701D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c529aa7e4d7bd0b9a8e76c902de3e81480255ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xinetd/xinetd.mk |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a209d12..4fc2de9 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -3,9 +3,11 @@
 # xinetd
 #
 #############################################################
-XINETD_VERSION = 2.3.15
-XINETD_SOURCE  = xinetd-$(XINETD_VERSION).tar.gz
-XINETD_SITE    = http://www.xinetd.org
+XINETD_VERSION       = 2.3.15
+XINETD_SOURCE        = xinetd-$(XINETD_VERSION).tar.gz
+XINETD_SITE          = http://www.xinetd.org
+XINETD_LICENSE       = xinetd license
+XINETD_LICENSE_FILES = COPYRIGHT
 
 ifneq ($(BR2_INET_RPC),y)
 XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
