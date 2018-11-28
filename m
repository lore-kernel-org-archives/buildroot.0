From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:38:17 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-iconv: bump to version
 1.0.10
Message-ID: <20181202071600.A3870803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=790805c9e27968089bbe29f7966dc868fc21562e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
index 0f0a23161a..31bcf40731 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 c7214ea7503c3de1edf3bdd72b37187aa3a9a36d7cf7f5945a067ae8d262d3fb erlang-p1-iconv-1.0.6.tar.gz
+sha256 8a9ff8a3dd983284caa964f118b5782ef1c0c662995608b2ca4f4a5f285605a9 erlang-p1-iconv-1.0.10.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 6b22431cce..79d8efe16f 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = 1.0.6
+ERLANG_P1_ICONV_VERSION = 1.0.10
 ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = Apache-2.0
 ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
