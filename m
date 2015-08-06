From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  6 Aug 2015 22:51:32 +0200
Subject: [Buildroot] [PATCH 2/2] [autobuild] package/filemq: bump version
In-Reply-To: <cover.1438894103.git.yann.morin.1998@free.fr>
References: <cover.1438894103.git.yann.morin.1998@free.fr>
Message-ID: <84efc4acace2de810ed91d04e236b77afaa71fa4.1438894103.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes;
    http://autobuild.buildroot.org/results/e09/e0907c5453dfb1df546c07869faf00ec51b49181/
    http://autobuild.buildroot.org/results/5c5/5c591c2fe4e3e1d5c23b54a8486de741fe0e329d/
    http://autobuild.buildroot.org/results/89f/89ffd2a03f295c810399680621440b08f7c7762f/
    [...]

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/filemq/filemq.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.9.1
