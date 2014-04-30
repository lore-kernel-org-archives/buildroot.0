From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 08:36:30 +0200
Subject: [Buildroot] [git commit] ljsyscall: bump to version 0.10
Message-ID: <20140430063703.05C669C94D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d03c3dc16ab6203eb20e5c1d877e3bbe0099fd74
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ljsyscall/ljsyscall.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/ljsyscall/ljsyscall.mk b/package/ljsyscall/ljsyscall.mk
index cc49890..a17da3f 100644
--- a/package/ljsyscall/ljsyscall.mk
+++ b/package/ljsyscall/ljsyscall.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LJSYSCALL_VERSION = v0.9
+LJSYSCALL_VERSION = v0.10
 LJSYSCALL_SITE = $(call github,justincormack,ljsyscall,$(LJSYSCALL_VERSION))
 LJSYSCALL_LICENSE = MIT
 LJSYSCALL_LICENSE_FILES = COPYRIGHT
