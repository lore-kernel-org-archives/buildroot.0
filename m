From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Dec 2012 00:14:54 +0100
Subject: [Buildroot] [PATCH 1/2] valgrind: rename patches without version in
	the filename
Message-ID: <1355958895-13294-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...r-check.patch => valgrind-compiler-check.patch} |    0
 ...ch => valgrind-dont-include-a-out-header.patch} |    0
 ...ort.patch => valgrind-fix-ccache-support.patch} |    0
 ....0-largefile.patch => valgrind-largefile.patch} |    0
 ...ore-ioctls.patch => valgrind-more-ioctls.patch} |    0
 ...ch => valgrind-workaround-SIGSEGV-on-PPC.patch} |    0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename package/valgrind/{valgrind-3.7.0-compiler-check.patch => valgrind-compiler-check.patch} (100%)
 rename package/valgrind/{valgrind-3.7.0-dont-include-a-out-header.patch => valgrind-dont-include-a-out-header.patch} (100%)
 rename package/valgrind/{valgrind-3.7.0-fix-ccache-support.patch => valgrind-fix-ccache-support.patch} (100%)
 rename package/valgrind/{valgrind-3.7.0-largefile.patch => valgrind-largefile.patch} (100%)
 rename package/valgrind/{valgrind-3.7.0-more-ioctls.patch => valgrind-more-ioctls.patch} (100%)
 rename package/valgrind/{valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch => valgrind-workaround-SIGSEGV-on-PPC.patch} (100%)

diff --git a/package/valgrind/valgrind-3.7.0-compiler-check.patch b/package/valgrind/valgrind-compiler-check.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-compiler-check.patch
rename to package/valgrind/valgrind-compiler-check.patch
diff --git a/package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch b/package/valgrind/valgrind-dont-include-a-out-header.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-dont-include-a-out-header.patch
rename to package/valgrind/valgrind-dont-include-a-out-header.patch
diff --git a/package/valgrind/valgrind-3.7.0-fix-ccache-support.patch b/package/valgrind/valgrind-fix-ccache-support.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-fix-ccache-support.patch
rename to package/valgrind/valgrind-fix-ccache-support.patch
diff --git a/package/valgrind/valgrind-3.7.0-largefile.patch b/package/valgrind/valgrind-largefile.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-largefile.patch
rename to package/valgrind/valgrind-largefile.patch
diff --git a/package/valgrind/valgrind-3.7.0-more-ioctls.patch b/package/valgrind/valgrind-more-ioctls.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-more-ioctls.patch
rename to package/valgrind/valgrind-more-ioctls.patch
diff --git a/package/valgrind/valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch b/package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
similarity index 100%
rename from package/valgrind/valgrind-3.7.0-workaround-SIGSEGV-on-PPC.patch
rename to package/valgrind/valgrind-workaround-SIGSEGV-on-PPC.patch
-- 
1.7.9.5
