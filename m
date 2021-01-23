From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jan 2021 21:29:24 +0100
Subject: [Buildroot] [git commit] package/zeromq: add CPE variables
Message-ID: <20210123200953.51BDE81478@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a173b666383792466be42c95e3b6b2b2aa3268f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:zeromq:libzmq is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Azeromq%3Alibzmq

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/zeromq/zeromq.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/zeromq/zeromq.mk b/package/zeromq/zeromq.mk
index fa72a41f23..182699403c 100644
--- a/package/zeromq/zeromq.mk
+++ b/package/zeromq/zeromq.mk
@@ -11,6 +11,8 @@ ZEROMQ_DEPENDENCIES = util-linux
 ZEROMQ_CONF_OPTS = --disable-Werror --without-documentation
 ZEROMQ_LICENSE = LGPL-3.0+ with exceptions
 ZEROMQ_LICENSE_FILES = COPYING COPYING.LESSER
+ZEROMQ_CPE_ID_VENDOR = zeromq
+ZEROMQ_CPE_ID_PRODUCT = libzmq
 
 # Assume these flags are always available. It is true, at least for
 # SOCK_CLOEXEC, since linux v2.6.27.
