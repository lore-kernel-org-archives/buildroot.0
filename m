From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 07:41:45 +0200
Subject: [Buildroot] [git commit] package/libuwsc: bump version to 3.3.5
Message-ID: <20200407052805.513537F9D2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dddd3a9bcecbab2ccdf417c4b24a650ba96b1845
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libuwsc/libuwsc.hash | 4 ++--
 package/libuwsc/libuwsc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
index e73d105cd1..f99dfb4c5d 100644
--- a/package/libuwsc/libuwsc.hash
+++ b/package/libuwsc/libuwsc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ef789ff35e537e5191ec0d13f3e0df54187a54eace611e283ad4172d4411d08b  libuwsc-3.3.4.tar.gz
-sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
+sha256  a06b7324671e181ffe3165e93e6f94c7ac1380f69e32a52e80c8da7016acd60d  libuwsc-3.3.5.tar.gz
+sha256  99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index c0c05e7223..83d05a96ec 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUWSC_VERSION = 3.3.4
+LIBUWSC_VERSION = 3.3.5
 LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
 LIBUWSC_LICENSE = MIT
 LIBUWSC_LICENSE_FILES = LICENSE
