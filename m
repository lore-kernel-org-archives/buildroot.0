From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 May 2019 09:23:31 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libopenssl:
 replace utf-8 quote by ascii single quote
Message-ID: <20190526072357.851CC7F88D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=69ca49d740f88c1e18b02624b63e2f25757ff104
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5006c8644904ffc9247325f7ee7e74cd4a37f807)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libopenssl/libopenssl.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index a845f1da53..c7bfebdd0a 100644
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
