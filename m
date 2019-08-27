From: Petr Vorel <petr.vorel@gmail.com>
Date: Tue, 27 Aug 2019 20:43:05 +0200
Subject: [Buildroot] [PATCH] package/links: bump to version 2.19
Message-ID: <20190827184305.22730-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Tested:
$ ./utils/test-pkg -p links
                             br-arm-full [1/6]: OK
                  br-arm-cortex-a9-glibc [2/6]: OK
                   br-arm-cortex-m4-full [3/6]: SKIPPED
                          br-x86-64-musl [4/6]: OK
                      br-arm-full-static [5/6]: OK
                            sourcery-arm [6/6]: OK

 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index a63af4c808..190b41f7a2 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 f70d0678ef1c5550953bdc27b12e72d5de86e53b05dd59b0fc7f07c507f244b8  links-2.14.tar.bz2
+sha256 70758c7dd9bb70f045407900e0a90f1114947fce832c2f9bdefd5c0158089a0a  links-2.19.tar.bz2
diff --git a/package/links/links.mk b/package/links/links.mk
index 651a089fda..ad3af6c7ba 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.14
+LINKS_VERSION = 2.19
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
-- 
2.22.0
