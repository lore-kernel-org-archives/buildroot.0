From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:33 +0200
Subject: [Buildroot] [PATCH 04/69] cdrkit: add explicit dependencies for
	host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-5-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/cdrkit/cdrkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 2e4bb1fafef3..10d118c46a3e 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -8,6 +8,7 @@ CDRKIT_VERSION = 1.1.11
 CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
 CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
+HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
 
-- 
2.1.0
