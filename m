From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 12 Dec 2018 00:55:11 -0200
Subject: [Buildroot] [PATCH] package/cryptopp: change site to https to avoid
 a redirection
Message-ID: <20181212025511.19211-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
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
-- 
2.19.2
