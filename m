From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 5 Dec 2013 23:24:08 +0100
Subject: [Buildroot] [git commit] radvd: bump to version 1.9.7
Message-ID: <20131205231348.C84CD9BF2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=273a0aa068281fb7fab4398490d6db6ca7b86fb5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/radvd/radvd.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/radvd/radvd.mk b/package/radvd/radvd.mk
index c1c4e41..27ce7e7 100644
--- a/package/radvd/radvd.mk
+++ b/package/radvd/radvd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RADVD_VERSION = 1.9.5
+RADVD_VERSION = 1.9.7
 RADVD_SITE = http://www.litech.org/radvd/dist
 RADVD_DEPENDENCIES = host-bison flex libdaemon host-flex host-pkgconf
 
