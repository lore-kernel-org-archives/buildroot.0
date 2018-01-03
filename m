From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 22:20:08 +0100
Subject: [Buildroot] [PATCH v5 0/3] Opentracing-cpp: new package
Message-ID: <1515014411-3504-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Hi,

V5 of "this adds opentracing-cpp package as a logging library package."

Removed generalisation of pkg-cmake stuff related to shared/static stuff again and added note in pkg-cmake.mk why.

br,

Jan

Jan Heylen (3):
  rabbitmq-c: BUILD_SHARED_LIBS is handled in pkg-cmake.mk
  pkg-cmake: add note on BUILD_STATIC_LIBS
  opentracing-cpp: new package

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 16 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 25 ++++++++
 package/pkg-cmake.mk                               |  9 +++
 package/rabbitmq-c/rabbitmq-c.mk                   |  7 +-
 8 files changed, 135 insertions(+), 3 deletions(-)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

-- 
2.7.4
