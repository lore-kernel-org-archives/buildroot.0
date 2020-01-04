From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  4 Jan 2020 16:37:15 +0100
Subject: [Buildroot] [PATCH/2019.08.x 1/1] package/samba4: security version
 bump to 4.10.11
Message-ID: <20200104153715.3264323-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes

CVE-2019-14861: Samba AD DC zone-named record Denial of Service in DNS
                management server (dnsserver).
CVE-2019-14870: DelegationNotAllowed not being enforced in protocol
                transition on Samba AD DC.

Release notes:
https://www.samba.org/samba/history/samba-4.10.11.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/samba4/samba4.hash | 4 ++--
 package/samba4/samba4.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/samba4/samba4.hash b/package/samba4/samba4.hash
index 02220772f6..beaf187bf0 100644
--- a/package/samba4/samba4.hash
+++ b/package/samba4/samba4.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://download.samba.org/pub/samba/stable/samba-4.10.10.tar.asc
-sha256 700c734b51610e2feaa0d6744f9bec0c0d8917bca8cc78d5b63a4591f32866a5  samba-4.10.10.tar.gz
+# https://download.samba.org/pub/samba/stable/samba-4.10.11.tar.asc
+sha256 609f4232e04c6eaad0e3b8e00cd837683a960ebb95c1fe3349e968d1d1dff894  samba-4.10.11.tar.gz
 sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/samba4/samba4.mk b/package/samba4/samba4.mk
index c7910d87c8..91155128b9 100644
--- a/package/samba4/samba4.mk
+++ b/package/samba4/samba4.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SAMBA4_VERSION = 4.10.10
+SAMBA4_VERSION = 4.10.11
 SAMBA4_SITE = https://download.samba.org/pub/samba/stable
 SAMBA4_SOURCE = samba-$(SAMBA4_VERSION).tar.gz
 SAMBA4_INSTALL_STAGING = YES
-- 
2.20.1
