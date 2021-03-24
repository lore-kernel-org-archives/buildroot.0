From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Mar 2021 14:07:24 +0100
Subject: [Buildroot] [git commit branch/2021.02.x] package/doxygen: add
 DOXYGEN_CPE_ID_VENDOR
Message-ID: <20210324133906.86B11890A2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9cc277222b5a285521283909f788ed080e9ccd2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:doxygen:doxygen is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Adoxygen%3Adoxygen

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 44b76cc49f698f2be250d8b18f308479528b04eb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/doxygen/doxygen.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/doxygen/doxygen.mk b/package/doxygen/doxygen.mk
index ee8ae4fde4..b24c527a20 100644
--- a/package/doxygen/doxygen.mk
+++ b/package/doxygen/doxygen.mk
@@ -9,6 +9,7 @@ DOXYGEN_SOURCE = doxygen-$(DOXYGEN_VERSION).src.tar.gz
 DOXYGEN_SITE = http://doxygen.nl/files
 DOXYGEN_LICENSE = GPL-2.0
 DOXYGEN_LICENSE_FILES = LICENSE
+DOXYGEN_CPE_ID_VENDOR = doxygen
 HOST_DOXYGEN_DEPENDENCIES = host-flex host-bison
 
 HOST_DOXYGEN_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
