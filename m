From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 17 May 2021 19:33:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/links: bump version to 2.22
Message-ID: <20210517173359.19646-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index f941c2cd1b..156b73fb63 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  285eed8591c7781ec26213df82786665aaa1b9286782e8a7a1a7e2a6e1630d63  links-2.21.tar.bz2
+sha256  0364986b3a7f1e8e3171bea362b53f71e1dd3360a8842d66fdc65580ebc2084d  links-2.22.tar.bz2
 sha256  92deeb70791366630095d4e0714fe37d6e2bd5db0e6ef498ebb8de328f45b253  COPYING
diff --git a/package/links/links.mk b/package/links/links.mk
index 5213e02bd5..015878f892 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.21
+LINKS_VERSION = 2.22
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.31.1
