From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed,  4 Jan 2017 11:10:01 -0300
Subject: [Buildroot] [PATCH] ca-certificates: bump to version 20161130
Message-ID: <20170104141001.29487-1-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ca-certificates/ca-certificates.hash | 4 ++--
 package/ca-certificates/ca-certificates.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.hash b/package/ca-certificates/ca-certificates.hash
index b467316..ecedba4 100644
--- a/package/ca-certificates/ca-certificates.hash
+++ b/package/ca-certificates/ca-certificates.hash
@@ -1,3 +1,3 @@
 # hashes from: $(CA_CERTIFICATES_SITE)/ca-certificates_$(CA_CERTIFICATES_VERSION).dsc :
-sha1   4525a194736c6691dbd59fa87281b722837b4768                         ca-certificates_20160104.tar.xz
-sha256 09eb770122e23260316120c0cbbddc8a1d33e7147210ce44e146084d5d5abcdd ca-certificates_20160104.tar.xz
+sha1   b190ca8849697e842e69401b28d4ee27130d8c4d                         ca-certificates_20161130.tar.xz
+sha256 04bca9e142a90a834aca0311f7ced237368d71fee7bd5c9f68ef7f4611aee471 ca-certificates_20161130.tar.xz
diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index f26be64..d077a19 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20160104
+CA_CERTIFICATES_VERSION = 20161130
 CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20160104T220912Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20161205T153846Z/pool/main/c/ca-certificates
 CA_CERTIFICATES_DEPENDENCIES = host-openssl
 # ca-certificates can be built with either python 2 or python 3
 # but it must be at least python 2.7
-- 
2.10.2
