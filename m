From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 Jun 2017 12:03:50 +0200
Subject: [Buildroot] [PATCH 1/1] scanpypi: fix comment typo
Message-ID: <20170617100350.4775-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 support/scripts/scanpypi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/scripts/scanpypi b/support/scripts/scanpypi
index 44e5d20513..bb3899241b 100755
--- a/support/scripts/scanpypi
+++ b/support/scripts/scanpypi
@@ -258,7 +258,7 @@ class BuildrootPackage():
             setup.main([]) # Will raise AttributeError if not found
             self.setup_metadata = self.setup_args[self.metadata_name]
         # Here we must remove the module the hard way.
-        # We must do this because of a very sepcific case: if a package calls
+        # We must do this because of a very specific case: if a package calls
         # setup from the __main__ but does not come with a 'main()' function,
         # for some reason setup.main([]) will successfully call the main
         # function of a previous package...
-- 
2.11.0
