From: Karoly Kasza <kaszak@gmail.com>
Date: Thu, 23 Oct 2014 16:48:35 +0200
Subject: [Buildroot] [PATCH 09/11] package/ca-certificates: bump to 20141019,
	update snapshot date & hash
In-Reply-To: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
References: <1414075717-7333-1-git-send-email-kaszak@gmail.com>
Message-ID: <1414075717-7333-10-git-send-email-kaszak@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Karoly Kasza <kaszak@gmail.com>
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
-- 
1.7.10.4
