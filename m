From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Mar 2021 22:47:17 +0200
Subject: [Buildroot] [git commit] package/libnetconf2: bump version to 1.1.43
Message-ID: <20210328202237.5E7E688529@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5d18a473c44cb253cdaf86f2f6550093748a7c5d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libnetconf2/libnetconf2.hash | 2 +-
 package/libnetconf2/libnetconf2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libnetconf2/libnetconf2.hash b/package/libnetconf2/libnetconf2.hash
index a20e31e8d3..24cc3a5557 100644
--- a/package/libnetconf2/libnetconf2.hash
+++ b/package/libnetconf2/libnetconf2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  17aa551380ffcccc3bfd928edbcc170cbe85b0f336b361d5f03ede8f3e5f6348  libnetconf2-1.1.36.tar.gz
+sha256  66139fc9e68aa89c82235f4135dba9e44f5db663541279c14c74131e22b7f571  libnetconf2-1.1.43.tar.gz
 sha256  bd962ab457c8a8cb8faaaa36c11484680f3c9a47dbc336507817ae8935384064  LICENSE
diff --git a/package/libnetconf2/libnetconf2.mk b/package/libnetconf2/libnetconf2.mk
index 770188df91..40fa935bb1 100644
--- a/package/libnetconf2/libnetconf2.mk
+++ b/package/libnetconf2/libnetconf2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNETCONF2_VERSION = 1.1.36
+LIBNETCONF2_VERSION = 1.1.43
 LIBNETCONF2_SITE = $(call github,CESNET,libnetconf2,v$(LIBNETCONF2_VERSION))
 LIBNETCONF2_INSTALL_STAGING = YES
 LIBNETCONF2_LICENSE = BSD-3-Clause
