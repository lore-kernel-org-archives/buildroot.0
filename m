From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  1 May 2018 21:08:53 +0200
Subject: [Buildroot] [PATCH 2/5] execline: bump version to 2.5.0.0
In-Reply-To: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
References: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180501190856.19386-3-eric.le.bihan.dev@free.fr>
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
index afead5cd74..ea10ff1f96 100644
--- a/package/execline/execline.hash
+++ b/package/execline/execline.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 e4bb8fc8f20cca96f4bac9f0f74ebce5081b4b687bb11c79c843faf12507a64b  execline-2.3.0.4.tar.gz
+sha256 f6993094766652041c21fde9c07ef53a3cd4b93a64123d9578fb4997a2cefca1  execline-2.5.0.0.tar.gz
 sha256 6ee77e7199d69b707ab864ea7a838f9562717aaa41c89413bdb2cf835f95052f  COPYING
diff --git a/package/execline/execline.mk b/package/execline/execline.mk
index 68131b8fa2..83205e3706 100644
--- a/package/execline/execline.mk
+++ b/package/execline/execline.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXECLINE_VERSION = 2.3.0.4
+EXECLINE_VERSION = 2.5.0.0
 EXECLINE_SITE = http://skarnet.org/software/execline
 EXECLINE_LICENSE = ISC
 EXECLINE_LICENSE_FILES = COPYING
-- 
2.14.3
