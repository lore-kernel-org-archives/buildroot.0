From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 8 Aug 2015 12:40:32 +0200
Subject: [Buildroot] [git commit] package/filemq: bump version
Message-ID: <20150808104048.B201E81869@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b84959fbbe824e1a7e9918ffe49943046982c27
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
    http://autobuild.buildroot.org/results/e09/e0907c5453dfb1df546c07869faf00ec51b49181/
    http://autobuild.buildroot.org/results/5c5/5c591c2fe4e3e1d5c23b54a8486de741fe0e329d/
    http://autobuild.buildroot.org/results/89f/89ffd2a03f295c810399680621440b08f7c7762f/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/filemq/filemq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index d3dc6da..a79e8f4 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 482797b8aa30fcc9ea1377aabdf2b0769f9f698e
+FILEMQ_VERSION = acf6c0e003fee938994ad803aa7b78245dca57ba
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
