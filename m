From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Jul 2015 22:49:51 +0200
Subject: [Buildroot] [git commit] package/libdvbsi: remove autoreconf
Message-ID: <20150720205435.878E87FA54@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ca607498a6bc96f55765c985bad46095143e3691
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A configure script is bundled with the archive
of the current version.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libdvbsi/libdvbsi.mk |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/package/libdvbsi/libdvbsi.mk b/package/libdvbsi/libdvbsi.mk
index ed8b382..f6469f9 100644
--- a/package/libdvbsi/libdvbsi.mk
+++ b/package/libdvbsi/libdvbsi.mk
@@ -11,7 +11,4 @@ LIBDVBSI_INSTALL_STAGING = YES
 LIBDVBSI_LICENSE = LGPLv2.1
 LIBDVBSI_LICENSE_FILES = COPYING
 
-# sometimes no Makefile is in the archive, just (re)generate
-LIBDVBSI_AUTORECONF = YES
-
 $(eval $(autotools-package))
