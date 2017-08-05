From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 17:54:31 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/erlang-jiffy: bump version to
	0.14.11
Message-ID: <20170805155431.9003-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/erlang-jiffy/erlang-jiffy.hash | 2 +-
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 1f83e2789..4a201fe5d 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256 7d1054c475c82c626de3ad57201a7fc51da38667c8a7502149eb751edc6b601d erlang-jiffy-0.14.8.tar.gz
+sha256 c555726f592b79894c253ca1dc3c3aec6a5697271d29364d57f8175f387b86f3 erlang-jiffy-0.14.11.tar.gz
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index 313945454..342576845 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 0.14.8
+ERLANG_JIFFY_VERSION = 0.14.11
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.11.0
