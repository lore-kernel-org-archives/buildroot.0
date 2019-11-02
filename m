From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Sat,  2 Nov 2019 22:32:00 +0100
Subject: [Buildroot] [PATCH 1/9] package/skalibs: bump version to 2.9.1.0
In-Reply-To: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
References: <20191102213208.27075-1-eric.le.bihan.dev@free.fr>
Message-ID: <20191102213208.27075-2-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/skalibs/skalibs.hash | 2 +-
 package/skalibs/skalibs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/skalibs/skalibs.hash b/package/skalibs/skalibs.hash
index e8e591dd05..bb5a60212f 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 f5604f9e5ebb436d3a8efa16a2c4133f7bd424d9f22aa88fe7a372f0153396fb  skalibs-2.9.0.0.tar.gz
+sha256 d3b204afc462b9659e0c16f6df1c796e7612534f537eec053529f67ddcd086a5  skalibs-2.9.1.0.tar.gz
 sha256 d8e17a6418d26867c13801810903a1f78beac8cfe8f92c2a85afe59f3c3fc48c  COPYING
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index be94a186fc..8b995f7961 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.9.0.0
+SKALIBS_VERSION = 2.9.1.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.21.0
