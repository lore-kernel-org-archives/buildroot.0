From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 26 Oct 2019 20:46:39 +0200
Subject: [Buildroot] [git commit] package/bison: bump version to 3.4.2
Message-ID: <20191026184456.859D07F8C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=028e77cd0d6f99544728216bb5796b436b0f22fc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://savannah.gnu.org/forum/forum.php?forum_id=9554

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bison/bison.hash | 2 +-
 package/bison/bison.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bison/bison.hash b/package/bison/bison.hash
index a98ed6c89a..01ee17d76e 100644
--- a/package/bison/bison.hash
+++ b/package/bison/bison.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256	27159ac5ebf736dffd5636fd2cd625767c9e437de65baa63cb0de83570bd820d	bison-3.4.1.tar.xz
+sha256	27d05534699735dc69e86add5b808d6cb35900ad3fd63fa82e3eb644336abfa0	bison-3.4.2.tar.xz
 # License files, locally calculated
 sha256	8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903	COPYING
diff --git a/package/bison/bison.mk b/package/bison/bison.mk
index 32ffa3aec9..2174a9061c 100644
--- a/package/bison/bison.mk
+++ b/package/bison/bison.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BISON_VERSION = 3.4.1
+BISON_VERSION = 3.4.2
 BISON_SOURCE = bison-$(BISON_VERSION).tar.xz
 BISON_SITE = $(BR2_GNU_MIRROR)/bison
 BISON_LICENSE = GPL-3.0+
