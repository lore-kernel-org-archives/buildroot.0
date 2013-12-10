From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Dec 2013 10:05:11 +0100
Subject: [Buildroot] [git commit] numactl: bump to version 2.0.9
Message-ID: <20131210091112.034899BFB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0693f311cc4026c9193c225973619889a3548a9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Axel Lin <axel.lin@ingics.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/numactl/numactl.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index ee62f73..c82ba4e 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.8
+NUMACTL_VERSION = 2.0.9
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download/
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
