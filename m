From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Oct 2014 11:26:30 +0200
Subject: [Buildroot] [git commit] package/ca-certificates: bump to 20141019,
	update snapshot date & hash
Message-ID: <20141025095905.83A06B13C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ac09a36c70dc3e663481978e62c39ce8cc4f8f09
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Karoly Kasza <kaszak@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ca-certificates/ca-certificates.hash |    4 ++--
 package/ca-certificates/ca-certificates.mk   |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index bcd0723..0165cb5 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   ad57a45f0422fafd78a2e8191e5204f2306cc91b                         ca-certificates_20140223.tar.xz
-sha256 815b7cd97200b0d76450bb3e7d9b65997ac494ab6467b17369f65b2ef94bcb0c ca-certificates_20140223.tar.xz
+sha1   6013ce6a3bf13e73a7e1feddcd17f5b2c09e5bd3                         ca-certificates_20141019.tar.xz
+sha256 684902d3f4e9ad27829f4af0d9d2d588afed03667997579b9c2be86fcd1eb73a ca-certificates_20141019.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index cd6a7f2..271985a 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20140223
+CA_CERTIFICATES_VERSION = 20141019
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20140325T163435Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20141023T043132Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
