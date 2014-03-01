From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 17:13:30 +0100
Subject: [Buildroot] [git commit] php: fix typo
Message-ID: <20140301161338.425B29936D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ff1538579ed15cc9c682f8131463b43240399ab
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/php/php.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/php/php.mk b/package/php/php.mk
index f01e131..c5da9e7 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -126,7 +126,7 @@ ifeq ($(BR2_PACKAGE_PHP_EXT_INTL),y)
 	# The intl module is implemented in C++, but PHP fails to use
 	# g++ as the compiler for the final link. As a workaround,
 	# tell it to link libstdc++.
-	PHP_EXTRA_LIBS + = -lstdc++
+	PHP_EXTRA_LIBS += -lstdc++
 endif
 
 ifeq ($(BR2_PACKAGE_PHP_EXT_GMP),y)
