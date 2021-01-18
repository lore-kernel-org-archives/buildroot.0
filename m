From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 22:26:28 +0100
Subject: [Buildroot] [git commit] package/unzip: make version compliant with
 release-monitoring
Message-ID: <20210118210722.0B89388518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d6da9d1d292f90ddf4806d99ebb030f233139ee8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unzip/unzip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
index 1d972055de..d435fb6b5d 100644
--- a/package/unzip/unzip.mk
+++ b/package/unzip/unzip.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-UNZIP_VERSION = 60
-UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
+UNZIP_VERSION = 6.0
+UNZIP_SOURCE = unzip$(subst .,,$(UNZIP_VERSION)).tgz
 UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
 UNZIP_LICENSE = Info-ZIP
 UNZIP_LICENSE_FILES = LICENSE
