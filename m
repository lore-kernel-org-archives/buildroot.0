From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Jan 2014 21:06:45 +0100
Subject: [Buildroot] [git commit] haveged: bump to version 1.8
Message-ID: <20140104200732.E1DE99C3AB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65d5c54b968877ed3c4f00099756a3dd1002cc2b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index 99dbe41..c0e3ba3 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.7c
+HAVEGED_VERSION = 1.8
 HAVEGED_SITE = http://www.issihosts.com/haveged
 HAVEGED_LICENSE = GPLv3+
 HAVEGED_LICENSE_FILES = COPYING
