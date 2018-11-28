From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 28 Nov 2018 22:37:59 +0100
Subject: [Buildroot] [git commit] package/erlang-p1-zlib: bump to version
 1.0.4
Message-ID: <20181202071600.743CC803E1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f71d9dae00f865122ba4c921bfcc4efefc62f8a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index dc14dd0707..6717abdde0 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 8396f9cb17fdb195d9a2537ad76327bf930d66118b87b7108f27e5ed28b7cde6 erlang-p1-zlib-1.0.3.tar.gz
+sha256 3328661c512c28e68db69b82202b8d6c4127f31f2aefc5b0040ba9bce6abe9b3 erlang-p1-zlib-1.0.4.tar.gz
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index bc53efccd7..f62eff6377 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.mk
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_ZLIB_VERSION = 1.0.3
+ERLANG_P1_ZLIB_VERSION = 1.0.4
 ERLANG_P1_ZLIB_SITE = $(call github,processone,ezlib,$(ERLANG_P1_ZLIB_VERSION))
 ERLANG_P1_ZLIB_LICENSE = Apache-2.0
 ERLANG_P1_ZLIB_LICENSE_FILES = LICENSE.txt
