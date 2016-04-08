From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Apr 2016 17:30:56 -0300
Subject: [Buildroot] [PATCH] graphite2: bump to version 1.3.8
Message-ID: <1460147456-22598-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

And upstream switches tarball name yet again, so adjust SOURCE.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/graphite2/graphite2.hash | 4 ++--
 package/graphite2/graphite2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index e4bc302..d22b67c 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5	12eb607e0f458febe348ae69b832b300	graphite-1.3.6.tgz
-sha1	052ed2e3653f7a026bf9ff63ca42683ce0bcefb4	graphite-1.3.6.tgz
+md5	236d2cb1f831fe33083112afbb555f0e	graphite2-1.3.8.tgz
+sha1	0c802628dacf3bfa2c1654d7d72b76e20e1adc97	graphite2-1.3.8.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index 413b6ea..d066a1c 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.6
-GRAPHITE2_SOURCE = graphite-$(GRAPHITE2_VERSION).tgz
+GRAPHITE2_VERSION = 1.3.8
+GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
 GRAPHITE2_LICENSE = LGPLv2.1+
-- 
2.7.3
