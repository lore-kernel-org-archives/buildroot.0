From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Feb 2017 12:44:19 +0100
Subject: [Buildroot] [PATCH v3 06/38] package/libcec: bump version to 4.0.2
In-Reply-To: <20170204114451.20935-1-bernd.kuhls@t-online.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
Message-ID: <20170204114451.20935-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.hash | 2 +-
 package/libcec/libcec.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libcec/libcec.hash b/package/libcec/libcec.hash
index 377f343a2..5416c20fe 100644
--- a/package/libcec/libcec.hash
+++ b/package/libcec/libcec.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  0f29d5a2d155b507807ba896bc3b3e50a0ab56bf8f543a2bf5c2798c790292b5  libcec-2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd.tar.gz
+sha256 b8b8dd31f3ebdd5472f03ab7d401600ea0d959b1288b9ca24bf457ef60e2ba27  libcec-4.0.2.tar.gz
diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 55c5fbb83..1fe69ee98 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCEC_VERSION = 2c675dac48387c48c7f43c5d2547ef0c4ef5c7dd
-LIBCEC_SITE = $(call github,Pulse-Eight,libcec,$(LIBCEC_VERSION))
+LIBCEC_VERSION = 4.0.2
+LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
-- 
2.11.0
