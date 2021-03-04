From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Mar 2021 19:55:29 +0100
Subject: [Buildroot] [git commit] package/gnuchess: add CPE variables
Message-ID: <20210304183429.135ED81520@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=043a23a6b7692d6a54dd831857356782f00094a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:gnu:chess is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Agnu%3Achess

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/gnuchess/gnuchess.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/gnuchess/gnuchess.mk b/package/gnuchess/gnuchess.mk
index 4d91706de4..e386556c9f 100644
--- a/package/gnuchess/gnuchess.mk
+++ b/package/gnuchess/gnuchess.mk
@@ -8,6 +8,8 @@ GNUCHESS_VERSION = 6.2.5
 GNUCHESS_SITE = $(BR2_GNU_MIRROR)/chess
 GNUCHESS_LICENSE = GPL-3.0+
 GNUCHESS_LICENSE_FILES = COPYING
+GNUCHESS_CPE_ID_VENDOR = gnu
+GNUCHESS_CPE_ID_PRODUCT = chess
 
 GNUCHESS_DEPENDENCIES = host-flex flex
 GNUCHESS_DEPENDENCIES += $(if $(BR2_PACKAGE_READLINE),readline) \
