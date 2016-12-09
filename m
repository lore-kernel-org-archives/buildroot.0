From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 9 Dec 2016 18:13:35 +0100
Subject: [Buildroot] [git commit] links: security bump to version 2.14
Message-ID: <20161209171846.7655E80102@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f4b9e87fdb6d06c07428650e6d414538dc3878c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/links/links.hash | 2 +-
 package/links/links.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/links/links.hash b/package/links/links.hash
index 2d9a7b3..a63af4c 100644
--- a/package/links/links.hash
+++ b/package/links/links.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 98411811ded1e8028f5aed708dd7d8ec0ae63ce24c2991a0241a989b7d09d84e  links-2.12.tar.bz2
+sha256 f70d0678ef1c5550953bdc27b12e72d5de86e53b05dd59b0fc7f07c507f244b8  links-2.14.tar.bz2
diff --git a/package/links/links.mk b/package/links/links.mk
index ab2b583..ce0e638 100644
--- a/package/links/links.mk
+++ b/package/links/links.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINKS_VERSION = 2.12
+LINKS_VERSION = 2.14
 LINKS_SOURCE = links-$(LINKS_VERSION).tar.bz2
 LINKS_SITE = http://links.twibright.com/download
 LINKS_DEPENDENCIES = host-pkgconf
