From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 30 Aug 2017 21:28:53 +0200
Subject: [Buildroot] [PATCH/next 3/3] package/opus-tools: bump version to
	0.1.10
In-Reply-To: <20170830192853.24222-1-bernd.kuhls@t-online.de>
References: <20170830192853.24222-1-bernd.kuhls@t-online.de>
Message-ID: <20170830192853.24222-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/opus-tools/opus-tools.hash | 2 +-
 package/opus-tools/opus-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index 486384c31..185c94ce7 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	b1873dd78c7fbc98cf65d6e10cfddb5c2c03b3af93f922139a2104baedb4643a	opus-tools-0.1.9.tar.gz
+sha256 a2357532d19471b70666e0e0ec17d514246d8b3cb2eb168f68bb0f6fd372b28c  opus-tools-0.1.10.tar.gz
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 9b3953c8b..a81e75eb0 100644
--- a/package/opus-tools/opus-tools.mk
+++ b/package/opus-tools/opus-tools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPUS_TOOLS_VERSION = 0.1.9
-OPUS_TOOLS_SITE = http://downloads.xiph.org/releases/opus
+OPUS_TOOLS_VERSION = 0.1.10
+OPUS_TOOLS_SITE = https://downloads.xiph.org/releases/opus
 OPUS_TOOLS_LICENSE = BSD-2-Clause
 OPUS_TOOLS_LICENSE_FILES = COPYING
 OPUS_TOOLS_CONF_OPTS = --disable-oggtest --disable-opustest
-- 
2.11.0
