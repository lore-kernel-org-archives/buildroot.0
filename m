From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 8 May 2014 21:18:47 +0200
Subject: [Buildroot] [git commit] fping: bump to version 3.10
Message-ID: <20140508194702.79B0C9CB17@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=725455dbbc1b6ed96c7ab9f979305500aecca591
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fping/fping.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/fping/fping.mk b/package/fping/fping.mk
index a87f85d..0045bef 100644
--- a/package/fping/fping.mk
+++ b/package/fping/fping.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FPING_VERSION = 3.9
+FPING_VERSION = 3.10
 FPING_SITE = http://fping.org/dist
 FPING_LICENSE = BSD-like
 FPING_LICENSE_FILES = COPYING
