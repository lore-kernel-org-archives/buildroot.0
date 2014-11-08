From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 8 Nov 2014 22:14:59 +0100
Subject: [Buildroot] [git commit] libiscsi: rename patches to follow the new
	name structure
Message-ID: <20141108214404.F1D79B2EC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a1f4227d96ae660606fd678856f8917b1bc221e0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...1-Fix-warnings-related-to-subdir-objects.patch} |    0
 ...ool-AM_PROG_AR-warning-during-autoreconf.patch} |    0
 ...003-Fix-CUnit-test-for-cross-compilation.patch} |    0
 ...-examples-fix-uint64_t-formatting-issues.patch} |    0
 ...05-ld_iscsi-fix-largefile-related-issues.patch} |    0
 5 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch b/package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0001-Fix-warnings-related-to-subdir-objects.patch
rename to package/libiscsi/0001-Fix-warnings-related-to-subdir-objects.patch
diff --git a/package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch b/package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
rename to package/libiscsi/0002-Avoid-libtool-AM_PROG_AR-warning-during-autoreconf.patch
diff --git a/package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch b/package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0003-Fix-CUnit-test-for-cross-compilation.patch
rename to package/libiscsi/0003-Fix-CUnit-test-for-cross-compilation.patch
diff --git a/package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch b/package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0004-examples-fix-uint64_t-formatting-issues.patch
rename to package/libiscsi/0004-examples-fix-uint64_t-formatting-issues.patch
diff --git a/package/libiscsi/libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch b/package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
similarity index 100%
rename from package/libiscsi/libiscsi-0005-ld_iscsi-fix-largefile-related-issues.patch
rename to package/libiscsi/0005-ld_iscsi-fix-largefile-related-issues.patch
