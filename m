From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Thu,  2 Aug 2012 22:53:52 -0400
Subject: [Buildroot] [PATCH 6/6] xinetd: Add license info
In-Reply-To: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
References: <1343962432-2772-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <1343962432-2772-6-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
---
 package/xinetd/xinetd.mk |    8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index a209d12..c2f891b 100644
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
+XINETD_LICENSE       = Custom
+XINETD_LICENSE_FILES = COPYRIGHT
 
 ifneq ($(BR2_INET_RPC),y)
 XINETD_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DNO_RPC"
-- 
1.7.9.5
