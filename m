From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 24 Oct 2013 11:46:11 +0200
Subject: [Buildroot] [PATCH 1/2] webkit: number the patches
Message-ID: <1382607972-30863-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 ...t-autotools.patch => webkit-0001-build-fix-for-32-bit-autotools.patch} | 0
 ...-for-gtklauncher.patch => webkit-0002-build-fix-for-gtklauncher.patch} | 0
 ...it-detect-harfbuzz-icu.patch => webkit-0003-detect-harfbuzz-icu.patch} | 0
 ...webkit-disable-docrebase.patch => webkit-0004-disable-docrebase.patch} | 0
 .../{webkit-disable-tests.patch => webkit-0005-disable-tests.patch}       | 0
 package/webkit/{webkit-execinfo_h.patch => webkit-0006-execinfo_h.patch}  | 0
 package/webkit/{webkit-mips-dfg.patch => webkit-0007-mips-dfg.patch}      | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename package/webkit/{webkit-build-fix-for-32-bit-autotools.patch => webkit-0001-build-fix-for-32-bit-autotools.patch} (100%)
 rename package/webkit/{webkit-build-fix-for-gtklauncher.patch => webkit-0002-build-fix-for-gtklauncher.patch} (100%)
 rename package/webkit/{webkit-detect-harfbuzz-icu.patch => webkit-0003-detect-harfbuzz-icu.patch} (100%)
 rename package/webkit/{webkit-disable-docrebase.patch => webkit-0004-disable-docrebase.patch} (100%)
 rename package/webkit/{webkit-disable-tests.patch => webkit-0005-disable-tests.patch} (100%)
 rename package/webkit/{webkit-execinfo_h.patch => webkit-0006-execinfo_h.patch} (100%)
 rename package/webkit/{webkit-mips-dfg.patch => webkit-0007-mips-dfg.patch} (100%)

diff --git a/package/webkit/webkit-build-fix-for-32-bit-autotools.patch b/package/webkit/webkit-0001-build-fix-for-32-bit-autotools.patch
similarity index 100%
rename from package/webkit/webkit-build-fix-for-32-bit-autotools.patch
rename to package/webkit/webkit-0001-build-fix-for-32-bit-autotools.patch
diff --git a/package/webkit/webkit-build-fix-for-gtklauncher.patch b/package/webkit/webkit-0002-build-fix-for-gtklauncher.patch
similarity index 100%
rename from package/webkit/webkit-build-fix-for-gtklauncher.patch
rename to package/webkit/webkit-0002-build-fix-for-gtklauncher.patch
diff --git a/package/webkit/webkit-detect-harfbuzz-icu.patch b/package/webkit/webkit-0003-detect-harfbuzz-icu.patch
similarity index 100%
rename from package/webkit/webkit-detect-harfbuzz-icu.patch
rename to package/webkit/webkit-0003-detect-harfbuzz-icu.patch
diff --git a/package/webkit/webkit-disable-docrebase.patch b/package/webkit/webkit-0004-disable-docrebase.patch
similarity index 100%
rename from package/webkit/webkit-disable-docrebase.patch
rename to package/webkit/webkit-0004-disable-docrebase.patch
diff --git a/package/webkit/webkit-disable-tests.patch b/package/webkit/webkit-0005-disable-tests.patch
similarity index 100%
rename from package/webkit/webkit-disable-tests.patch
rename to package/webkit/webkit-0005-disable-tests.patch
diff --git a/package/webkit/webkit-execinfo_h.patch b/package/webkit/webkit-0006-execinfo_h.patch
similarity index 100%
rename from package/webkit/webkit-execinfo_h.patch
rename to package/webkit/webkit-0006-execinfo_h.patch
diff --git a/package/webkit/webkit-mips-dfg.patch b/package/webkit/webkit-0007-mips-dfg.patch
similarity index 100%
rename from package/webkit/webkit-mips-dfg.patch
rename to package/webkit/webkit-0007-mips-dfg.patch
-- 
1.8.4.rc3
