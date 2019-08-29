From: Petr Vorel <petr.vorel@gmail.com>
Date: Thu, 29 Aug 2019 22:02:12 +0200
Subject: [Buildroot] [PATCH] links: bump to version 2.20
Message-ID: <20190829200212.8659-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
New release come quickly after update.

Build tested:

./utils/test-pkg -p links
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK
6 builds, 1 skipped, 0 build failed, 0 legal-info failed

 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 190b41f7a2..971ed6308c 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 70758c7dd9bb70f045407900e0a90f1114947fce832c2f9bdefd5c0158089a0a  links-2.19.tar.bz2
+sha256 3bddcd4cb2f7647e50e12a59d1c9bda61076f15cde5f5dca6288b58314e6902d  links-2.20.tar.bz2
diff --git a/package/links/links.mk b/package/links/links.mk
index ad3af6c7ba..f37e1e88c1 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.19
+LINKS_VERSION = 2.20
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.22.1
