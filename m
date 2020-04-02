From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 2 Apr 2020 22:01:12 +0200
Subject: [Buildroot] [git commit] package/libuwsc: bump version to 3.3.4
Message-ID: <20200402195014.375508B448@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=964fb4bf822a413b2a75ba6f9a582347d46488b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Adjust license hash for a change in email address:
-Copyright (c) 2019 Jianhui Zhao <jianhuizhao329@gmail.com>
+Copyright (c) 2019 Jianhui Zhao <zhaojh329@gmail.com>

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuwsc/libuwsc.hash | 4 ++--
 package/libuwsc/libuwsc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
index f137b3613b..e73d105cd1 100644
--- a/package/libuwsc/libuwsc.hash
+++ b/package/libuwsc/libuwsc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bae2cd13eda86876ebcf99a38a069f5e8c01717713d2fec25031051b9c47624b  libuwsc-3.3.2.tar.gz
-sha256 e557975decde6439395e72dce7690d974d1a493722a7be5228794ec944f0c5db  LICENSE
+sha256 ef789ff35e537e5191ec0d13f3e0df54187a54eace611e283ad4172d4411d08b  libuwsc-3.3.4.tar.gz
+sha256 99efed4bbc0b62f96f999ef23399e38234fb91651af734fd389a52b033a85b55  LICENSE
diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index 213b1d5891..c0c05e7223 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUWSC_VERSION = 3.3.2
+LIBUWSC_VERSION = 3.3.4
 LIBUWSC_SITE = https://github.com/zhaojh329/libuwsc/releases/download/v$(LIBUWSC_VERSION)
 LIBUWSC_LICENSE = MIT
 LIBUWSC_LICENSE_FILES = LICENSE
