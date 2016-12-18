From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Dec 2016 00:32:56 +0100
Subject: [Buildroot] [git commit] gmp: bump to version 6.1.2
Message-ID: <20161218233302.25B6680AEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=584885c8d4ba8e2f824436386d005f1ff75ca1a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gmp/gmp.hash | 2 +-
 package/gmp/gmp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index 9ea42e5..f4793cd 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	d36e9c05df488ad630fff17edb50051d6432357f9ce04e34a09b3d818825e831	gmp-6.1.1.tar.xz
+sha256	87b565e89a9a684fe4ebeeddb8399dce2599f9c9049854ca8c0dfbdea0e21912	gmp-6.1.2.tar.xz
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index 843a7a1..33b5d54 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMP_VERSION = 6.1.1
+GMP_VERSION = 6.1.2
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
