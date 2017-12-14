From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 14 Dec 2017 23:25:56 +0100
Subject: [Buildroot] [PATCH 2/4] execline: bump version to 2.3.0.4
In-Reply-To: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
References: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171214222558.14148-3-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/execline/execline.hash | 2 +-
 package/execline/execline.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/execline/execline.hash b/package/execline/execline.hash
index 1251d8d79e..79ea5ba737 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 1a698425740a410a38be770f98b8faf94c633e29a74ba1d25adddbb294e979f5  execline-2.3.0.3.tar.gz
+sha256 e4bb8fc8f20cca96f4bac9f0f74ebce5081b4b687bb11c79c843faf12507a64b  execline-2.3.0.4.tar.gz
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index a4f4229f6c..68131b8fa2 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.3.0.3
+EXECLINE_VERSION = 2.3.0.4
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.14.3
