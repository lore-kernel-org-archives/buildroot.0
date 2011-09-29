From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 29 Sep 2011 12:42:33 +0200
Subject: [Buildroot] [PATCH] gnutls: bump to version 2.10.5
Message-ID: <1317292953-6329-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/gnutls/gnutls.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index db5d583..44a21b2 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-GNUTLS_VERSION = 2.10.3
+GNUTLS_VERSION = 2.10.5
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.bz2
 GNUTLS_SITE = http://ftp.gnu.org/gnu/gnutls/
 GNUTLS_DEPENDENCIES = libgcrypt
-- 
1.7.4.1
