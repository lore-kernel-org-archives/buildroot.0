From: Jan Heylen <heyleke@gmail.com>
Date: Thu,  4 Jan 2018 13:28:27 +0100
Subject: [Buildroot] [PATCH v6 0/4] Opentracing-cpp: new package
Message-ID: <1515068911-21112-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Hi,

V6 of "this adds opentracing-cpp package as a logging library package."

added a patch for m68k cf toolchains suffering from BR2_TOOLCHAIN_HAS_GCC_BUG_64735

br,

Jan

Jan Heylen (4):
  rabbitmq-c: BUILD_SHARED_LIBS is handled in pkg-cmake.mk
  pkg-cmake: add note on BUILD_STATIC_LIBS
  m68k_cf5208: suffers from gcc 64735
  opentracing-cpp: new package

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 15 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 25 ++++++++
 package/pkg-cmake.mk                               |  9 +++
 package/rabbitmq-c/rabbitmq-c.mk                   |  7 +-
 toolchain/toolchain-common.in                      |  1 +
 9 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

-- 
2.7.4
