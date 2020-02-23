From: Mauro Condarelli <mc5686@mclink.it>
Date: Sun, 23 Feb 2020 10:18:02 +0100
Subject: [Buildroot] [PATCH 3/4] package/iwd: bump to version 1.5
In-Reply-To: <20200223091803.1007790-1-mc5686@mclink.it>
References: <20200223091803.1007790-1-mc5686@mclink.it>
Message-ID: <20200223091803.1007790-3-mc5686@mclink.it>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/iwd/iwd.hash | 3 +--
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index e7ba107..cdf28d2 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,4 @@
 # Locally computed
-sha256 f52ed3cc0dae1f9a82c601df638977f0f6d8d4629ba5e333b4743748a907c0e7 iwd-0.22.tar.gz
-
+sha256 4d7c92b9fdbf14f46f208f1b053597a7e5225a4ad42369a3c28bcdb595087833  iwd-1.5.tar.gz
 # License files
 sha256 ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5 COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index fc8b83d..799e631 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 0.22
+IWD_VERSION = 1.5
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.25.1
