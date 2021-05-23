From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 23 May 2021 17:55:34 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/bird: add
 BIRD_CPE_ID_VENDOR
Message-ID: <20210523160324.8AD7588091@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f6317d250b19e42f508412c55294cf327f3fbb70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:nic:bird is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Anic%3Abird

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit b68047e324e58078b03cbe697c206896d89f5acc)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bird/bird.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bird/bird.mk b/package/bird/bird.mk
index 6b28102754..b711e7de01 100644
--- a/package/bird/bird.mk
+++ b/package/bird/bird.mk
@@ -8,6 +8,7 @@ BIRD_VERSION = 2.0.7
 BIRD_SITE = ftp://bird.network.cz/pub/bird
 BIRD_LICENSE = GPL-2.0+
 BIRD_LICENSE_FILES = README
+BIRD_CPE_ID_VENDOR = nic
 BIRD_DEPENDENCIES = host-flex host-bison
 
 ifeq ($(BR2_PACKAGE_BIRD_CLIENT),y)
