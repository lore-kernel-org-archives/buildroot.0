From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Feb 2016 12:24:31 +0100
Subject: [Buildroot] [git commit branch/next] package/ca-certificates: bump
	version to 20160104
Message-ID: <20160225112534.C0C0B7FB72@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=30e991a0826f862c0b9b6e61fc498ca7358ef1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The following certificate authorities were added (+):
+ "CA WoSign ECC Root"
+ "Certification Authority of WoSign G2"
+ "Certinomis - Root CA"
+ "OISTE WISeKey Global Root GB CA"
+ "T??RKTRUST Elektronik Sertifika Hizmet Sa??lay??c??s?? H5"
+ "T??RKTRUST Elektronik Sertifika Hizmet Sa??lay??c??s?? H6"

The following certificate authorities were removed (-):
- "A-Trust-nQual-03"
- "Buypass Class 3 CA 1"
- "ComSign Secured CA"
- "Digital Signature Trust Co. Global CA 1"
- "Digital Signature Trust Co. Global CA 3"
- "SG TRUST SERVICES RACINE"
- "TC TrustCenter Class 2 CA II"
- "TC TrustCenter Universal CA I"
- "TURKTRUST Certificate Services Provider Root 1"
- "TURKTRUST Certificate Services Provider Root 2"
- "UTN DATACorp SGC Root CA"
- "Verisign Class 4 Public Primary Certification Authority - G3"

Signed-off-by: Martin Bark <martin@barkynet.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index 06120f5..b467316 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   c2d7ae81e28ff1f8a6b9ef7602c4e756ff08503c                         ca-certificates_20150426.tar.xz
-sha256 37dbaa93ed64cc4ae93ac295f9248fbc741bd51376438cfb1257f17efab5494f ca-certificates_20150426.tar.xz
+sha1   4525a194736c6691dbd59fa87281b722837b4768                         ca-certificates_20160104.tar.xz
+sha256 09eb770122e23260316120c0cbbddc8a1d33e7147210ce44e146084d5d5abcdd ca-certificates_20160104.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index b64120e..da1b70d 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20150426
+CA_CERTIFICATES_VERSION = 20160104
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20150528T221654Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20160104T220912Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
