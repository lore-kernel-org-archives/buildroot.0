From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jan 2021 21:49:02 +0100
Subject: [Buildroot] [git commit] package/tor: add TOR_CPE_ID_VENDOR
Message-ID: <20210118203943.55EDC818AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=685e9519b1bc066dd006da36cc29b1fe551f33db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

cpe:2.3:a:torproject:tor is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Atorproject%3Ator

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/tor/tor.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tor/tor.mk b/package/tor/tor.mk
index b7095aa39c..098c517aa7 100644
--- a/package/tor/tor.mk
+++ b/package/tor/tor.mk
@@ -8,6 +8,7 @@ TOR_VERSION = 0.4.4.6
 TOR_SITE = https://dist.torproject.org
 TOR_LICENSE = BSD-3-Clause
 TOR_LICENSE_FILES = LICENSE
+TOR_CPE_ID_VENDOR = torproject
 TOR_DEPENDENCIES = libevent openssl zlib
 TOR_AUTORECONF = YES
 
