From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Aug 2017 22:14:00 +0200
Subject: [Buildroot] [git commit] package/opus-tools: bump version to 0.1.10
Message-ID: <20170902130620.AD6988016A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a1e9fa24e12e2cb529717b24e1a6b7dbd23d7a72
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch upstream URL to https.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opus-tools/opus-tools.hash | 2 +-
 package/opus-tools/opus-tools.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/opus-tools/opus-tools.hash b/package/opus-tools/opus-tools.hash
index 486384c..185c94c 100644
--- a/package/opus-tools/opus-tools.hash
+++ b/package/opus-tools/opus-tools.hash
@@ -1,2 +1,2 @@
 # From http://downloads.xiph.org/releases/opus/SHA256SUMS.txt
-sha256	b1873dd78c7fbc98cf65d6e10cfddb5c2c03b3af93f922139a2104baedb4643a	opus-tools-0.1.9.tar.gz
+sha256 a2357532d19471b70666e0e0ec17d514246d8b3cb2eb168f68bb0f6fd372b28c  opus-tools-0.1.10.tar.gz
diff --git a/package/opus-tools/opus-tools.mk b/package/opus-tools/opus-tools.mk
index 9b3953c..a81e75e 100644
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
