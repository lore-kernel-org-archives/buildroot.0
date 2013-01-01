From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 1 Jan 2013 22:24:12 +0100
Subject: [Buildroot] [git commit] valgrind: rename patches without version
	in the filename
Message-ID: <20130101212433.2BC779A59C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b4c0647e14fe329a8ac3d1d5de064e22b3624eda
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...r-check.patch => valgrind-compiler-check.patch} |    0
 ...ch => valgrind-dont-include-a-out-header.patch} |    0
 ...ort.patch => valgrind-fix-ccache-support.patch} |    0
 ....0-largefile.patch => valgrind-largefile.patch} |    0
 ...ore-ioctls.patch => valgrind-more-ioctls.patch} |    0
 ...ch => valgrind-workaround-SIGSEGV-on-PPC.patch} |    0
 6 files changed, 0 insertions(+), 0 deletions(-)

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
