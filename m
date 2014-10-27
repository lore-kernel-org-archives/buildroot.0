From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Oct 2014 01:12:38 +0100
Subject: [Buildroot] [git commit] filemq: bump version
Message-ID: <20141027002037.21EA1B0DB7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb03ea6a769255530fa84c3eab68d84890c25105
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/filemq/filemq.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/filemq/filemq.mk b/package/filemq/filemq.mk
index 69469c6..d3dc6da 100644
--- a/package/filemq/filemq.mk
+++ b/package/filemq/filemq.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILEMQ_VERSION = 9a24134d4c0a84abc5eebf1dfb2eb184adee72df
+FILEMQ_VERSION = 482797b8aa30fcc9ea1377aabdf2b0769f9f698e
 FILEMQ_SITE = $(call github,zeromq,filemq,$(FILEMQ_VERSION))
 
 FILEMQ_AUTORECONF = YES
