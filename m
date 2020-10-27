From: Doug Kehn <rdkehn@gmail.com>
Date: Tue, 27 Oct 2020 10:21:10 -0500
Subject: [Buildroot] [PATCH 2/2] package/unscd: bump version to 0.54
In-Reply-To: <20201027152110.446395-1-rdkehn@gmail.com>
References: <20201027152110.446395-1-rdkehn@gmail.com>
Message-ID: <20201027152110.446395-2-rdkehn@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Doug Kehn <rdkehn@gmail.com>
---
 package/unscd/unscd.hash | 2 +-
 package/unscd/unscd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unscd/unscd.hash b/package/unscd/unscd.hash
index 671149fda2..9ed698fd2a 100644
--- a/package/unscd/unscd.hash
+++ b/package/unscd/unscd.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  9078255b2b9c344d9a0c3333ce23dda9d745f158dde0ea2244a8c56ba93f7a40  nscd-0.53.c
+sha256  90e12c71732474cac4d055bf9d104e599178b4e1ecb6d3b8c556eaa11f8f6447  nscd-0.54.c
diff --git a/package/unscd/unscd.mk b/package/unscd/unscd.mk
index c79ec44000..94b46460f6 100644
--- a/package/unscd/unscd.mk
+++ b/package/unscd/unscd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNSCD_VERSION = 0.53
+UNSCD_VERSION = 0.54
 UNSCD_SOURCE = nscd-$(UNSCD_VERSION).c
 UNSCD_SITE = http://busybox.net/~vda/unscd
 UNSCD_LICENSE = GPL-2.0
-- 
2.28.0
