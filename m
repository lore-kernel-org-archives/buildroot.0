From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 08:32:25 +0200
Subject: [Buildroot] [git commit] package/ell: bump version to 0.32
Message-ID: <20200620063046.0ACE882A01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f57937ea1d83d86193e928836af636b85e8a36aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 526417bf33..c151812232 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  5933faff0b94455bc05c9885d138ca295f5e9cc6e2eecdf203e4dba45d08fd80  ell-0.31.tar.gz
+sha256  50ead312a290f44808fd5fcb4f8495b20ab16511d0b76f6d33db186b87c608a1  ell-0.32.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index da39ccc823..6c265b93ab 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.31
+ELL_VERSION = 0.32
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
