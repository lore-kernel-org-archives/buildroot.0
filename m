From: Jianhui Zhao <zhaojh329@gmail.com>
Date: Tue, 31 Mar 2020 00:43:38 +0800
Subject: [Buildroot] [PATCH 1/1] package/libuwsc: bump version to 3.3.4
Message-ID: <20200330164338.30051-1-zhaojh329@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
---
 package/libuwsc/libuwsc.hash | 2 +-
 package/libuwsc/libuwsc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libuwsc/libuwsc.hash b/package/libuwsc/libuwsc.hash
index f137b3613b..e2c8452389 100644
--- a/package/libuwsc/libuwsc.hash
+++ b/package/libuwsc/libuwsc.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 bae2cd13eda86876ebcf99a38a069f5e8c01717713d2fec25031051b9c47624b  libuwsc-3.3.2.tar.gz
+sha256 ef789ff35e537e5191ec0d13f3e0df54187a54eace611e283ad4172d4411d08b  libuwsc-3.3.4.tar.gz
 sha256 e557975decde6439395e72dce7690d974d1a493722a7be5228794ec944f0c5db  LICENSE
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
-- 
2.17.1
