From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 2 Jun 2015 22:45:59 +0200
Subject: [Buildroot] [git commit] gawk: bump to version 4.1.3
Message-ID: <20150602205021.AABF580187@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4e5ab5e54e3c5eed73a493bd83490b7118256f83
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/gawk.hash |    2 +-
 package/gawk/gawk.mk   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 8720031..7f746d8 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	ea8b53c5834ee27012fecba7273f97fca7104884975cf81ddae6f85c5581f481	gawk-4.1.2.tar.xz
+sha256	e3cf55e91e31ea2845f8338bedd91e40671fc30e4d82ea147d220e687abda625	gawk-4.1.3.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 653a5a0..1820689 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.2
+GAWK_VERSION = 4.1.3
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk $(if $(BR2_PACKAGE_MPFR),mpfr)
