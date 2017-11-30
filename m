From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 30 Nov 2017 11:38:45 +0100
Subject: [Buildroot] [git commit] package/efl: bump to 1.20.6
Message-ID: <20171201205341.2DC5680FC6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0dc300b73124b42ea3465973e20b962f064a870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://www.enlightenment.org/news/efl-1.20.6

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index edc72c2..8b05430 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,2 +1,2 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.5.tar.xz.sha256
-sha256	da5e69b81c94b79f4e31cfc312413c36acb7429e1cb6fd4397a1251a0e23c21c 	efl-1.20.5.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.6.tar.xz.sha256
+sha256	56c67ea77435753a4f324a0a13488ba58f4ed7eb35a97c1a354fdc79c39a32c1	efl-1.20.6.tar.xz
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index e0748d2..5a82479 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.5
+EFL_VERSION = 1.20.6
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+
