From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Aug 2019 14:25:57 +0200
Subject: [Buildroot] [git commit] package/links: bump to version 2.19
Message-ID: <20190903133622.7985681413@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c31258e6e73c503100adc78e369916ea50821476
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
