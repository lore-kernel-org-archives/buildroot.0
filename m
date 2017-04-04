From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 4 Apr 2017 13:01:52 +0200
Subject: [Buildroot] [git commit] less: bump version to 487
Message-ID: <20170404110158.024A2826F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=27e31ec46f2f43818edcb5aa29c9059ac61d025f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/less/less.hash | 2 +-
 package/less/less.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/less/less.hash b/package/less/less.hash
index eea201d..3a6c799 100644
--- a/package/less/less.hash
+++ b/package/less/less.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	3fa38f2cf5e9e040bb44fffaa6c76a84506e379e47f5a04686ab78102090dda5	less-481.tar.gz
+sha256 f3dc8455cb0b2b66e0c6b816c00197a71bf6d1787078adeee0bcf2aea4b12706  less-487.tar.gz
diff --git a/package/less/less.mk b/package/less/less.mk
index 2102d3c..bccc08b 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LESS_VERSION = 481
+LESS_VERSION = 487
 LESS_SITE = $(BR2_GNU_MIRROR)/less
 LESS_LICENSE = GPL-3.0+
 LESS_LICENSE_FILES = COPYING
