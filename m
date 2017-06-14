From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Jun 2017 21:38:25 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] gnutls: bump version to
	3.5.12
Message-ID: <20170614194701.CCF0E81DEE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aefd28447c055c2e5cfa3b7207b99a49ce793c8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

For details, see the release notes:

https://lists.gnupg.org/pipermail/gnutls-devel/2017-May/008427.html
https://lists.gnupg.org/pipermail/gnutls-devel/2017-April/008393.html

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit f8e1fdbe972b5b82b35b118e2fd7fce5e31d0de9)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.hash | 2 +-
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 64b86d7..8e2469a 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	af443e86ba538d4d3e37c4732c00101a492fe4b56a55f4112ff0ab39dbe6579d	gnutls-3.5.10.tar.xz
+sha256	63cb39a5eaa029381df2e49a74cfb7be89fc4a592445191818ffe1e66bde57cb	gnutls-3.5.12.tar.xz
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index be1cf00..e4937f1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.5
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).10
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).12
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPLv2.1+ (core library), GPLv3+ (gnutls-openssl library)
