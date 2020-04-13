From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Apr 2020 22:37:27 +0200
Subject: [Buildroot] [git commit] package/unrar: bump version to 5.9.2
Message-ID: <20200413202355.7D5BC8EB57@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=daf8f36ca8b42a7c55771709bf1fb2edd712987d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://www.rarlab.com/rarnew.htm

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[yann.morin.1998 at free.fr: two spaces in hash file]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/unrar/unrar.hash | 4 ++--
 package/unrar/unrar.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/unrar/unrar.hash b/package/unrar/unrar.hash
index f688a4e364..9bfc32d325 100644
--- a/package/unrar/unrar.hash
+++ b/package/unrar/unrar.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	3591685c8f5bbcb0be09de3d0a0544adb88966b9cccb80986f6cd2b534fd91a6	unrarsrc-5.8.3.tar.gz
-sha256	6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a	license.txt
+sha256  73d3baf18cf0a197976af2794a848893c35e7d42cee0ff364c89d2e476ebdaa6  unrarsrc-5.9.2.tar.gz
+sha256  6ecc1687808b7d66b24f874755abfed7464d9751ed0001cd4e8e5d9bf397ff8a  license.txt
diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index cdaff26988..5c6f4b58da 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-UNRAR_VERSION = 5.8.3
+UNRAR_VERSION = 5.9.2
 UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = http://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
