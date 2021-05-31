From: Michael Nosthoff <buildroot@heine.tech>
Date: Mon, 31 May 2021 21:02:55 +0200
Subject: [Buildroot] [PATCH 2/3] package/libabseil-cpp: bump version to
 20210324.1
In-Reply-To: <20210531190258.4092984-1-buildroot@heine.tech>
References: <20210531190258.4092984-1-buildroot@heine.tech>
Message-ID: <20210531190258.4092984-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index b176043566..d00fd24645 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  ebe2ad1480d27383e4bf4211e2ca2ef312d5e6a09eba869fd2e8a5c5d553ded2  libabseil-cpp-20200923.3.tar.gz
+sha256  441db7c09a0565376ecacf0085b2d4c2bbedde6115d7773551bc116212c2a8d6  libabseil-cpp-20210324.1.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index d614a5e5fc..bc379591ae 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20200923.3
+LIBABSEIL_CPP_VERSION = 20210324.1
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.25.1
