From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 20 Jan 2013 20:33:08 +0100
Subject: [Buildroot] [git commit] cdrkit: add license informations
Message-ID: <20130120202430.204BA7FDE2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b5dd26cbdae24d366fb9854a5af265a77c71da5e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/cdrkit/cdrkit.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/cdrkit/cdrkit.mk b/package/cdrkit/cdrkit.mk
index ce89bc7..bade956 100644
--- a/package/cdrkit/cdrkit.mk
+++ b/package/cdrkit/cdrkit.mk
@@ -7,6 +7,8 @@
 CDRKIT_VERSION = 1.1.11
 CDRKIT_SITE = http://www.cdrkit.org/releases
 CDRKIT_DEPENDENCIES = libcap bzip2 zlib
+CDRKIT_LICENSE = GPLv2
+CDRKIT_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_ENDIAN),"BIG")
 CMAKE_ENDIAN_OPT=-DBITFIELDS_HTOL=1
