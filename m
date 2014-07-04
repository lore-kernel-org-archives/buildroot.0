From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Jul 2014 15:38:05 +0200
Subject: [Buildroot] [git commit] lz4: security bump to r119
Message-ID: <20140704144657.79EC99D11E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=88e0ac73a8a3e82be944233e1a4d4249d229bc4b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes issue 134 - https://code.google.com/p/lz4/issues/detail?id=134
AKA CVE-2014-4611.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/lz4/lz4.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/lz4/lz4.mk b/package/lz4/lz4.mk
index a089b0e..819cc54 100644
--- a/package/lz4/lz4.mk
+++ b/package/lz4/lz4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LZ4_VERSION = r117
+LZ4_VERSION = r119
 LZ4_SITE = $(call github,Cyan4973,lz4,$(LZ4_VERSION))
 LZ4_INSTALL_STAGING = YES
 LZ4_LICENSE = BSD-2c
