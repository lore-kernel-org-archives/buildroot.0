From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 30 Jan 2021 17:02:35 +0100
Subject: [Buildroot] [git commit] package/bitcoin: add CPE variables
Message-ID: <20210130160231.5949F85FBF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=70acf563aa297a58505cef025d8d45ba0ad9d83d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:bitcoin:bitcoin_core is a valid CPE identifier for this
package:

https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Abitcoin%3Abitcoin_core

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/bitcoin/bitcoin.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/bitcoin/bitcoin.mk b/package/bitcoin/bitcoin.mk
index cd127127b6..5f1684879c 100644
--- a/package/bitcoin/bitcoin.mk
+++ b/package/bitcoin/bitcoin.mk
@@ -9,6 +9,8 @@ BITCOIN_SITE = https://bitcoincore.org/bin/bitcoin-core-$(BITCOIN_VERSION)
 BITCOIN_AUTORECONF = YES
 BITCOIN_LICENSE = MIT
 BITCOIN_LICENSE_FILES = COPYING
+BITCOIN_CPE_ID_VENDOR = bitcoin
+BITCOIN_CPE_ID_PRODUCT = bitcoin_core
 BITCOIN_DEPENDENCIES = host-pkgconf boost libevent
 BITCOIN_MAKE_ENV = BITCOIN_GENBUILD_NO_GIT=1
 BITCOIN_CONF_OPTS = \
