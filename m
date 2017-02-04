From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 4 Feb 2017 13:04:08 +0100
Subject: [Buildroot] [git commit] acpid: bump to version 2.0.28
Message-ID: <20170204162521.AB2EF8164D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=215773d063a832ee0b7c259e2c8c1d9dc3f27701
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <aduskett@codeblue.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/acpid/acpid.hash | 4 ++--
 package/acpid/acpid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index 91990fd..9cf91d9 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5	e41bdf628e122edb4342fca432ea7db9	acpid-2.0.27.tar.xz
-sha1	aabf129499f99b3c14e7a9f5b5ec717b0913e9c8	acpid-2.0.27.tar.xz
+md5	0432407b5ff75ae8e08afb43052fde2b	acpid-2.0.28.tar.xz
+sha1	a5cb34d53eb6965293c436db23dc81550273975b	acpid-2.0.28.tar.xz
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 510282b..f561b90 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.27
+ACPID_VERSION = 2.0.28
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPLv2+
