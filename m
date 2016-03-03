From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  2 Mar 2016 22:32:40 -0300
Subject: [Buildroot] [PATCH] graphite2: bump to version 1.3.6
Message-ID: <1456968760-1775-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also change SOURCE since the tarball got renamed with the bump.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/graphite2/graphite2.hash | 4 ++--
 package/graphite2/graphite2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index 07102cf..e4bc302 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5	5b8d22a8bbf031838e31432868c0109c	graphite2-1.3.5.tgz
-sha1	044f65d5b4ade3169f5fcd75a25f047c81f5d33e	graphite2-1.3.5.tgz
+md5	12eb607e0f458febe348ae69b832b300	graphite-1.3.6.tgz
+sha1	052ed2e3653f7a026bf9ff63ca42683ce0bcefb4	graphite-1.3.6.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 82c4a3b..413b6ea 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.5
-GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
+GRAPHITE2_VERSION = 1.3.6
+GRAPHITE2_SOURCE = graphite-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPLv2.1+
-- 
2.4.10
