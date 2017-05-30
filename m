From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:51:22 +0200
Subject: [Buildroot] [git commit] erlang-p1-zlib: bump to version 1.0.2
Message-ID: <20170601202859.60E41818F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=83a626b7812498b568d0e51d5d1978b2316909c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License changed to Apache-2.0.

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/erlang-p1-zlib/erlang-p1-zlib.hash | 2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk   | 8 ++++----
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.hash b/package/erlang-p1-zlib/erlang-p1-zlib.hash
index 488e752..eded821 100644
--- a/package/erlang-p1-zlib/erlang-p1-zlib.hash
+++ b/package/erlang-p1-zlib/erlang-p1-zlib.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 cb534ee8d8746e38027ada0ccd7e910daa025c74461286ded60ffaa933e3cf7b erlang-p1-zlib-1.0.0.tar.gz
+sha256 2200330f7d4fc595caf8806fec1318b853009ab3d643cf063d19bff59bf2b45e erlang-p1-zlib-1.0.2.tar.gz
diff --git a/package/erlang-p1-zlib/erlang-p1-zlib.mk b/package/erlang-p1-zlib/erlang-p1-zlib.mk
index 89574b8..a57b19f 100644
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
