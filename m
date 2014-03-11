From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 Mar 2014 23:01:22 +0100
Subject: [Buildroot] [git commit] fping: bump to version 3.9
Message-ID: <20140311220647.613CA9BEED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=fb3ef246c695b625e1b78f03b28778b237e7a72d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fping/fping.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index 580920e..a87f85d 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.8
+FPING_VERSION = 3.9
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
