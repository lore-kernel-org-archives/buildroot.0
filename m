From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 30 Jun 2018 16:21:24 +0200
Subject: [Buildroot] [PATCH 2/5 v2] package/stress-ng: bump version
In-Reply-To: <cover.1530368468.git.yann.morin.1998@free.fr>
References: <cover.1530368468.git.yann.morin.1998@free.fr>
Message-ID: <c4daceae3679ceb8b87a82b90c675c286939afb5.1530368468.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/stress-ng/stress-ng.hash | 2 +-
 package/stress-ng/stress-ng.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/stress-ng/stress-ng.hash b/package/stress-ng/stress-ng.hash
index e735439a7e..7455288c17 100644
--- a/package/stress-ng/stress-ng.hash
+++ b/package/stress-ng/stress-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	0e1d7733b35f594f7461dedbf836bd4966d0611da4cd4e85cde4804d2a425e6d	stress-ng-0.06.15.tar.gz
+sha256  0de97212a83b2f8a34ee31ef32a7bc69066ed49ebdc59b51aa4060cb95e29321  stress-ng-0.09.32.tar.xz
diff --git a/package/stress-ng/stress-ng.mk b/package/stress-ng/stress-ng.mk
index 794e87554e..d83240817a 100644
--- a/package/stress-ng/stress-ng.mk
+++ b/package/stress-ng/stress-ng.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-STRESS_NG_VERSION = 0.06.15
+STRESS_NG_VERSION = 0.09.32
+STRESS_NG_SOURCE = stress-ng-$(STRESS_NG_VERSION).tar.xz
 STRESS_NG_SITE = http://kernel.ubuntu.com/~cking/tarballs/stress-ng
 STRESS_NG_LICENSE = GPL-2.0+
 STRESS_NG_LICENSE_FILES = COPYING
-- 
2.14.1
