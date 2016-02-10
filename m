From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 10 Feb 2016 11:47:47 -0300
Subject: [Buildroot] [PATCH 3/3] cppzmq: bump to version 68a7b09c
In-Reply-To: <1455115667-22269-1-git-send-email-gustavo@zacarias.com.ar>
References: <1455115667-22269-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1455115667-22269-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/cppzmq/cppzmq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 5446de8..113b9a0 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 1f05e0d111197c64be32ad5aecd59f4d1b05a819
+CPPZMQ_VERSION = 68a7b09cfce01c4c279fba2cf91686fcfc566848
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
-- 
2.4.10
