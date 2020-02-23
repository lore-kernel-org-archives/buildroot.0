From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 23 Feb 2020 10:18:00 +0100
Subject: [Buildroot] [PATCH 1/4] package/ell: bump to version 0.28
Message-ID: <20200223091803.1007790-1-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 02e6e27..cbf83e4 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 b6a4b46807391ea69f9271074cc778aa74263af2bea3f797ab0c092e8dedd21f ell-0.24.tar.gz
+sha256 f7d41781eebcec5795554249400895532460bcf533f2a55ee0c3b9c792dda42d  ell-0.28.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 6cafdd7..664976a 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.24
+ELL_VERSION = 0.28
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.25.1
