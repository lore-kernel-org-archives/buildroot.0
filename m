From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 16 Jun 2016 23:03:50 +0200
Subject: [Buildroot] [git commit] wine: Bump to version 1.8.3
Message-ID: <20160616210401.7EDAA81D77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78eda27f898c01adee9d219238bca315b4aa3ea5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bumping to stable version 1.8.3

Signed-off-by: Andr?? Hentschel <nerv@dawncrow.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wine/wine.hash | 2 +-
 package/wine/wine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/wine/wine.hash b/package/wine/wine.hash
index b4eec49..3f856ba 100644
--- a/package/wine/wine.hash
+++ b/package/wine/wine.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256 51624fadf0145e87f0c01e7ce8524ea1e8d9d360c3e8a86e78cd26a52ce55a6f wine-1.8.2.tar.bz2
+sha256 d7cecdf7aab93bfe950e6f83ec526681b8770788c7b2a802bfe50ff97fc17a6c wine-1.8.3.tar.bz2
diff --git a/package/wine/wine.mk b/package/wine/wine.mk
index 7587cb0..632eed3 100644
--- a/package/wine/wine.mk
+++ b/package/wine/wine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WINE_VERSION = 1.8.2
+WINE_VERSION = 1.8.3
 WINE_SOURCE = wine-$(WINE_VERSION).tar.bz2
 WINE_SITE = https://dl.winehq.org/wine/source/1.8
 WINE_LICENSE = LGPLv2.1+
