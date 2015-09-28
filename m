From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 28 Sep 2015 23:27:23 +0200
Subject: [Buildroot] [PATCH 3/4] libssh/libssh.mk:indentation cleanup
In-Reply-To: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1443475644-5320-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1443475644-5320-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libssh/libssh.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 68438b9..cd537b0 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -12,9 +12,9 @@ LIBSSH_LICENSE_FILES = COPYING
 LIBSSH_INSTALL_STAGING = YES
 LIBSSH_SUPPORTS_IN_SOURCE_BUILD = NO
 LIBSSH_CONF_OPTS = \
-        -DWITH_STACK_PROTECTOR=OFF \
-        -DWITH_SERVER=OFF \
-        -DWITH_EXAMPLES=OFF
+	-DWITH_STACK_PROTECTOR=OFF \
+	-DWITH_SERVER=OFF \
+	-DWITH_EXAMPLES=OFF
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 LIBSSH_CONF_OPTS += -DWITH_ZLIB=ON
-- 
1.9.1
