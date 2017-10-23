From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Mon, 23 Oct 2017 21:52:02 +0200
Subject: [Buildroot] [PATCH 3/4] s6: bump version to 2.6.1.1
In-Reply-To: <20171023195203.6775-1-eric.le.bihan.dev@free.fr>
References: <20171023195203.6775-1-eric.le.bihan.dev@free.fr>
Message-ID: <20171023195203.6775-4-eric.le.bihan.dev@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
---
 package/s6/s6.hash | 2 +-
 package/s6/s6.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index 41f3dff0c4..2f498b0d6a 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,2 +1,2 @@
 # Locally generated
-sha256 f0de303791134302f2630b9fe76a936b064e1e3aa772c8ae1b891155a6ea2c79  s6-2.6.1.0.tar.gz
+sha256 0172b7293d4d5607ca3ca77382fee9b87c10bd58680720b29625cf35afc75c5c  s6-2.6.1.1.tar.gz
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index da9917cb8c..3cf3885d5a 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.6.1.0
+S6_VERSION = 2.6.1.1
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.13.6
