From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 11 Nov 2016 16:36:12 +0100
Subject: [Buildroot] [git commit branch/next] netsniff-ng: bump to version
	0.6.2
Message-ID: <20161111154006.795B680DED@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f7afd935422ffd511a0e31827d56c6cb60aee23c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We recently released netsniff-ng 0.6.2 [1], bumpd the version accordingly.

[1] https://github.com/netsniff-ng/netsniff-ng/releases/tag/v0.6.2

Cc: Joris Lijssens <joris.lijssens@gmail.com>
Signed-off-by: Tobias Klauser <tklauser@distanz.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netsniff-ng/netsniff-ng.hash | 2 +-
 package/netsniff-ng/netsniff-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/netsniff-ng/netsniff-ng.hash b/package/netsniff-ng/netsniff-ng.hash
index 5212497..67b3331 100644
--- a/package/netsniff-ng/netsniff-ng.hash
+++ b/package/netsniff-ng/netsniff-ng.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 902661bcdbc129c6a6c1f69a72f921fffc9e765d005568dc153f09ca0097c180 netsniff-ng-v0.6.1.tar.gz
+sha256 62e8aa970a4f46cdaddf54daf8ea26e7ae9f9f358efaf0651799c8c4e937c286 netsniff-ng-v0.6.2.tar.gz
diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index ad97a88..4ec7e74 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETSNIFF_NG_VERSION = v0.6.1
+NETSNIFF_NG_VERSION = v0.6.2
 NETSNIFF_NG_SITE = $(call github,netsniff-ng,netsniff-ng,$(NETSNIFF_NG_VERSION))
 NETSNIFF_NG_LICENSE = GPLv2
 NETSNIFF_NG_LICENSE_FILES = README COPYING
