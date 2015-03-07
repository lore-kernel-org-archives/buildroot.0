From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 11:09:41 +0100
Subject: [Buildroot] [git commit] socketcand: bump version
Message-ID: <20150307100947.D90628046E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7ab3ebfbe252cc48de8812aaf543c7d6e46ad20c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/socketcand/socketcand.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index 90d7540..10b8b5b 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SOCKETCAND_VERSION = 274e4e44107f6138a29bbc4e20f9fbd2a7d4dab1
+SOCKETCAND_VERSION = 8339e62a6bf60be571672678fb1de544768cf40e
 SOCKETCAND_SITE = $(call github,dschanoeh,socketcand,$(SOCKETCAND_VERSION))
 SOCKETCAND_AUTORECONF = YES
 SOCKETCAND_LICENSE = BSD-3c or GPLv2
