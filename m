From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Sep 2015 19:46:24 +0200
Subject: [Buildroot] [git commit] libssh: indentation cleanup in .mk file
Message-ID: <20150929174639.9E97A81D5B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2afd37dc82969805536c7aeeb47f8784a0b52312
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libssh/libssh.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

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
