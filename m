From: Joachim Wiberg <troglobit@gmail.com>
Date: Mon,  8 Mar 2021 14:27:40 +0100
Subject: [Buildroot] [PATCH 1/2] package/sysklogd: bump to version 2.2.2
In-Reply-To: <20210308132742.4022471-1-troglobit@gmail.com>
References: <20210308132742.4022471-1-troglobit@gmail.com>
Message-ID: <20210308132742.4022471-2-troglobit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://github.com/troglobit/sysklogd/releases/tag/v2.2.2

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/sysklogd/sysklogd.hash | 2 +-
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index ec14363d9f..0ef5e17116 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a93b7ad6a615336f030d8a3257544cff1644908af6a12c65f65482f27bd39ca9  sysklogd-2.2.1.tar.gz
+sha256  2752a693a2486f7e532b6b028296c8ac0a97def8a4848f1e915f3e583fd0b4b6  sysklogd-2.2.2.tar.gz
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index ea7b869d7b..0110974069 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.1
+SYSKLOGD_VERSION = 2.2.2
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
-- 
2.25.1
