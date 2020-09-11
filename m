From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 15:29:06 +0200
Subject: [Buildroot] [PATCH 1/3] package/libabseil-cpp: bump to 20200225.2
In-Reply-To: <20200911132907.11748-1-buildroot@heine.tech>
References: <20200911132907.11748-1-buildroot@heine.tech>
Message-ID: <20200911132907.11748-2-buildroot@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patch release with two bugfixes
- fixes the list of dependencies of absl::Cord in the CMake build
- bug fix for absl::Status::ErasePayload

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/libabseil-cpp/libabseil-cpp.hash | 2 +-
 package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libabseil-cpp/libabseil-cpp.hash b/package/libabseil-cpp/libabseil-cpp.hash
index 7f0b5fc394..fef96833de 100644
--- a/package/libabseil-cpp/libabseil-cpp.hash
+++ b/package/libabseil-cpp/libabseil-cpp.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  728a813291bdec2aa46eab8356ace9f75ac2ed9dfe2df5ab603c4e6c09f1c353  libabseil-cpp-20200225.tar.gz
+sha256  f41868f7a938605c92936230081175d1eae87f6ea2c248f41077c8f88316f111  libabseil-cpp-20200225.2.tar.gz
 sha256  c79a7fea0e3cac04cd43f20e7b648e5a0ff8fa5344e644b0ee09ca1162b62747  LICENSE
diff --git a/package/libabseil-cpp/libabseil-cpp.mk b/package/libabseil-cpp/libabseil-cpp.mk
index 92cbb0051d..6ca33535eb 100644
--- a/package/libabseil-cpp/libabseil-cpp.mk
+++ b/package/libabseil-cpp/libabseil-cpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBABSEIL_CPP_VERSION = 20200225
+LIBABSEIL_CPP_VERSION = 20200225.2
 LIBABSEIL_CPP_SITE = $(call github,abseil,abseil-cpp,$(LIBABSEIL_CPP_VERSION))
 LIBABSEIL_CPP_LICENSE = Apache-2.0
 LIBABSEIL_CPP_LICENSE_FILES = LICENSE
-- 
2.25.1
