From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 02 Mar 2016 20:27:52 -0000
Subject: [Buildroot] [git commit] cppzmq: bump to version 68a7b09c
Message-ID: <20160302202751.82FC280203@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a325525376f148a8b81e20e87b0d59bc242defe2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
