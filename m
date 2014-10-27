From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:09:30 +0100
Subject: [Buildroot] [git commit] cppzmq: bump version
Message-ID: <20141027002037.0A2A9B0FF2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=276f9d9c175bb5be5a6acb48f65d09c88d254e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cppzmq/cppzmq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
