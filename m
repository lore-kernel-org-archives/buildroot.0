From: Francois Perrad <fperrad@gmail.com>
Date: Wed, 24 Dec 2014 10:10:34 +0100
Subject: [Buildroot] [PATCH 1/7] lua: rename patches to the new convention
Message-ID: <1419412240-16068-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua/5.1.5/{lua-01-root-path.patch => 0001-root-path.patch}        | 0
 .../{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch}  | 0
 package/lua/5.1.5/{lua-11-linenoise.patch => 0011-linenoise.patch}        | 0
 .../{lua-12-fix-reader-at-eoz.patch => 0012-fix-reader-at-eoz.patch}      | 0
 package/lua/5.2.3/{lua-01-root-path.patch => 0001-root-path.patch}        | 0
 .../{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch}  | 0
 package/lua/5.2.3/{lua-04-lua-pc.patch => 0004-lua-pc.patch}              | 0
 package/lua/5.2.3/{lua-11-linenoise.patch => 0011-linenoise.patch}        | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename package/lua/5.1.5/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.1.5/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.1.5/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)
 rename package/lua/5.1.5/{lua-12-fix-reader-at-eoz.patch => 0012-fix-reader-at-eoz.patch} (100%)
 rename package/lua/5.2.3/{lua-01-root-path.patch => 0001-root-path.patch} (100%)
 rename package/lua/5.2.3/{lua-02-shared-libs-for-lua.patch => 0002-shared-libs-for-lua.patch} (100%)
 rename package/lua/5.2.3/{lua-04-lua-pc.patch => 0004-lua-pc.patch} (100%)
 rename package/lua/5.2.3/{lua-11-linenoise.patch => 0011-linenoise.patch} (100%)

diff --git a/package/lua/5.1.5/lua-01-root-path.patch b/package/lua/5.1.5/0001-root-path.patch
similarity index 100%
rename from package/lua/5.1.5/lua-01-root-path.patch
rename to package/lua/5.1.5/0001-root-path.patch
diff --git a/package/lua/5.1.5/lua-02-shared-libs-for-lua.patch b/package/lua/5.1.5/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.1.5/lua-02-shared-libs-for-lua.patch
rename to package/lua/5.1.5/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.1.5/lua-11-linenoise.patch b/package/lua/5.1.5/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.1.5/lua-11-linenoise.patch
rename to package/lua/5.1.5/0011-linenoise.patch
diff --git a/package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch b/package/lua/5.1.5/0012-fix-reader-at-eoz.patch
similarity index 100%
rename from package/lua/5.1.5/lua-12-fix-reader-at-eoz.patch
rename to package/lua/5.1.5/0012-fix-reader-at-eoz.patch
diff --git a/package/lua/5.2.3/lua-01-root-path.patch b/package/lua/5.2.3/0001-root-path.patch
similarity index 100%
rename from package/lua/5.2.3/lua-01-root-path.patch
rename to package/lua/5.2.3/0001-root-path.patch
diff --git a/package/lua/5.2.3/lua-02-shared-libs-for-lua.patch b/package/lua/5.2.3/0002-shared-libs-for-lua.patch
similarity index 100%
rename from package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
rename to package/lua/5.2.3/0002-shared-libs-for-lua.patch
diff --git a/package/lua/5.2.3/lua-04-lua-pc.patch b/package/lua/5.2.3/0004-lua-pc.patch
similarity index 100%
rename from package/lua/5.2.3/lua-04-lua-pc.patch
rename to package/lua/5.2.3/0004-lua-pc.patch
diff --git a/package/lua/5.2.3/lua-11-linenoise.patch b/package/lua/5.2.3/0011-linenoise.patch
similarity index 100%
rename from package/lua/5.2.3/lua-11-linenoise.patch
rename to package/lua/5.2.3/0011-linenoise.patch
-- 
2.1.0
