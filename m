From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Aug 2015 14:42:08 +0200
Subject: [Buildroot] [git commit] package/libpfm4: bump to version 4.6.0
Message-ID: <20150901083107.180737F95A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8836186ef1eb059e115927c54a638ac558d51ce1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also use checksum from sourceforge.

[Thomas: re-add strong SHA256 locally calculated hash.]

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libpfm4/libpfm4.hash |    7 +++++--
 package/libpfm4/libpfm4.mk   |    2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/libpfm4/libpfm4.hash b/package/libpfm4/libpfm4.hash
index bc0ce52..8bebc49 100644
--- a/package/libpfm4/libpfm4.hash
+++ b/package/libpfm4/libpfm4.hash
@@ -1,2 +1,5 @@
-# Locally computed:
-sha256  a23eb9affbff279e13563a39317c0ad71c4de28908d4243c8bc109138430cc3b  libpfm-4.3.0.tar.gz
+# From http://sourceforge.net/projects/perfmon2/files/libpfm4/:
+sha1  2ed06d6e746f7b1cd4b70e9736e621052f60d625  libpfm-4.6.0.tar.gz
+md5  5077b9022440e4951d96f2d0e73bd487  libpfm-4.6.0.tar.gz
+# Locally calculated
+sha256  5ab1e5b0472550f9037a8800834f6bc3b927690070f69fac0b67284b4b05fd5f  libpfm-4.6.0.tar.gz
diff --git a/package/libpfm4/libpfm4.mk b/package/libpfm4/libpfm4.mk
index 1110672..9825002 100644
--- a/package/libpfm4/libpfm4.mk
+++ b/package/libpfm4/libpfm4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPFM4_VERSION = 4.3.0
+LIBPFM4_VERSION = 4.6.0
 LIBPFM4_SOURCE = libpfm-$(LIBPFM4_VERSION).tar.gz
 LIBPFM4_SITE = http://downloads.sourceforge.net/project/perfmon2/libpfm4
 LIBPFM4_LICENSE = libpfm4 license
