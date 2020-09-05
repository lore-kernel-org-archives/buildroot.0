From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2020 14:42:02 +0200
Subject: [Buildroot] [PATCH 1/2] package/mongrel2: renumber patches
Message-ID: <20200905124203.560735-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../{0002-Do-not-run-tests.patch => 0001-Do-not-run-tests.patch}  | 0
 ...ation.patch => 0002-Fix-Makefiles-for-cross-compilation.patch} | 0
 ...onflict.patch => 0003-Rename-symbol-to-prevent-conflict.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/mongrel2/{0002-Do-not-run-tests.patch => 0001-Do-not-run-tests.patch} (100%)
 rename package/mongrel2/{0003-Fix-Makefiles-for-cross-compilation.patch => 0002-Fix-Makefiles-for-cross-compilation.patch} (100%)
 rename package/mongrel2/{0004-Rename-symbol-to-prevent-conflict.patch => 0003-Rename-symbol-to-prevent-conflict.patch} (100%)

diff --git a/package/mongrel2/0002-Do-not-run-tests.patch b/package/mongrel2/0001-Do-not-run-tests.patch
similarity index 100%
rename from package/mongrel2/0002-Do-not-run-tests.patch
rename to package/mongrel2/0001-Do-not-run-tests.patch
diff --git a/package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch b/package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
similarity index 100%
rename from package/mongrel2/0003-Fix-Makefiles-for-cross-compilation.patch
rename to package/mongrel2/0002-Fix-Makefiles-for-cross-compilation.patch
diff --git a/package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch b/package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
similarity index 100%
rename from package/mongrel2/0004-Rename-symbol-to-prevent-conflict.patch
rename to package/mongrel2/0003-Rename-symbol-to-prevent-conflict.patch
-- 
2.28.0
