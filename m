From: Martin Bark <martin@barkynet.com>
Date: Tue, 30 Jan 2018 19:48:54 +0000
Subject: [Buildroot] [PATCH 1/2] ca-certificates: bump to version 20170717
Message-ID: <1517341735-18465-1-git-send-email-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index ecedba4..00296e2 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   b190ca8849697e842e69401b28d4ee27130d8c4d                         ca-certificates_20161130.tar.xz
-sha256 04bca9e142a90a834aca0311f7ced237368d71fee7bd5c9f68ef7f4611aee471 ca-certificates_20161130.tar.xz
+sha1   4c093ceee1f1428d5aa7e9a5324b92961c0c0f06                         ca-certificates_20170717.tar.xz
+sha256 e487639b641fa75445174734dd6e9d600373e3248b3d86a7e3c6d0f6977decd2 ca-certificates_20170717.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f712e79..cb0e961 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20161130
+CA_CERTIFICATES_VERSION = 20170717
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20161205T153846Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20170814T210836Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
-- 
2.7.4
