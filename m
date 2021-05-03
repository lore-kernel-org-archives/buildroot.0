From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  3 May 2021 23:29:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/ltp-testsuite: renumber patch
Message-ID: <20210503212911.42562-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 84968aa4954b308ed67adde305e0fc5c801edc9e forgot to renumber
remaining patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ... => 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/ltp-testsuite/{0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch => 0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch} (100%)

diff --git a/package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch b/package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
similarity index 100%
rename from package/ltp-testsuite/0002-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
rename to package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch
-- 
2.30.2
