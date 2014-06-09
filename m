From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 9 Jun 2014 11:54:02 +0200
Subject: [Buildroot] [git commit] isl: remove INSTALL_STAGING = YES
Message-ID: <20140609095505.ACF549CF77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=422060e6a11ccee8949677ecfbde56fbae36a8f7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is host-only, so there's no point in specifying
INSTALL_STAGING = YES.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/isl/isl.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 40e023f..2a630a4 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -12,7 +12,6 @@ ISL_SOURCE = isl-$(ISL_VERSION).tar.bz2
 ISL_SITE = http://isl.gforge.inria.fr/
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
-ISL_INSTALL_STAGING = YES
 ISL_DEPENDENCIES = gmp
 
 # Our libtool patch doesn't apply, and since this package is only
