From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Thu, 26 Nov 2020 18:42:50 +0100
Subject: [Buildroot] [PATCH 07/18] package/erlang-jiffy: bump version to
 1.0.6
In-Reply-To: <20201126174301.411219-1-johan.oudinet@gmail.com>
References: <20201126174301.411219-1-johan.oudinet@gmail.com>
Message-ID: <20201126174301.411219-7-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-jiffy/erlang-jiffy.hash | 4 ++--
 package/erlang-jiffy/erlang-jiffy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-jiffy/erlang-jiffy.hash b/package/erlang-jiffy/erlang-jiffy.hash
index 1c18142b6e..19e4f96012 100644
--- a/package/erlang-jiffy/erlang-jiffy.hash
+++ b/package/erlang-jiffy/erlang-jiffy.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 c555726f592b79894c253ca1dc3c3aec6a5697271d29364d57f8175f387b86f3 erlang-jiffy-0.14.11.tar.gz
-sha256 0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49 LICENSE
+sha256  7cf67840c58b8732e12c84c8a3b714774da2601ae5e6a57f286273e25b205516  erlang-jiffy-1.0.6.tar.gz
+sha256  0fa8afad2f02c08850a16e36fe55376ee19732b3a116a0207f2a73c857777a49  LICENSE
diff --git a/package/erlang-jiffy/erlang-jiffy.mk b/package/erlang-jiffy/erlang-jiffy.mk
index 9a688f7c9b..e50a5f598f 100644
--- a/package/erlang-jiffy/erlang-jiffy.mk
+++ b/package/erlang-jiffy/erlang-jiffy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_JIFFY_VERSION = 0.14.11
+ERLANG_JIFFY_VERSION = 1.0.6
 ERLANG_JIFFY_SITE = $(call github,davisp,jiffy,$(ERLANG_JIFFY_VERSION))
 ERLANG_JIFFY_LICENSE = MIT (core), \
 	BSD-3-Clause (Google double conversion library), \
-- 
2.25.1
