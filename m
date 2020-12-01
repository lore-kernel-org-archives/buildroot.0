From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Dec 2020 23:31:36 +0100
Subject: [Buildroot] [git commit] package/netsurf: renumber patches
Message-ID: <20201201222241.69716815B7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=16bc610e51dbd6f16dc3b36be61feb721ce11262
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-compile-nsgenbind.patch => 0002-do-not-cross-compile-nsgenbind.patch} | 0
 ...ilation-without-curl.patch => 0003-fix-compilation-without-curl.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
similarity index 100%
rename from package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
rename to package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
diff --git a/package/netsurf/0004-fix-compilation-without-curl.patch b/package/netsurf/0003-fix-compilation-without-curl.patch
similarity index 100%
rename from package/netsurf/0004-fix-compilation-without-curl.patch
rename to package/netsurf/0003-fix-compilation-without-curl.patch
