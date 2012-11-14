From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:34:09 +0100
Subject: [Buildroot] [git commit] liblockfile: add license info
Message-ID: <20121114214728.0310299B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6e94083920c01ae1849703a0aa026ed369a85d42
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/liblockfile/liblockfile.mk |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/package/liblockfile/liblockfile.mk b/package/liblockfile/liblockfile.mk
index 037983e..84b0212 100644
--- a/package/liblockfile/liblockfile.mk
+++ b/package/liblockfile/liblockfile.mk
@@ -8,6 +8,9 @@ LIBLOCKFILE_SOURCE:=liblockfile_$(LIBLOCKFILE_VERSION).orig.tar.gz
 LIBLOCKFILE_SITE:=$(BR2_DEBIAN_MIRROR)/debian/pool/main/libl/liblockfile/
 LIBLOCKFILE_PATCH:=liblockfile_$(LIBLOCKFILE_VERSION)-4.debian.tar.bz2
 
+LIBLOCKFILE_LICENSE = LGPLv2+, dotlockfile GPLv2+
+# No license file included, it refers to the gnu.org website
+
 LIBLOCKFILE_INSTALL_STAGING = YES
 LIBLOCKFILE_CONF_OPT = --mandir=/usr/share/man
 
