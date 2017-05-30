From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:51:59 +0200
Subject: [Buildroot] [PATCH 04/16] erlang-p1-zlib: bump to version 1.0.2
In-Reply-To: <20170530145211.15320-1-johan.oudinet@gmail.com>
References: <20170530145211.15320-1-johan.oudinet@gmail.com>
Message-ID: <20170530145211.15320-5-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index 488e75294c..eded821013 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 cb534ee8d8746e38027ada0ccd7e910daa025c74461286ded60ffaa933e3cf7b erlang-p1-zlib-1.0.0.tar.gz
+sha256 2200330f7d4fc595caf8806fec1318b853009ab3d643cf063d19bff59bf2b45e erlang-p1-zlib-1.0.2.tar.gz
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 89574b8275..a57b19fd13 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.0
-ERLANG_P1_ZLIB_SITE = $(call github,processone,zlib,$(ERLANG_P1_ZLIB_VERSION))
-ERLANG_P1_ZLIB_LICENSE = GPL-2.0+
-ERLANG_P1_ZLIB_LICENSE_FILES = COPYING
+ERLANG_P1_ZLIB_VERSION = 1.0.2
+ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
+ERLANG_P1_ZLIB_LICENSE = Apache-2.0
+ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_ZLIB_DEPENDENCIES = zlib
 
 $(eval $(rebar-package))
-- 
2.11.0
