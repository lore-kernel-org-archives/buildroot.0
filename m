From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 4 Apr 2021 16:46:25 +0200
Subject: [Buildroot] [git commit] package/openmpi: drop unrecognized option
Message-ID: <20210404142106.BAA56866CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=210ec9c0d8a32b6ad399898de978348de7c252c4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--disable-vt has been dropped since version 2.0.0 and
https://github.com/open-mpi/ompi/commit/94190bf04b0877e878223a04c236443774e57ef2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openmpi/openmpi.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index b682e6e74e..8bdc3fa188 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -11,7 +11,6 @@ OPENMPI_SOURCE = openmpi-$(OPENMPI_VERSION).tar.bz2
 OPENMPI_LICENSE = BSD-3-Clause
 OPENMPI_LICENSE_FILES = LICENSE
 OPENMPI_INSTALL_STAGING = YES
-OPENMPI_CONF_OPTS = --disable-vt
 
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
