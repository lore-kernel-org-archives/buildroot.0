From: heiko.thiery at gmail.com <heiko.thiery@gmail.com>
Date: Tue,  1 Oct 2019 11:18:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/libssh: use host-xxx-package macros
Message-ID: <20191001091851.8021-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Thiery <heiko.thiery@kontron.com>

Signed-off-by: Heiko Thiery <heiko.thiery@kontron.com>
---
 package/libssh/libssh.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index b8464ed2bf..b90c52a2f3 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -43,3 +43,4 @@ LIBSSH_DEPENDENCIES += openssl
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
-- 
2.20.1
