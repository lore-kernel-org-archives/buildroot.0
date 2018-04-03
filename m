From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Apr 2018 22:43:55 +0200
Subject: [Buildroot] [git commit] openal: Bump to version 1.18.2
Message-ID: <20180403204608.C37C983D95@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7f4deda135c23e83f255340fd3620b83eea81b8c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openal/openal.hash | 2 +-
 package/openal/openal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openal/openal.hash b/package/openal/openal.hash
index aead6e15b8..cb41dc4e12 100644
--- a/package/openal/openal.hash
+++ b/package/openal/openal.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256 2d51a6529526ef22484f51567e31a5c346a599767991a3dc9d4dcd9d9cec71dd  openal-soft-1.18.1.tar.bz2
+sha256 9f8ac1e27fba15a59758a13f0c7f6540a0605b6c3a691def9d420570506d7e82  openal-soft-1.18.2.tar.bz2
diff --git a/package/openal/openal.mk b/package/openal/openal.mk
index 439f5f109d..c687c08be1 100644
--- a/package/openal/openal.mk
+++ b/package/openal/openal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENAL_VERSION = 1.18.1
+OPENAL_VERSION = 1.18.2
 OPENAL_SOURCE = openal-soft-$(OPENAL_VERSION).tar.bz2
 OPENAL_SITE = http://kcat.strangesoft.net/openal-releases
 OPENAL_LICENSE = LGPL-2.0+
