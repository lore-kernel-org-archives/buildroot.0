From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue,  1 Dec 2020 23:12:59 +0100
Subject: [Buildroot] [PATCH 1/2] package/netsurf: renumber patches
Message-ID: <20201201221300.995927-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-nsgenbind.patch => 0002-do-not-cross-compile-nsgenbind.patch} | 0
 ...without-curl.patch => 0003-fix-compilation-without-curl.patch} | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename package/netsurf/{0003-do-not-cross-compile-nsgenbind.patch => 0002-do-not-cross-compile-nsgenbind.patch} (100%)
 rename package/netsurf/{0004-fix-compilation-without-curl.patch => 0003-fix-compilation-without-curl.patch} (100%)

diff --git a/package/netsurf/0003-do-not-cross-compile-nsgenbind.patch b/package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
similarity index 100%
rename from package/netsurf/0003-do-not-cross-compile-nsgenbind.patch
rename to package/netsurf/0002-do-not-cross-compile-nsgenbind.patch
diff --git a/package/netsurf/0004-fix-compilation-without-curl.patch b/package/netsurf/0003-fix-compilation-without-curl.patch
similarity index 100%
rename from package/netsurf/0004-fix-compilation-without-curl.patch
rename to package/netsurf/0003-fix-compilation-without-curl.patch
-- 
2.29.2
