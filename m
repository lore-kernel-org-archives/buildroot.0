From: Jan Heylen <heyleke@gmail.com>
Date: Wed,  3 Jan 2018 09:52:22 +0100
Subject: [Buildroot] [PATCH v3 0/1] Opentracing-cpp: new package
In-Reply-To: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
References: <1514014802-23736-2-git-send-email-heyleke@gmail.com>
Message-ID: <1514969543-20452-1-git-send-email-heyleke@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jan Heylen <jan.heylen@nokia.com>

Hi,

V3 of "this adds opentracing-cpp package as a logging library package."

The included patch is already upstreamed and merged, but no new opentracing-cpp release was created yet.

br,

Jan

Jan Heylen (1):
  opentracing-cpp: new package

 DEVELOPERS                                         |  3 +
 package/Config.in                                  |  1 +
 ...shared-static-target-a-configurable-optio.patch | 74 ++++++++++++++++++++++
 package/opentracing-cpp/Config.in                  | 16 +++++
 package/opentracing-cpp/opentracing-cpp.hash       |  3 +
 package/opentracing-cpp/opentracing-cpp.mk         | 22 +++++++
 6 files changed, 119 insertions(+)
 create mode 100644 package/opentracing-cpp/0001-CMake-make-shared-static-target-a-configurable-optio.patch
 create mode 100644 package/opentracing-cpp/Config.in
 create mode 100644 package/opentracing-cpp/opentracing-cpp.hash
 create mode 100644 package/opentracing-cpp/opentracing-cpp.mk

-- 
2.7.4
