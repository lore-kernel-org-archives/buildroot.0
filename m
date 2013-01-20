From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 21:26:22 +0100
Subject: [Buildroot] [git commit] liburcu: bump to version 0.7.6
Message-ID: <20130120203918.E81769A4E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0a714acf56e470257daa0c9fab9cc61a65eba8bf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liburcu/liburcu.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/liburcu/liburcu.mk b/package/liburcu/liburcu.mk
index 0bfba37..b4a4424 100644
--- a/package/liburcu/liburcu.mk
+++ b/package/liburcu/liburcu.mk
@@ -3,7 +3,7 @@
 # liburc: userspace RCU (read-copy-update) library
 #
 #############################################################
-LIBURCU_VERSION = 0.7.5
+LIBURCU_VERSION = 0.7.6
 LIBURCU_SITE    = http://lttng.org/files/urcu/
 LIBURCU_SOURCE  = userspace-rcu-$(LIBURCU_VERSION).tar.bz2
 
