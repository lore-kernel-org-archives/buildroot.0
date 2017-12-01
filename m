From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 1 Dec 2017 22:12:45 +0100
Subject: [Buildroot] [git commit] lttng-tools: bump to version 2.10.1
Message-ID: <20171201211219.4957D7FF8D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4ce9345d9d54c0d4683d7f347c62ed505bcb67fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/lttng-tools/lttng-tools.hash | 6 +++---
 package/lttng-tools/lttng-tools.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 8a4c2eb..5174252 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.5.tar.bz2.{md5,sha1}
-md5 051224eb991aee07f8721ff1877d0b96  lttng-tools-2.9.5.tar.bz2
-sha1 b988b237f34baa3916242dc9141aa61470e99dfd  lttng-tools-2.9.5.tar.bz2
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.10.1.tar.bz2.{md5,sha1}
+md5 fd80fa64dffd8017fb30836eb30532cc  lttng-tools-2.10.1.tar.bz2
+sha1 b29554903160dc1c89b41c85493fd968de0e624f  lttng-tools-2.10.1.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 451f652..59f64cc 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.9.5
+LTTNG_TOOLS_VERSION = 2.10.1
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
