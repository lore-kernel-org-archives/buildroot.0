From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:46:57 +0100
Subject: [Buildroot] [git commit] cppczmq: bump git snapshot
Message-ID: <20140103194751.5EE619C380@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=70c26fcd3760b2bb8df5be4092e71c318ab77fd0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump the Git snapshot for the cppzmq package. The newer snapshot now
has a separate license file; update license information accordingly.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cppzmq/cppzmq.mk |    5 ++---
 1 files changed, 2 insertions(+), 3 deletions(-)

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
