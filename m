From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Date: Tue,  1 May 2018 21:08:54 +0200
Subject: [Buildroot] [PATCH 3/5] s6: bump version to 2.7.1.1
In-Reply-To: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
References: <20180501190856.19386-1-eric.le.bihan.dev@free.fr>
Message-ID: <20180501190856.19386-4-eric.le.bihan.dev@free.fr>
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
index 4a20e0f914..12791a9760 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256 6617cbf82c73273c67c6102a1a5c48449ef65ffbe8d0db6a587b7f0078dc6e13  s6-2.7.0.0.tar.gz
+sha256 f37547f2890eb50bcb4cd46ffa38bad5ec9e6fd6bc7b73a8df0bdf0cf11f01a9  s6-2.7.1.1.tar.gz
 sha256 3eadcf980c40da0f257b8292d805ff41e5e5a908c1942315d9a627732e1aa012  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index 5556bfff93..83945b08d5 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.7.0.0
+S6_VERSION = 2.7.1.1
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
-- 
2.14.3
