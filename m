From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 13 Dec 2018 21:38:41 +0100
Subject: [Buildroot] [git commit] package/cryptopp: change site to https to
 avoid a redirection
Message-ID: <20181213204234.EDB48842BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=08aa9c9008928e8b3f67ecca36335f0a2f9ef5a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index bc1f5a87a2..32b640cbed 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -6,7 +6,7 @@
 
 CRYPTOPP_VERSION = 7.0.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
-CRYPTOPP_SITE = http://cryptopp.com
+CRYPTOPP_SITE = https://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
