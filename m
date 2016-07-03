From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 21:16:36 +0200
Subject: [Buildroot] [git commit] cdrkit: add explicit dependencies for host
	variant
Message-ID: <20160703191643.0318B81767@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=985ec224d38e5db73f619329e3a8d869c66c9067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cdrkit/cdrkit.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index 2e4bb1f..10d118c 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -8,6 +8,7 @@ CDRKIT_VERSION = 1.1.11
 CDRKIT_SOURCE = cdrkit_$(CDRKIT_VERSION).orig.tar.gz
 CDRKIT_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/cdrkit
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
+HOST_CDRKIT_DEPENDENCIES = host-libcap host-bzip2 host-zlib
 CDRKIT_LICENSE = GPLv2
 CDRKIT_LICENSE_FILES = COPYING
 
