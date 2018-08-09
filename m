From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 9 Aug 2018 10:40:07 +0200
Subject: [Buildroot] [git commit branch/next] acpid: bump to version 2.0.30
Message-ID: <20180809084508.63E878B6C9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bd613af5cb26cdfa278e441013aad47c38bb34b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Bump to version 2.0.30.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpid/acpid.hash | 4 ++--
 package/acpid/acpid.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/acpid/acpid.hash b/package/acpid/acpid.hash
index 9cf91d9333..0286219621 100644
--- a/package/acpid/acpid.hash
+++ b/package/acpid/acpid.hash
@@ -1,3 +1,3 @@
 # From https://sourceforge.net/projects/acpid2/files/
-md5	0432407b5ff75ae8e08afb43052fde2b	acpid-2.0.28.tar.xz
-sha1	a5cb34d53eb6965293c436db23dc81550273975b	acpid-2.0.28.tar.xz
+md5	1528040b5d34f8c24ebabd97befbf913	acpid-2.0.30.tar.xz
+sha1	680bbb3fa9cdabb78fb19c6d24bb57224fbbbaed	acpid-2.0.30.tar.xz
diff --git a/package/acpid/acpid.mk b/package/acpid/acpid.mk
index 2141a1a9e0..33e87cf50a 100644
--- a/package/acpid/acpid.mk
+++ b/package/acpid/acpid.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ACPID_VERSION = 2.0.28
+ACPID_VERSION = 2.0.30
 ACPID_SOURCE = acpid-$(ACPID_VERSION).tar.xz
 ACPID_SITE = http://downloads.sourceforge.net/project/acpid2
 ACPID_LICENSE = GPL-2.0+
