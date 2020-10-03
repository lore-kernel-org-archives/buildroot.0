From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  3 Oct 2020 10:20:43 +0200
Subject: [Buildroot] [PATCH 1/1] package/links: bump to version 2.21
Message-ID: <20201003082043.3004907-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update indentation in hash file (two spaces)

http://links.twibright.com/download/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/links/links.hash | 4 ++--
 package/links/links.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index a23adc087e..3176653f6f 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424  links-2.20.2.tar.bz2
-sha256 92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
+sha256  4b4f07d0e6261118d1365a5a5bfa31e1eafdbd280cfae6f0e9eedfea51a2f424  links-2.21.tar.bz2
+sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 228a8ed0ee..815b4dd733 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.20.2
+LINKS_VERSION = 2.21
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.28.0
