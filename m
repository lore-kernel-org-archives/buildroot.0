From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 25 May 2017 19:19:46 +0200
Subject: [Buildroot] [for-next] package/enlightenment: bump to 0.21.8
Message-ID: <20170525171946.9243-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://www.enlightenment.org/news/e0.21.8_release

"We are aware of a issue when running su/sudo under kernel 4.11 the fix
for this issue will be in an upcoming kernel release rather then here
see (https://phab.enlightenment.org/T5470)"

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/enlightenment/enlightenment.hash | 4 ++--
 package/enlightenment/enlightenment.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/enlightenment/enlightenment.hash b/package/enlightenment/enlightenment.hash
index e69c7ff..0cb433f 100644
--- a/package/enlightenment/enlightenment.hash
+++ b/package/enlightenment/enlightenment.hash
@@ -1,2 +1,2 @@
-# From https://www.enlightenment.org/news/e-0.21.7-release
-sha256	7643f7fd4aadaca44c886f21063987624c50d4c50266e87600e902a59b7c76f7 	enlightenment-0.21.7.tar.xz
+# From https://www.enlightenment.org/news/e0.21.8_release
+sha256	fac21c5fb9cab89fb717b3577f7980fd0644ff1e94b144a55ba841116e8c5232 	enlightenment-0.21.8.tar.xz
diff --git a/package/enlightenment/enlightenment.mk b/package/enlightenment/enlightenment.mk
index 7bfc25b..b0c261a 100644
--- a/package/enlightenment/enlightenment.mk
+++ b/package/enlightenment/enlightenment.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENLIGHTENMENT_VERSION = 0.21.7
+ENLIGHTENMENT_VERSION = 0.21.8
 ENLIGHTENMENT_SOURCE = enlightenment-$(ENLIGHTENMENT_VERSION).tar.xz
 ENLIGHTENMENT_SITE = http://download.enlightenment.org/rel/apps/enlightenment
 ENLIGHTENMENT_LICENSE = BSD-2-Clause
-- 
2.9.4
