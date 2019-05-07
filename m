From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  7 May 2019 22:35:24 +0200
Subject: [Buildroot] [PATCH v1 04/28] package/libopenssl: replace utf-8
 quote by ascii single quote
In-Reply-To: <20190507203548.10337-1-ps.report@gmx.net>
References: <20190507203548.10337-1-ps.report@gmx.net>
Message-ID: <20190507203548.10337-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 36623fa85f..b7eff06c80 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -39,7 +39,7 @@ endif
 #   ./libcrypto.so: undefined reference to `makecontext'
 #
 # - uclibc:
-#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ?ucontext_t?
+#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
 #

 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
--
2.21.0
