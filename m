From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2013 12:22:54 +0200
Subject: [Buildroot] [git commit] gnutls: security bump to version 3.2.5
Message-ID: <20131025103122.91C569BBB5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71af8d275c87812e295f1772dc8183a5ae96f989
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix for GNUTLS-SA-2013-3.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index 5a05f65..1e3e267 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GNUTLS_VERSION = 3.2.4
+GNUTLS_VERSION = 3.2.5
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = ftp://ftp.gnutls.org/gcrypt/gnutls/v3.2
 GNUTLS_LICENSE = GPLv3+ LGPLv2.1+
