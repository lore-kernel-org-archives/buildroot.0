From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Nov 2014 00:08:27 +0100
Subject: [Buildroot] [git commit] targetcli-fb: bump version
Message-ID: <20141102231025.E441CB2F61@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=08fa6ff5bd45977dee03fb70cbbcbb61fadc08a1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/targetcli-fb/targetcli-fb.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/targetcli-fb/targetcli-fb.mk b/package/targetcli-fb/targetcli-fb.mk
index 1faad07..b5f2fbe 100644
--- a/package/targetcli-fb/targetcli-fb.mk
+++ b/package/targetcli-fb/targetcli-fb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TARGETCLI_FB_VERSION = v2.1.fb36
+TARGETCLI_FB_VERSION = v2.1.fb37
 TARGETCLI_FB_SITE = $(call github,agrover,targetcli-fb,$(TARGETCLI_FB_VERSION))
 TARGETCLI_FB_LICENSE = Apache-2.0
 TARGETCLI_FB_LICENSE_FILES = COPYING
