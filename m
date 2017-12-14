From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Thu, 14 Dec 2017 23:25:55 +0100
Subject: [Buildroot] [PATCH 1/4] skalibs: bump version to 2.6.2.0
In-Reply-To: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
References: <20171214222558.14148-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171214222558.14148-2-eric.le.bihan.dev@free.fr>
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
index 1e0625f3e7..dc3bf13bb7 100644
--- a/package/skalibs/skalibs.hash
+++ b/package/skalibs/skalibs.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 b11f515d29768497d648c7ae87e26f7441395a056ebbe3fe89596fe6454a557a  skalibs-2.6.0.1.tar.gz
+sha256 12f9706b412367c45310ab971d204d959441895d3fea6e5e41ab8ef8d24b71b2  skalibs-2.6.2.0.tar.gz
diff --git a/package/skalibs/skalibs.mk b/package/skalibs/skalibs.mk
index 2588d276e7..de257f71d1 100644
--- a/package/skalibs/skalibs.mk
+++ b/package/skalibs/skalibs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SKALIBS_VERSION = 2.6.0.1
+SKALIBS_VERSION = 2.6.2.0
 SKALIBS_SITE = http://skarnet.org/software/skalibs
 SKALIBS_LICENSE = ISC
 SKALIBS_LICENSE_FILES = COPYING
-- 
2.14.3
