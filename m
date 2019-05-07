From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 May 2019 22:57:15 +0200
Subject: [Buildroot] [git commit] package/libopenssl: replace utf-8 quote by
 ascii single quote
Message-ID: <20190507210157.CD4EC815D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5006c8644904ffc9247325f7ee7e74cd4a37f807
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name ???ucontext_t???
+#   crypto/async/arch/../arch/async_posix.h:32:5: error: unknown type name 'ucontext_t'
 #
 
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
