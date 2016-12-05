From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:29:01 +0100
Subject: [Buildroot] [git commit] chrony: bump version to 2.4.1
Message-ID: <20161205202924.8078081D55@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43cf5677102e5d25f85a00692bfe23e2b749c4cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes a crash issue with smoothtime directive.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/chrony/chrony.hash | 6 +++---
 package/chrony/chrony.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index da35f6b..66ec060 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,3 +1,3 @@
-# From http://thread.gmane.org/gmane.comp.time.chrony.announce/36
-md5  d0598aa8a9be8faccef9386f6fc0d5f2  chrony-2.4.tar.gz
-sha1 8c243c545f242f869c9965e675828878970da5db  chrony-2.4.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2016/11/msg00000.html
+md5  d08dd5a7d79a89891d119adcccb4397d  chrony-2.4.1.tar.gz
+sha1 b412375ca90dbef653ad00534f8b73b825e396d4  chrony-2.4.1.tar.gz
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index 5f3160e..0dca2ee 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 2.4
+CHRONY_VERSION = 2.4.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPLv2
 CHRONY_LICENSE_FILES = COPYING
