From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 11 May 2021 09:52:15 +0200
Subject: [Buildroot] [git commit] package/gerbera: bump to version 1.8.1
Message-ID: <20210511072501.2775386F3C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b881d3689b577f76d7d39430d347d6b11f91c93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/gerbera/gerbera/releases/tag/v1.8.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index cdd1fbff60..ab3dda917c 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  02044abd1363c5f5604c5830e560b102ac456179afbf3be60e65847f47f4c599  gerbera-1.8.0.tar.gz
+sha256  66f49ee30e53c36e08ce56a724f84bde8350001d3b9309f8e62a34f38446b619  gerbera-1.8.1.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index b88fe8cc34..73917c7721 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.8.0
+GERBERA_VERSION = 1.8.1
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
