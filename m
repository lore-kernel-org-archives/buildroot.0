From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 24 Dec 2014 12:00:51 +0100
Subject: [Buildroot] [git commit] lua: rename patches to the new convention
Message-ID: <20141224111107.2F2D68047F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6b0fbd0020fa027aa5766b2f7514942cfb66e7bb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...lua-01-root-path.patch => 0001-root-path.patch} |    0
 ...or-lua.patch => 0002-shared-libs-for-lua.patch} |    0
 ...lua-11-linenoise.patch => 0011-linenoise.patch} |    0
 ...r-at-eoz.patch => 0012-fix-reader-at-eoz.patch} |    0
 ...lua-01-root-path.patch => 0001-root-path.patch} |    0
 ...or-lua.patch => 0002-shared-libs-for-lua.patch} |    0
 .../{lua-04-lua-pc.patch => 0004-lua-pc.patch}     |    0
 ...lua-11-linenoise.patch => 0011-linenoise.patch} |    0
 8 files changed, 0 insertions(+), 0 deletions(-)

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
