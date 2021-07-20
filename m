From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Jul 2021 23:47:58 +0200
Subject: [Buildroot] [git commit] package/gerbera: bump to version 1.8.2
Message-ID: <20210720211443.9639A87316@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=d1a484a39547f307d799eaee9058bd75025e64da
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gerbera/gerbera.hash | 2 +-
 package/gerbera/gerbera.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index ab3dda917c..ed856bbf62 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  66f49ee30e53c36e08ce56a724f84bde8350001d3b9309f8e62a34f38446b619  gerbera-1.8.1.tar.gz
+sha256  b1e5591515f05a46de052ef4d95a2bb3387e96f565a5ce7abb6a77dbe581f09a  gerbera-1.8.2.tar.gz
 sha256  cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6  LICENSE.md
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 9627209d60..d6251912ac 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GERBERA_VERSION = 1.8.1
+GERBERA_VERSION = 1.8.2
 GERBERA_SITE = $(call github,gerbera,gerbera,v$(GERBERA_VERSION))
 GERBERA_LICENSE = GPL-2.0
 GERBERA_LICENSE_FILES = LICENSE.md
