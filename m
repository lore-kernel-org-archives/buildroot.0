From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:38 +0100
Subject: [Buildroot] [PATCH 03/14] erlang-p1-zlib: Bump to version 1.0.3
In-Reply-To: <20180116140649.7381-1-johan.oudinet@gmail.com>
References: <20180116140649.7381-1-johan.oudinet@gmail.com>
Message-ID: <20180116140649.7381-4-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index eded821013..dc14dd0707 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2200330f7d4fc595caf8806fec1318b853009ab3d643cf063d19bff59bf2b45e erlang-p1-zlib-1.0.2.tar.gz
+sha256 8396f9cb17fdb195d9a2537ad76327bf930d66118b87b7108f27e5ed28b7cde6 erlang-p1-zlib-1.0.3.tar.gz
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index a57b19fd13..bc53efccd7 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.2
+ERLANG_P1_ZLIB_VERSION = 1.0.3
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
-- 
2.14.1
