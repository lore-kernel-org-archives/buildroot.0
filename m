From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 May 2017 23:41:22 +0200
Subject: [Buildroot] [PATCH/next 7/9] package/c-icap: bump version to 0.5.2
In-Reply-To: <20170521214124.20328-1-bernd.kuhls@t-online.de>
References: <20170521214124.20328-1-bernd.kuhls@t-online.de>
Message-ID: <20170521214124.20328-7-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/c-icap/c-icap.hash | 5 +++--
 package/c-icap/c-icap.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/c-icap/c-icap.hash b/package/c-icap/c-icap.hash
index 2b083ef65..38bbb5643 100644
--- a/package/c-icap/c-icap.hash
+++ b/package/c-icap/c-icap.hash
@@ -1,2 +1,3 @@
-# Locally calculated
-sha256 b138c7d7d9828d54c3307bcfe7b4917911266593832ffc26a60df9a0dfd2511e c_icap-0.4.2.tar.gz
+# From https://sourceforge.net/projects/c-icap/files/c-icap/0.5.x/
+md5 c0ad392336eb401d1630174cc67c0f71  c_icap-0.5.2.tar.gz
+sha1 fdb357eccbed37e0151a74a13430eec63dd76545  c_icap-0.5.2.tar.gz
diff --git a/package/c-icap/c-icap.mk b/package/c-icap/c-icap.mk
index dd1129e67..58127c151 100644
--- a/package/c-icap/c-icap.mk
+++ b/package/c-icap/c-icap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_VERSION = 0.4.2
+C_ICAP_VERSION = 0.5.2
 C_ICAP_SOURCE = c_icap-$(C_ICAP_VERSION).tar.gz
 C_ICAP_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_LICENSE = LGPL-2.1+
-- 
2.11.0
