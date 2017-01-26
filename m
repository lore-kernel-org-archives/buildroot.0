From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 26 Jan 2017 07:36:01 -0300
Subject: [Buildroot] [PATCH] graphite2: bump to version 1.3.9
Message-ID: <20170126103601.11656-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/graphite2/graphite2.hash | 4 ++--
 package/graphite2/graphite2.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/graphite2/graphite2.hash b/package/graphite2/graphite2.hash
index d22b67c..86be69e 100644
--- a/package/graphite2/graphite2.hash
+++ b/package/graphite2/graphite2.hash
@@ -1,3 +1,3 @@
 # From http://sourceforge.net/projects/silgraphite/files/graphite2
-md5	236d2cb1f831fe33083112afbb555f0e	graphite2-1.3.8.tgz
-sha1	0c802628dacf3bfa2c1654d7d72b76e20e1adc97	graphite2-1.3.8.tgz
+md5	17e6a3b1a88c100c9e3fc0763c85d269	graphite2-1.3.9.tgz
+sha1	0693e9eef87edf1792db247dd38794211666a1b9	graphite2-1.3.9.tgz
diff --git a/package/graphite2/graphite2.mk b/package/graphite2/graphite2.mk
index d066a1c..5f6848f 100644
--- a/package/graphite2/graphite2.mk
+++ b/package/graphite2/graphite2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GRAPHITE2_VERSION = 1.3.8
+GRAPHITE2_VERSION = 1.3.9
 GRAPHITE2_SOURCE = graphite2-$(GRAPHITE2_VERSION).tgz
 GRAPHITE2_SITE = http://downloads.sourceforge.net/project/silgraphite/graphite2
 GRAPHITE2_INSTALL_STAGING = YES
-- 
2.10.2
