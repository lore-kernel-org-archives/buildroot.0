From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 29 May 2019 11:30:26 +0200
Subject: [Buildroot] [PATCH for-next 1/2] package/efl: bump to version 1.22.2
Message-ID: <20190529093027.11911-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See https://www.enlightenment.org/news/efl-1.22.2

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index bef0a73ff1..f9015681ee 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.1.tar.xz.sha256
-sha256 20d3e5e945d54ae46ec916c7341b5dec24f904b6c0123b4d3ecb8cd8d596ae12 efl-1.22.1.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.2.tar.xz.sha256
+sha256 1699891f825911622de0aa77fe1140eff7335aba619d2352485e54dcff6b1cd0 efl-1.22.2.tar.xz
 
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 959ed0cc3b..6f7c09ffa3 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.22.1
+EFL_VERSION = 1.22.2
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
-- 
2.21.0
