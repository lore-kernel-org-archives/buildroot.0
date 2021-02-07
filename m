From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Feb 2021 10:30:43 +0100
Subject: [Buildroot] [git commit] package/cryptopp: add CPE variables
Message-ID: <20210207091616.3338A807E9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3658c1362b3c7423f23d6c7fd1c4874e21e1d64c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:cryptopp:crypto\+\+ is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&orderBy=2.3&keyword=cpe%3A2.3%3Aa%3Acryptopp%3Acrypto%5C%2B%5C%2B

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index c1b8aaa44c..1706108454 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -9,6 +9,8 @@ CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
 CRYPTOPP_LICENSE_FILES = License.txt
+CRYPTOPP_CPE_ID_VENDOR = cryptopp
+CRYPTOPP_CPE_ID_PRODUCT = crypto\+\+
 CRYPTOPP_INSTALL_STAGING = YES
 
 define HOST_CRYPTOPP_EXTRACT_CMDS
