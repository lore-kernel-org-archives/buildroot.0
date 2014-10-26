From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:09 +0100
Subject: [Buildroot] [PATCH 03/51] cppzmq: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-3-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/cppzmq/cppzmq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 95fb030..5446de8 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = 235803740753312576495301ebf5b8ed76407173
+CPPZMQ_VERSION = 1f05e0d111197c64be32ad5aecd59f4d1b05a819
 CPPZMQ_SITE = $(call github,zeromq,cppzmq,$(CPPZMQ_VERSION))
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
-- 
2.1.1
