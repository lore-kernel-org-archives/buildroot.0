From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Apr 2015 15:31:01 +0200
Subject: [Buildroot] [git commit] lpeg: bump to version 0.12.2
Message-ID: <20150418133114.BC50B8040E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=13db7aebd76bbb0bdcdcce557a7390c91fcc7f2f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lpeg/lpeg.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lpeg/lpeg.mk b/package/lpeg/lpeg.mk
index 52fb7b7..76e75f7 100644
--- a/package/lpeg/lpeg.mk
+++ b/package/lpeg/lpeg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LPEG_VERSION = 0.12.1-1
+LPEG_VERSION = 0.12.2-1
 LPEG_LICENSE = MIT
 
 $(eval $(luarocks-package))
