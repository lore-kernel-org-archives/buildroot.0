From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 Apr 2020 23:07:02 +0200
Subject: [Buildroot] [PATCH v1 2/2] package/iwd: bump version to 1.6
In-Reply-To: <20200407210702.10992-1-ps.report@gmx.net>
References: <20200407210702.10992-1-ps.report@gmx.net>
Message-ID: <20200407210702.10992-2-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/iwd/iwd.hash | 2 +-
 package/iwd/iwd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iwd/iwd.hash b/package/iwd/iwd.hash
index 006916cdff..26ce712660 100644
--- a/package/iwd/iwd.hash
+++ b/package/iwd/iwd.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  4d7c92b9fdbf14f46f208f1b053597a7e5225a4ad42369a3c28bcdb595087833  iwd-1.5.tar.gz
+sha256  10b53cee9c38c9c60f83d4e16a446b27551b6187a2bd09d724f2238c99877f3f  iwd-1.6.tar.gz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 799e631ba5..f3776fbfd4 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IWD_VERSION = 1.5
+IWD_VERSION = 1.6
 IWD_SITE = https://git.kernel.org/pub/scm/network/wireless/iwd.git
 IWD_SITE_METHOD = git
 IWD_LICENSE = LGPL-2.1+
-- 
2.26.0
