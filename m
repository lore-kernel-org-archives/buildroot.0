From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 2 Aug 2019 22:48:00 +0200
Subject: [Buildroot] [git commit] package/quagga: bump to version 1.2.4
Message-ID: <20190802205213.9A7ED8D1E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5b169afaa4fdf06041e1ac896f618363e92ad4fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.hash | 2 +-
 package/quagga/quagga.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index 93fc42c8fc..293cee4d59 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	ee2c0907a106902abbdcaf63b4f28c67241c4f3396989ed54da7b4976eecad31	quagga-1.2.3.tar.gz
+sha256	e364c082c3309910e1eb7b068bf39ee298e2f2f3f31a6431a5c115193bd653d3	quagga-1.2.4.tar.gz
 
 # Hash for license file
 sha256	b39c1bad4e51e2a3389cd25fc4addebe41a3ae7c11100795683f9330de1536e5	COPYING
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 8aa58aceef..9092e7cbdc 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 1.2.3
+QUAGGA_VERSION = 1.2.4
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk host-pkgconf
 QUAGGA_LICENSE = GPL-2.0+
