From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 17:02:44 +0200
Subject: [Buildroot] [git commit] package/cryptopp: replace utf-8 space by
 ascii character
Message-ID: <20190507145846.305E08830A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=695f20cd0c92bd68bf771dc07751335519b40875
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Replace utf-8 NO-BREAK-SPACE (c2 a0) in comment line by simple
ascii space character.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cryptopp/cryptopp.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 3a9f621c67..f1d19386ab 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -17,7 +17,7 @@ endef
 
 HOST_CRYPTOPP_CXXFLAGS = $(HOST_CFLAGS) -fPIC
 
-#??_mm256_broadcastsi128_si256 has been added only in gcc 4.9
+# _mm256_broadcastsi128_si256 has been added only in gcc 4.9
 ifneq ($(BR2_HOST_GCC_AT_LEAST_4_9),y)
 HOST_CRYPTOPP_CXXFLAGS += -DCRYPTOPP_DISABLE_AVX2
 endif
