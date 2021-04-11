From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 11 Apr 2021 11:47:37 +0200
Subject: [Buildroot] [PATCH 2/3] package/mpfr: bump to version 4.1.0
In-Reply-To: <20210411094738.455891-1-romain.naour@gmail.com>
References: <20210411094738.455891-1-romain.naour@gmail.com>
Message-ID: <20210411094738.455891-2-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See: https://www.mpfr.org/mpfr-4.1.0/

Update indentation in hash file (two spaces).

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
The mpfr mailing is not curently public, I can't get the hash from the announce mail.

https://sympa.inria.fr/sympa/arc/mpfr-announce

At least my hash is the same as the one used for archlinux mpfr package:

https://github.com/archlinux/svntogit-packages/commit/6aa73da19b299ca2a98cf4aa294d53ae0d8084b7
---
 package/mpfr/mpfr.hash | 6 +++---
 package/mpfr/mpfr.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index ea44b8c20a..35056f626a 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,5 +1,5 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2019-01/msg00019.html
-sha256 1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a  mpfr-4.0.2.tar.xz
+# Locally calculated
+sha256  0c98a3f1732ff6ca4ea690552079da9c597872d30e96ec28414ee23c95558a7f  mpfr-4.1.0.tar.xz
 
 # Hash for license file
-sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
+sha256  e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 837aff3aa5..cd558dae0e 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 4.0.2
+MPFR_VERSION = 4.1.0
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
-- 
2.30.2
