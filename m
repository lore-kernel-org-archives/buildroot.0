From: Christian Stewart <christian@paral.in>
Date: Mon, 22 Feb 2021 03:44:07 -0800
Subject: [Buildroot] [PATCH 1/1] package/delve: bump to version 1.6.0
Message-ID: <20210222114407.2530937-1-christian@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/delve/delve.hash | 2 +-
 package/delve/delve.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/delve/delve.hash b/package/delve/delve.hash
index e8bb9c37ad..fa1d586dc9 100644
--- a/package/delve/delve.hash
+++ b/package/delve/delve.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f8bbaecdfc9d1ff6148900d3dea44b6dd06a7f0197be4e9a75c289b7f62682ab  delve-1.5.0.tar.gz
+sha256  a10a6fc40d87572c6d3f3becdb1a289269e17526d038749f2fa04dd9f591f26a  delve-1.6.0.tar.gz
 sha256	778864b990007e8cef6633f8c372dd05bac1fada6cf67b008afb1483f83b38f5  LICENSE
diff --git a/package/delve/delve.mk b/package/delve/delve.mk
index f574bc5c08..fe47319b46 100644
--- a/package/delve/delve.mk
+++ b/package/delve/delve.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DELVE_VERSION = 1.5.0
+DELVE_VERSION = 1.6.0
 DELVE_SITE = $(call github,go-delve,delve,v$(DELVE_VERSION))
 DELVE_LICENSE = MIT
 DELVE_LICENSE_FILES = LICENSE
-- 
2.30.1
