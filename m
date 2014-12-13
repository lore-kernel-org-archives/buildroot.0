From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 13 Dec 2014 18:43:07 +0100
Subject: [Buildroot] [PATCH 2/3] package/guile: rename patch to new
	convention
In-Reply-To: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1418492588-22122-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 .../{guile-01-fix_arm_endianness.patch => 0001-fix_arm_endianness.patch}  | 0
 ...calculate-csqrt_manually.patch => 0002-calculate-csqrt_manually.patch} | 0
 ...{guile-03-remove_unused_funcs.patch => 0003-remove_unused_funcs.patch} | 0
 3 files changed, 0 insertions(+), 0 deletions(-)
 rename package/guile/{guile-01-fix_arm_endianness.patch => 0001-fix_arm_endianness.patch} (100%)
 rename package/guile/{guile-02-calculate-csqrt_manually.patch => 0002-calculate-csqrt_manually.patch} (100%)
 rename package/guile/{guile-03-remove_unused_funcs.patch => 0003-remove_unused_funcs.patch} (100%)

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
-- 
2.1.3
