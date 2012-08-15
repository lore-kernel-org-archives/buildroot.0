From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:09 +0200
Subject: [Buildroot] [git commit] libcgicc: add license info
Message-ID: <20120815100417.E7A71971BC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=813c785853a64b767c0b9351b91c64e97d328779
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libcgicc/libcgicc.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/libcgicc/libcgicc.mk b/package/libcgicc/libcgicc.mk
index 98b8e5f..80e9213 100644
--- a/package/libcgicc/libcgicc.mk
+++ b/package/libcgicc/libcgicc.mk
@@ -6,6 +6,7 @@
 LIBCGICC_VERSION=3.2.9
 LIBCGICC_SITE=$(BR2_GNU_MIRROR)/cgicc
 LIBCGICC_SOURCE=cgicc-$(LIBCGICC_VERSION).tar.gz
+LIBCGICC_LICENSE=LGPLv3+
 LIBCGICC_INSTALL_STAGING=YES
 LIBCGICC_AUTORECONF=YES
 
