From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 19 May 2021 21:51:06 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/libuv: add
 LIBUV_CPE_ID_VENDOR
Message-ID: <20210519192210.3ADD588769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=722ab35b07854013c69464e443db1fe4794326e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

cpe:2.3:a:libuv:libuv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Alibuv%3Alibuv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 442b21f8cbda99576e9e77475bfdcbdc64283dff)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuv/libuv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libuv/libuv.mk b/package/libuv/libuv.mk
index 5876ab8935..403a049037 100644
--- a/package/libuv/libuv.mk
+++ b/package/libuv/libuv.mk
@@ -13,6 +13,7 @@ LIBUV_INSTALL_STAGING = YES
 LIBUV_AUTORECONF = YES
 LIBUV_LICENSE = BSD-2-Clause, BSD-3-Clause, ISC, MIT
 LIBUV_LICENSE_FILES = LICENSE
+LIBUV_CPE_ID_VENDOR = libuv
 
 # Upstream needs tests to be run sequentially. This is the default in
 # automake 1.11 and before, but not starting in 1.12. To maintain
