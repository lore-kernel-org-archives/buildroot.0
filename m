From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 28 Feb 2014 15:30:07 +0100
Subject: [Buildroot] [git commit] haveged: bump to version 1.9.1
Message-ID: <20140228143133.B8E589B2D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d3f6aadd811a24de1d36d30b3779337ebd50fa59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haveged/haveged.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/haveged/haveged.mk b/package/haveged/haveged.mk
index c0e3ba3..88d85cd 100644
--- a/package/haveged/haveged.mk
+++ b/package/haveged/haveged.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HAVEGED_VERSION = 1.8
+HAVEGED_VERSION = 1.9.1
 HAVEGED_SITE = http://www.issihosts.com/haveged
 HAVEGED_LICENSE = GPLv3+
 HAVEGED_LICENSE_FILES = COPYING
