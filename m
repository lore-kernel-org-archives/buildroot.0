From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 22 Apr 2019 22:22:43 +0200
Subject: [Buildroot] [git commit] package/efl: bump to version 1.22.1
Message-ID: <20190422201806.55BB4814A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ba294abab4303810ce34a26fc7dfd9977e431920
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See:
https://www.enlightenment.org/news/efl-1.22.1

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/efl/efl.hash | 4 ++--
 package/efl/efl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/efl/efl.hash b/package/efl/efl.hash
index 18d867bfe4..bef0a73ff1 100644
--- a/package/efl/efl.hash
+++ b/package/efl/efl.hash
@@ -1,5 +1,5 @@
-# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.0.tar.xz.sha256
-sha256 6ac87450cb55a5948c550dbeb05464f5fc1b0616c52dcb1cb2efbda73999c8ef efl-1.22.0.tar.xz
+# From https://download.enlightenment.org/rel/libs/efl/efl-1.22.1.tar.xz.sha256
+sha256 20d3e5e945d54ae46ec916c7341b5dec24f904b6c0123b4d3ecb8cd8d596ae12 efl-1.22.1.tar.xz
 
 sha256 d949e42ca8fd48d275c397c5fc2ac34c9b63ada715dcaf1a670e17bb62964341  COMPLIANCE
 sha256 1f0597d326e2fdb54aa2f0caec6d8bb0afb9941ef32475f017ed02ca214fcf37  COPYING
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index ecc31f84c4..959ed0cc3b 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EFL_VERSION = 1.22.0
+EFL_VERSION = 1.22.1
 EFL_SOURCE = efl-$(EFL_VERSION).tar.xz
 EFL_SITE = http://download.enlightenment.org/rel/libs/efl
 EFL_LICENSE = BSD-2-Clause, LGPL-2.1+, GPL-2.0+, FTL, MIT
