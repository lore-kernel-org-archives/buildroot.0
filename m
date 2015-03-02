From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Mar 2015 22:27:20 -0000
Subject: [Buildroot] [git commit] iproute2: bump to version 3.19.0
Message-ID: <20150302222718.BF0C3807B5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=47ecd4a841c70148903bb3c534e589d8b6df4882
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/iproute2/iproute2.hash |    2 +-
 package/iproute2/iproute2.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index 35dc554..40dd0a5 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,2 +1,2 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256	d5a182154abd0749b1df7d1649115a32c65f559951477396203b1f514dbff1df	iproute2-3.18.0.tar.xz
+sha256	e2f9f8c36e166f2ba6c0e1e7a9ad84cdf7c1615b93df49dac44563d7b57fd7b0	iproute2-3.19.0.tar.xz
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 0838463..688ae97 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 3.18.0
+IPROUTE2_VERSION = 3.19.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex
