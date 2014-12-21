From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:11:14 +0100
Subject: [Buildroot] [git commit] package/guile: rename patch to new
	convention
Message-ID: <20141221221121.0E1B180481@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dd1f5ad97c66fd282f999fc4a3592ce0adf136a4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...ianness.patch => 0001-fix_arm_endianness.patch} |    0
 ...y.patch => 0002-calculate-csqrt_manually.patch} |    0
 ..._funcs.patch => 0003-remove_unused_funcs.patch} |    0
 3 files changed, 0 insertions(+), 0 deletions(-)

diff --git a/package/guile/guile-01-fix_arm_endianness.patch b/package/guile/0001-fix_arm_endianness.patch
similarity index 100%
rename from package/guile/guile-01-fix_arm_endianness.patch
rename to package/guile/0001-fix_arm_endianness.patch
diff --git a/package/guile/guile-02-calculate-csqrt_manually.patch b/package/guile/0002-calculate-csqrt_manually.patch
similarity index 100%
rename from package/guile/guile-02-calculate-csqrt_manually.patch
rename to package/guile/0002-calculate-csqrt_manually.patch
diff --git a/package/guile/guile-03-remove_unused_funcs.patch b/package/guile/0003-remove_unused_funcs.patch
similarity index 100%
rename from package/guile/guile-03-remove_unused_funcs.patch
rename to package/guile/0003-remove_unused_funcs.patch
