From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 17 Mar 2018 09:36:47 +0100
Subject: [Buildroot] [git commit] package/efl: bump to 1.20.7
Message-ID: <20180317085653.F3067801B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e5607fc4dd1f63da09bbe09e6cf51ce5c585fd7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See https://www.enlightenment.org/news/efl-1.20.7

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 5507bda3ef..1391d1f707 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.6.tar.xz.sha256
-sha256	56c67ea77435753a4f324a0a13488ba58f4ed7eb35a97c1a354fdc79c39a32c1	efl-1.20.6.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.20.7.tar.xz.sha256
+sha256 b0a9b765bcd7b012f1072da1d491fc8671aa089473f746901d93f5807a2c76fe  efl-1.20.7.tar.xz
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
 sha256 781ee841d15835b393bfe7d4c6497dc1b05217479abd40daceaf7aa102a758e1  licenses/COPYING.BSD
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 7085796756..6ef7d53385 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.20.6
+EFL_VERSION = 1.20.7
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
