From: Jan Heylen <heyleke@gmail.com>
Date: Sat, 23 Dec 2017 08:40:00 +0100
Subject: [Buildroot] [PATCH v2 0/2] Opentracing-cpp: new package
In-Reply-To: <1513849309-550-2-git-send-email-heyleke@gmail.com>
References: <1513849309-550-2-git-send-email-heyleke@gmail.com>
Message-ID: <1514014802-23736-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Hi,

this adds opentracing-cpp package as a logging library package.

Extra patch included to make shared/static target configurable.

Upstream of that patch is ongoing:
https://github.com/opentracing/opentracing-cpp/pull/46

br,

Jan

Jan Heylen (2):
  Opentracing: add opentracing-cpp v1.2.0 package
  opentracing-cpp: make shared/static target a configurable option

 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 73 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 11 ++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 22 +++++++
 5 files changed, 110 insertions(+)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

-- 
2.7.4
