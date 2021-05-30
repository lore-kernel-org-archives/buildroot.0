From: Christian Stewart <christian@paral.in>
Date: Sat, 29 May 2021 23:48:15 -0700
Subject: [Buildroot] [PATCH 1/1] package/delve: bump to version 1.6.1
Message-ID: <20210530064815.1173206-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/delve/delve.hash | 4 ++--
 package/delve/delve.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index e8bb9c37ad..3d117813c6 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f8bbaecdfc9d1ff6148900d3dea44b6dd06a7f0197be4e9a75c289b7f62682ab  delve-1.5.0.tar.gz
-sha256	778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
+sha256  e73f7fc063632268d3bdf53486aeafd98cceb8f86f4af56903dedfebaefe690d  delve-1.6.1.tar.gz
+sha256  778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index f574bc5c08..6c346552a4 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.5.0
+DELVE_VERSION = 1.6.1
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.31.1
