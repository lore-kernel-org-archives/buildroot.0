From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jan 2017 21:08:37 +0100
Subject: [Buildroot] [git commit] graphite2: bump to version 1.3.9
Message-ID: <20170126200932.EAE0F820F0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9652cd1c115d05094250575a35a2f9c426ffef4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
