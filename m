From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  3 Dec 2019 18:55:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/e2tools: bump to version 0.0.16.4
Message-ID: <20191203175512.1923587-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/e2tools/e2tools.hash | 3 ++-
 package/e2tools/e2tools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/e2tools/e2tools.hash b/package/e2tools/e2tools.hash
index 4cec81e942..a109ff1bda 100644
--- a/package/e2tools/e2tools.hash
+++ b/package/e2tools/e2tools.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256 37bbd705170dff80720d68916f8d90803d71987e1b60f7149a285a7fcd539214  e2tools-3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6.tar.gz
+sha256 1d06ca71f01483ad6d9a514e31466e7d2357b3465de2813d667a8b2f9638544e  e2tools-0.0.16.4.tar.gz
+sha256 0e79fd282723e1eb3f7381d41233a83ed20cf3e8c83aa53e6847bf7ffe781583  COPYING
diff --git a/package/e2tools/e2tools.mk b/package/e2tools/e2tools.mk
index 266d90911f..7c9ef0ffc7 100644
--- a/package/e2tools/e2tools.mk
+++ b/package/e2tools/e2tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-E2TOOLS_VERSION = 3158ef18a903ca4a98b8fa220c9fc5c133d8bdf6
-E2TOOLS_SITE = $(call github,ndim,e2tools,$(E2TOOLS_VERSION))
+E2TOOLS_VERSION = 0.0.16.4
+E2TOOLS_SITE = $(call github,ndim,e2tools,v$(E2TOOLS_VERSION))
 
 # Source coming from GitHub, no configure included.
 E2TOOLS_AUTORECONF = YES
-- 
2.24.0
