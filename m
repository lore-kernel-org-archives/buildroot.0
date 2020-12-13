From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:03:15 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/ca-certificates:
 bump version to 20200601
Message-ID: <20201213094828.D054E80E57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55bb3acdd0c7407742e461c3794ee2bb31034ccc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Reformatted hashes.

Updated license hash due to upstream commit:
https://salsa.debian.org/debian/ca-certificates/-/commit/1e2be69b0823dfb56dc3981b7547afd181e066cc

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit dae31592214d14f48ec967e5b78565c5e9bdc5cd)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.hash | 6 +++---
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 71a8da4784..1ed1c3ca06 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,6 +1,6 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   47d4584eae85fc905e4994766eb3930a8a84e2e1                         ca-certificates_20190110.tar.xz
-sha256 ee4bf0f4c6398005f5b5ca4e0b87b82837ac5c3b0280a1cb3a63c47555c3a675 ca-certificates_20190110.tar.xz
+sha1  f17235bc9c3aec538065a655681815c242a6d7d5  ca-certificates_20200601.tar.xz
+sha256  43766d5a436519503dfd65ab83488ae33ab4d4ca3d0993797b58c92eb9ed4e63  ca-certificates_20200601.tar.xz
 
 # Locally computed
-sha256 80fd11117df5543d5cf17bfd951b0ead213f7867d0b09f09c6d5a5eca3ff7422 debian/copyright
+sha256  e85e1bcad3a915dc7e6f41412bc5bdeba275cadd817896ea0451f2140a93967c  debian/copyright
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 79c81a41ea..5c24d4be49 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20190110
+CA_CERTIFICATES_VERSION = 20200601
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20190513T145054Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20200602T145955Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
