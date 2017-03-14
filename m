From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 14 Mar 2017 19:59:37 +0530
Subject: [Buildroot] [PATCH] zmqpp: update license
Message-ID: <1489501777-6548-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 4.1.2, zmqpp is provided under MPLv2.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/zmqpp/zmqpp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 18da709..3e35fd7 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -8,7 +8,7 @@ ZMQPP_VERSION = 4.1.2
 ZMQPP_SITE = $(call github,zeromq,zmqpp,$(ZMQPP_VERSION))
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
-ZMQPP_LICENSE = MIT
+ZMQPP_LICENSE = MPLv2.0
 ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
-- 
2.6.2
