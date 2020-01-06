From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:11:04 +0100
Subject: [Buildroot] [PATCH 11/22] erlang-p1-zlib: Bump to version 1.0.6
In-Reply-To: <20200106161115.16524-1-johan.oudinet@gmail.com>
References: <20200106161115.16524-1-johan.oudinet@gmail.com>
Message-ID: <20200106161115.16524-12-johan.oudinet@gmail.com>
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
index 6717abdde0..6d3d56a1a0 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 3328661c512c28e68db69b82202b8d6c4127f31f2aefc5b0040ba9bce6abe9b3 erlang-p1-zlib-1.0.4.tar.gz
+sha256 7d39a3cb92ed7781b6b6ba95704e2591c626d62eddb3c52dcaeac60c339084d7 erlang-p1-zlib-1.0.6.tar.gz
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index f62eff6377..46a7d12862 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.4
+ERLANG_P1_ZLIB_VERSION = 1.0.6
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
-- 
2.20.1
