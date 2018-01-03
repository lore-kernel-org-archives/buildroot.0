From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 21:09:23 +0100
Subject: [Buildroot] [PATCH v4 0/2] Opentracing-cpp: new package
Message-ID: <1515010165-25315-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Hi,

V4 of "this adds opentracing-cpp package as a logging library package."

Added generalisation of pkg-cmake stuff related to shared/static stuff

The included patch is already upstreamed and merged, but no new opentracing-cpp release was created yet.

br,

Jan

Jan Heylen (2):
  pkg-cmake: make BUILD_SHARED_LIBS part of generic cmake pkg logic
  opentracing-cpp: new package

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 16 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 14 ++++
 package/pkg-cmake.mk                               | 14 +++-
 package/rabbitmq-c/rabbitmq-c.mk                   |  8 ---
 8 files changed, 124 insertions(+), 9 deletions(-)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

-- 
2.7.4
