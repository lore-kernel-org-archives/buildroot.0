From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 10 Jun 2021 22:17:30 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/chrony: add
 CHRONY_CPE_ID_VENDOR
Message-ID: <20210610194754.08A197FF07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f22f59961f0409b14163647b6a9445101fcbabac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:tuxfamily:chrony is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atuxfamily%3Achrony

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 7a7cb59ced04f74448c6dc2d07bbe66164fc3d7b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/chrony/chrony.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index ef459ad38b..b73ddb56b2 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -8,6 +8,7 @@ CHRONY_VERSION = 4.0
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
+CHRONY_CPE_ID_VENDOR = tuxfamily
 CHRONY_DEPENDENCIES = host-pkgconf
 
 CHRONY_CONF_OPTS = \
