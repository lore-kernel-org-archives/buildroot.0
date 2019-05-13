From: aduskett at gmail.com <aduskett@gmail.com>
Date: Mon, 13 May 2019 15:26:22 -0400
Subject: [Buildroot] [PATCH 1/1] package/ca-certificates: bump to version
 20190110
Message-ID: <20190513192622.80031-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Also add a hash for the license file.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/ca-certificates/ca-certificates.hash | 7 +++++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 8100dde357..71a8da4784 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   edf0ec04b02fcbc90cc65906ff83fb042894a3b7                         ca-certificates_20180409.tar.xz
-sha256 7af6f5bfc619fd29cbf0258c1d95107c38ce840ad6274e343e1e0d971fc72b51 ca-certificates_20180409.tar.xz
+sha1   47d4584eae85fc905e4994766eb3930a8a84e2e1                         ca-certificates_20190110.tar.xz
+sha256 ee4bf0f4c6398005f5b5ca4e0b87b82837ac5c3b0280a1cb3a63c47555c3a675 ca-certificates_20190110.tar.xz
+
+# Locally computed
+sha256 80fd11117df5543d5cf17bfd951b0ead213f7867d0b09f09c6d5a5eca3ff7422 debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 5c259aa3ab..79c81a41ea 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20180409
+CA_CERTIFICATES_VERSION = 20190110
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20180411T111033Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20190513T145054Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
-- 
2.21.0
