From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 9 Jun 2015 22:42:16 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: bump version to
	20150426
Message-ID: <20150609204231.E22F681D8B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=09071d4a039ef332bfaa148e1f210a18a8d5ee82
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ca-certificates/ca-certificates.hash |    4 ++--
 package/ca-certificates/ca-certificates.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 0165cb5..06120f5 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   6013ce6a3bf13e73a7e1feddcd17f5b2c09e5bd3                         ca-certificates_20141019.tar.xz
-sha256 684902d3f4e9ad27829f4af0d9d2d588afed03667997579b9c2be86fcd1eb73a ca-certificates_20141019.tar.xz
+sha1   c2d7ae81e28ff1f8a6b9ef7602c4e756ff08503c                         ca-certificates_20150426.tar.xz
+sha256 37dbaa93ed64cc4ae93ac295f9248fbc741bd51376438cfb1257f17efab5494f ca-certificates_20150426.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 8fe26c9..b64120e 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20141019
+CA_CERTIFICATES_VERSION = 20150426
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20150528T221654Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
