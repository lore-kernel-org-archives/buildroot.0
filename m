From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 1 Dec 2020 23:24:17 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-zlib: bump version to
 1.0.9
Message-ID: <20201203092228.9BA0D821E0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5f47e7adb4e3a3748abc3ba9f83020d00a73401b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file hash has changed due to:

-Copyright 2002-2019 ProcessOne SARL
+Copyright 2002-2020 ProcessOne SARL

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 4 ++--
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index ed803d98d8..7ce58762f8 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 7d39a3cb92ed7781b6b6ba95704e2591c626d62eddb3c52dcaeac60c339084d7 erlang-p1-zlib-1.0.6.tar.gz
-sha256 6e68ca4488fcdacf80ea0a3f5a6a294d48c2d8dc9de520cc3d6b3f3c1bc12847 LICENSE.txt
+sha256  f0ac60336b2ddf55ac4f58934580cb8f02dba440d68feb607be312dd35d91269  erlang-p1-zlib-1.0.9.tar.gz
+sha256  6cd4871db940d055cf272c12c10e0c08febdc94362e404390758fde34b4ce01a  LICENSE.txt
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 46a7d12862..0e6ee298ef 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.6
+ERLANG_P1_ZLIB_VERSION = 1.0.9
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
