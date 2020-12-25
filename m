From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2020 22:17:30 +0100
Subject: [Buildroot] [git commit] package/uhubctl: bump to version 2.3.0
Message-ID: <20201225210046.363A886AE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4d30a8d3e8811816f6928a9e8ba34bc8b53009d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/uhubctl/uhubctl.hash | 2 +-
 package/uhubctl/uhubctl.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/uhubctl/uhubctl.hash b/package/uhubctl/uhubctl.hash
index c477301c78..c137088772 100644
--- a/package/uhubctl/uhubctl.hash
+++ b/package/uhubctl/uhubctl.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  e5a722cb41967903bedbab4eea566ab332241a7f05fc7bc9c386b9a5e1762d8b  uhubctl-2.2.0.tar.gz
+sha256  714f733592d3cb6ba8efc84fbc03b1beed2323918ff33aef01cdb956755be7b7  uhubctl-2.3.0.tar.gz
 sha256  2d3aa0737e8db9dfd710f9a282b446cb7b15b2b3eecac383f0c45c64d736eea0  LICENSE
diff --git a/package/uhubctl/uhubctl.mk b/package/uhubctl/uhubctl.mk
index 0633152cce..08efca092c 100644
--- a/package/uhubctl/uhubctl.mk
+++ b/package/uhubctl/uhubctl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UHUBCTL_VERSION = 2.2.0
+UHUBCTL_VERSION = 2.3.0
 UHUBCTL_SITE = $(call github,mvp,uhubctl,v$(UHUBCTL_VERSION))
 UHUBCTL_LICENSE = GPL-2.0
 UHUBCTL_LICENSE_FILES = LICENSE
