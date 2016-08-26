From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Aug 2016 22:53:46 +0200
Subject: [Buildroot] [git commit branch/next] gawk: bump to version 4.1.4
Message-ID: <20160826205354.984948230D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=67db45a9fb5f78a175b67cac56be1eafb1c5a9e9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gawk/gawk.hash | 2 +-
 package/gawk/gawk.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gawk/gawk.hash b/package/gawk/gawk.hash
index 7f746d8..e2c7806 100644
--- a/package/gawk/gawk.hash
+++ b/package/gawk/gawk.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	e3cf55e91e31ea2845f8338bedd91e40671fc30e4d82ea147d220e687abda625	gawk-4.1.3.tar.xz
+sha256	53e184e2d0f90def9207860531802456322be091c7b48f23fdc79cda65adc266	gawk-4.1.4.tar.xz
diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index b5b0f8d..7c6689b 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GAWK_VERSION = 4.1.3
+GAWK_VERSION = 4.1.4
 GAWK_SOURCE = gawk-$(GAWK_VERSION).tar.xz
 GAWK_SITE = $(BR2_GNU_MIRROR)/gawk
 GAWK_DEPENDENCIES = host-gawk
