From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Sep 2019 23:07:57 +0200
Subject: [Buildroot] [git commit] package/unrar: bump version to 5.8.2
Message-ID: <20190930210314.7611883CCD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=698797f0ee141bccf15ec0cce3bfeaeb2d4b32fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unrar/unrar.hash | 2 +-
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index 95acb85763..7f9bb865c8 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	9335d2201870f2034007c04be80e00f1dc23932cb88b329d55c76134e6ba49fe	unrarsrc-5.6.4.tar.gz
+sha256	33386623fd3fb153b56292df4a6a69b457e69e1803b6d07b614e5fd22fb33dda	unrarsrc-5.8.2.tar.gz
 sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index 75e9329903..942f52b031 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.6.4
+UNRAR_VERSION = 5.8.2
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
