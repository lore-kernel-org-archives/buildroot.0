From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Aug 2012 12:03:19 +0200
Subject: [Buildroot] [git commit] libdnet: add license info
Message-ID: <20120815100418.29252971A4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=194f47baa76983c9fe3f4d0fc9a7cc6ad0598429
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdnet/libdnet.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index e622dd4..f6daffd 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -7,6 +7,8 @@
 LIBDNET_VERSION = 1.11
 LIBDNET_SOURCE = libdnet-$(LIBDNET_VERSION).tar.gz
 LIBDNET_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libdnet/
+LIBDNET_LICENSE = BSD-3c
+LIBDNET_LICENSE_FILES = LICENSE
 LIBDNET_INSTALL_STAGING = YES
 LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPT = \
