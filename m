From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:43 +0100
Subject: [Buildroot] [PATCH 08/14] erlang-p1-iconv: Bump to version 1.0.6
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-9-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-iconv/erlang-p1-iconv.hash | 2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.hash b/package/erlang-p1-iconv/erlang-p1-iconv.hash
index 883fd52095..0f0a23161a 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.hash
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 ca20d58166a4fb38883977600aca61e02bfd1257b8bded8c8ddd82d2a96084e6 erlang-p1-iconv-1.0.4.tar.gz
+sha256 c7214ea7503c3de1edf3bdd72b37187aa3a9a36d7cf7f5945a067ae8d262d3fb erlang-p1-iconv-1.0.6.tar.gz
diff --git a/package/erlang-p1-iconv/erlang-p1-iconv.mk b/package/erlang-p1-iconv/erlang-p1-iconv.mk
index 044361e415..6b22431cce 100644
--- a/package/erlang-p1-iconv/erlang-p1-iconv.mk
+++ b/package/erlang-p1-iconv/erlang-p1-iconv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ICONV_VERSION = 1.0.4
+ERLANG_P1_ICONV_VERSION = 1.0.6
 ERLANG_P1_ICONV_SITE = $(call github,processone,iconv,$(ERLANG_P1_ICONV_VERSION))
 ERLANG_P1_ICONV_LICENSE = Apache-2.0
 ERLANG_P1_ICONV_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
