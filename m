From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 12 Apr 2014 14:42:09 +0200
Subject: [Buildroot] [PATCH 1/1] package/pkg-python.mk: Fix typo
Message-ID: <1397306529-20187-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/pkg-python.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index c78915e..d6786a3 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -183,7 +183,7 @@ endif
 
 # Python interpreter to use for building the package.
 #
-# We may want to specify the python interpreter toi be used for building a
+# We may want to specify the python interpreter to be used for building a
 # package, especially for host-packages (target packages must be built using
 # the same version of the interpreter as the one installed on the target).
 #
-- 
1.7.10.4
