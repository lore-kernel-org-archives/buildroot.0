From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 18 Mar 2016 22:02:50 +0100
Subject: [Buildroot] [git commit] quagga: bump to version 1.0.20160315
Message-ID: <20160318210641.8E0A0801D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aeb088b322fae460d4cbf0bef16874dbb186ddba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/quagga/quagga.hash | 2 +-
 package/quagga/quagga.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/quagga/quagga.hash b/package/quagga/quagga.hash
index fdc7472..23a0a82 100644
--- a/package/quagga/quagga.hash
+++ b/package/quagga/quagga.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	034e21f87164f44f1c4c89d8fafed4acede298fe3fafbf9277f079544178c66b	quagga-1.0.20160309.tar.xz
+sha256	d284af5dd875dbba90ab875d40db5d68fdc9ede17a76f2af525f85344be56767	quagga-1.0.20160315.tar.xz
diff --git a/package/quagga/quagga.mk b/package/quagga/quagga.mk
index 5f0d201..6b98367 100644
--- a/package/quagga/quagga.mk
+++ b/package/quagga/quagga.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QUAGGA_VERSION = 1.0.20160309
+QUAGGA_VERSION = 1.0.20160315
 QUAGGA_SOURCE = quagga-$(QUAGGA_VERSION).tar.xz
 QUAGGA_SITE = http://download.savannah.gnu.org/releases/quagga
 QUAGGA_DEPENDENCIES = host-gawk
