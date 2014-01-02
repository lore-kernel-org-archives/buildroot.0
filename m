From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu,  2 Jan 2014 21:48:39 +0000
Subject: [Buildroot] [PATCH] cppczmq: bump git snapshot
Message-ID: <1388699319-23595-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Bump the Git snapshot for the cppzmq package. The newer snapshot now
has a separate license file; update license information accordingly.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/cppzmq/cppzmq.mk | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/cppzmq/cppzmq.mk b/package/cppzmq/cppzmq.mk
index 1cb0e56..5cbe424 100644
--- a/package/cppzmq/cppzmq.mk
+++ b/package/cppzmq/cppzmq.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-CPPZMQ_VERSION = b23297800389149ac37f19b7215fa4734d344998
+CPPZMQ_VERSION = 235803740753312576495301ebf5b8ed76407173
 CPPZMQ_SITE = git://github.com/zeromq/cppzmq.git
 CPPZMQ_INSTALL_STAGING = YES
 CPPZMQ_DEPENDENCIES = zeromq
 CPPZMQ_LICENSE = MIT
-# No license file, the license is in the installed header
-CPPZMQ_LICENSE_FILES = zmq.hpp
+CPPZMQ_LICENSE_FILES = LICENSE
 
 define CPPZMQ_INSTALL_STAGING_CMDS
 	$(INSTALL) -m 0644 -D $(@D)/zmq.hpp $(STAGING_DIR)/usr/include/zmq.hpp
-- 
1.8.3.2
