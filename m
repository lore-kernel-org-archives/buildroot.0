From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 07:54:00 -0300
Subject: [Buildroot] [PATCH 2/6] gnutls: bump to version 3.2.19
In-Reply-To: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413284044-20381-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1413284044-20381-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 22246c3..ca743a8 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	4762afab5e1b9e829c5f53d2b00cd5e41d43fa6d035efcf239e3fe0459134d45	gnutls-3.2.18.tar.xz
+sha256	a20d95a434a670afe5ce66430ae56151bbbe14456a0517ce775c46b1d4183dcf	gnutls-3.2.19.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 15f85e5..efc933e 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.2
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).18
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).19
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
-- 
2.0.4
