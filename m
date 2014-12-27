From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 27 Dec 2014 17:21:18 +0100
Subject: [Buildroot] [git commit] libxmlrpc: rename patches to the new
	convention
Message-ID: <20141227162125.785C38045F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=56c7bb5760e721a90e16b5fa1a3b74f8138cf721
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 ...b-build.patch => 0001-fix-gennmtab-build.patch} |    0
 ...ld.patch => 0002-fix-non-cplusplus-build.patch} |    0
 ...char-build.patch => 0003-non-wchar-build.patch} |    0
 ...ig.patch => 0004-use-correct-curl-config.patch} |    0
 4 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch b/package/libxmlrpc/0001-fix-gennmtab-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0001-fix-gennmtab-build.patch
rename to package/libxmlrpc/0001-fix-gennmtab-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch b/package/libxmlrpc/0002-fix-non-cplusplus-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0002-fix-non-cplusplus-build.patch
rename to package/libxmlrpc/0002-fix-non-cplusplus-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch b/package/libxmlrpc/0003-non-wchar-build.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0003-non-wchar-build.patch
rename to package/libxmlrpc/0003-non-wchar-build.patch
diff --git a/package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch b/package/libxmlrpc/0004-use-correct-curl-config.patch
similarity index 100%
rename from package/libxmlrpc/libxmlrpc-0004-use-correct-curl-config.patch
rename to package/libxmlrpc/0004-use-correct-curl-config.patch
