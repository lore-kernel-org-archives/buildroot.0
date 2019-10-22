From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Tue, 22 Oct 2019 10:16:30 +0000
Subject: [Buildroot] [PATCH] package/ell: bump version to 0.24
Message-ID: <20191022101612.99851-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index f5062d0528..02e6e27b53 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256 6faf84fb5a5285f97c65f21e43d496c5954f62f94079422883c01e80d488c676 ell-0.20.tar.gz
+sha256 b6a4b46807391ea69f9271074cc778aa74263af2bea3f797ab0c092e8dedd21f ell-0.24.tar.gz
 
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 9893245b0a..6cafdd73d5 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.20
+ELL_VERSION = 0.24
 ELL_SITE = https://git.kernel.org/pub/scm/libs/ell/ell.git
 ELL_SITE_METHOD = git
 ELL_LICENSE = LGPL-2.1+
-- 
2.23.0
