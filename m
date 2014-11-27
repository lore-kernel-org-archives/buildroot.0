From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Nov 2014 23:26:06 +0100
Subject: [Buildroot] [git commit] package/nfs-utils: rename patches
Message-ID: <20141127224642.2B4BB7FF41@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=211a321934fae74d1ac4fa8b591bfa86c222845b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-AM_CONDITIONAL-in-conditional-execution.patch} |    0
 ...oo.patch => 0002-Patch-taken-from-Gentoo.patch} |    0
 ...-Switch-legacy-index-in-favour-of-strchr.patch} |    0
 ...libc.patch => 0004-fix-build-with-uClibc.patch} |    0
 ...of-getrpcbynumber-when-getrpcbynumber_r-.patch} |    0
 ...igure-script-find-getrpcbynumber-in-libt.patch} |    0
 ... 0007-sockaddr-h-needs-stddef-h-for-NULL.patch} |    0
 7 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch b/package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
rename to package/nfs-utils/0001-build-avoid-AM_CONDITIONAL-in-conditional-execution.patch
diff --git a/package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch b/package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0002-Patch-taken-from-Gentoo.patch
rename to package/nfs-utils/0002-Patch-taken-from-Gentoo.patch
diff --git a/package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch b/package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0003-Switch-legacy-index-in-favour-of-strchr.patch
rename to package/nfs-utils/0003-Switch-legacy-index-in-favour-of-strchr.patch
diff --git a/package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch b/package/nfs-utils/0004-fix-build-with-uClibc.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0004-fix-build-with-uClibc.patch
rename to package/nfs-utils/0004-fix-build-with-uClibc.patch
diff --git a/package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch b/package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
rename to package/nfs-utils/0005-Allow-usage-of-getrpcbynumber-when-getrpcbynumber_r-.patch
diff --git a/package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch b/package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
rename to package/nfs-utils/0006-Let-the-configure-script-find-getrpcbynumber-in-libt.patch
diff --git a/package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch b/package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
similarity index 100%
rename from package/nfs-utils/nfs-utils-0007-sockaddr-h-needs-stddef-h-for-NULL.patch
rename to package/nfs-utils/0007-sockaddr-h-needs-stddef-h-for-NULL.patch
