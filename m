From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Mar 2014 18:56:52 +0100
Subject: [Buildroot] [PATCH] package/ca-certificates: security bump to
	20140223
Message-ID: <1395770212-21932-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Some new CA added, some removed.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
Cc: Martin Bark <martin@barkynet.com>
---
 package/ca-certificates/ca-certificates.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index c975a7d..f7c27bd 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-CA_CERTIFICATES_VERSION = 20130906
-CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.gz
-CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20130907T154615Z/pool/main/c/ca-certificates
+CA_CERTIFICATES_VERSION = 20140223
+CA_CERTIFICATES_SOURCE = ca-certificates_$(CA_CERTIFICATES_VERSION).tar.xz
+CA_CERTIFICATES_SITE = http://snapshot.debian.org/archive/debian/20140325T163435Z/pool/main/c/ca-certificates/
 CA_CERTIFICATES_DEPENDENCIES = host-openssl host-python
 CA_CERTIFICATES_LICENSE = GPLv2+ (script), MPLv2.0 (data)
 CA_CERTIFICATES_LICENSE_FILES = debian/copyright
-- 
1.8.3.2
