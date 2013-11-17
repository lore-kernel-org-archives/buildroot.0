From: spdawson at gmail.com <spdawson@gmail.com>
Date: Sun, 17 Nov 2013 11:47:42 +0000
Subject: [Buildroot] [PATCH] uclibc: rename patches for version 0.9.31
Message-ID: <1384688862-4248-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Rename patches for uClibc version 0.9.31, for consistency with the general
patch naming scheme in Buildroot. Also remove a .avr32 extension from a patch;
this is not necessary, since uclibc 0.9.31 is unavailable on architectures
other than avr32.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 ...ian-conversions.patch => uclibc-0001-add-bsd-endian-conversions.patch} | 0
 ...c-0002-add-inotify-init1.patch => uclibc-0002-add-inotify-init1.patch} | 0
 ...ibc-0003-add-sock-cloexec.patch => uclibc-0003-add-sock-cloexec.patch} | 0
 ...c-0004-export-strverscmp.patch => uclibc-0004-export-strverscmp.patch} | 0
 ...handling.patch => uclibc-0005-fix-daylight-saving-time-handling.patch} | 0
 ...-error-locale-utf-8.patch => uclibc-0006-fix-error-locale-utf-8.patch} | 0
 ...uxthreads-errno-fix.patch => uclibc-0007-linuxthreads-errno-fix.patch} | 0
 ...s-GCC-PR32219.patch => uclibc-0008-more-workarounds-GCC-PR32219.patch} | 0
 .../0.9.31.1/{uClibc-0009-unshare.patch => uclibc-0009-unshare.patch}     | 0
 ...karound-GCC-PR32219.patch => uclibc-0010-workaround-GCC-PR32219.patch} | 0
 ...files-Make-targets.patch => uclibc-0011-startfiles-Make-targets.patch} | 0
 ...der-types.patch.avr32 => uclibc-0012-netlinkaccess-header-types.patch} | 0
 12 files changed, 0 insertions(+), 0 deletions(-)
 rename package/uclibc/0.9.31.1/{uClibc-0001-add-bsd-endian-conversions.patch => uclibc-0001-add-bsd-endian-conversions.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0002-add-inotify-init1.patch => uclibc-0002-add-inotify-init1.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0003-add-sock-cloexec.patch => uclibc-0003-add-sock-cloexec.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0004-export-strverscmp.patch => uclibc-0004-export-strverscmp.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0005-fix-daylight-saving-time-handling.patch => uclibc-0005-fix-daylight-saving-time-handling.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0006-fix-error-locale-utf-8.patch => uclibc-0006-fix-error-locale-utf-8.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0007-linuxthreads-errno-fix.patch => uclibc-0007-linuxthreads-errno-fix.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0008-more-workarounds-GCC-PR32219.patch => uclibc-0008-more-workarounds-GCC-PR32219.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0009-unshare.patch => uclibc-0009-unshare.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0010-workaround-GCC-PR32219.patch => uclibc-0010-workaround-GCC-PR32219.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0011-startfiles-Make-targets.patch => uclibc-0011-startfiles-Make-targets.patch} (100%)
 rename package/uclibc/0.9.31.1/{uClibc-0012-netlinkaccess-header-types.patch.avr32 => uclibc-0012-netlinkaccess-header-types.patch} (100%)

diff --git a/package/uclibc/0.9.31.1/uClibc-0001-add-bsd-endian-conversions.patch b/package/uclibc/0.9.31.1/uclibc-0001-add-bsd-endian-conversions.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0001-add-bsd-endian-conversions.patch
rename to package/uclibc/0.9.31.1/uclibc-0001-add-bsd-endian-conversions.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch b/package/uclibc/0.9.31.1/uclibc-0002-add-inotify-init1.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0002-add-inotify-init1.patch
rename to package/uclibc/0.9.31.1/uclibc-0002-add-inotify-init1.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0003-add-sock-cloexec.patch b/package/uclibc/0.9.31.1/uclibc-0003-add-sock-cloexec.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0003-add-sock-cloexec.patch
rename to package/uclibc/0.9.31.1/uclibc-0003-add-sock-cloexec.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0004-export-strverscmp.patch b/package/uclibc/0.9.31.1/uclibc-0004-export-strverscmp.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0004-export-strverscmp.patch
rename to package/uclibc/0.9.31.1/uclibc-0004-export-strverscmp.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0005-fix-daylight-saving-time-handling.patch b/package/uclibc/0.9.31.1/uclibc-0005-fix-daylight-saving-time-handling.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0005-fix-daylight-saving-time-handling.patch
rename to package/uclibc/0.9.31.1/uclibc-0005-fix-daylight-saving-time-handling.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0006-fix-error-locale-utf-8.patch b/package/uclibc/0.9.31.1/uclibc-0006-fix-error-locale-utf-8.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0006-fix-error-locale-utf-8.patch
rename to package/uclibc/0.9.31.1/uclibc-0006-fix-error-locale-utf-8.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0007-linuxthreads-errno-fix.patch b/package/uclibc/0.9.31.1/uclibc-0007-linuxthreads-errno-fix.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0007-linuxthreads-errno-fix.patch
rename to package/uclibc/0.9.31.1/uclibc-0007-linuxthreads-errno-fix.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0008-more-workarounds-GCC-PR32219.patch b/package/uclibc/0.9.31.1/uclibc-0008-more-workarounds-GCC-PR32219.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0008-more-workarounds-GCC-PR32219.patch
rename to package/uclibc/0.9.31.1/uclibc-0008-more-workarounds-GCC-PR32219.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0009-unshare.patch b/package/uclibc/0.9.31.1/uclibc-0009-unshare.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0009-unshare.patch
rename to package/uclibc/0.9.31.1/uclibc-0009-unshare.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0010-workaround-GCC-PR32219.patch b/package/uclibc/0.9.31.1/uclibc-0010-workaround-GCC-PR32219.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0010-workaround-GCC-PR32219.patch
rename to package/uclibc/0.9.31.1/uclibc-0010-workaround-GCC-PR32219.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0011-startfiles-Make-targets.patch b/package/uclibc/0.9.31.1/uclibc-0011-startfiles-Make-targets.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0011-startfiles-Make-targets.patch
rename to package/uclibc/0.9.31.1/uclibc-0011-startfiles-Make-targets.patch
diff --git a/package/uclibc/0.9.31.1/uClibc-0012-netlinkaccess-header-types.patch.avr32 b/package/uclibc/0.9.31.1/uclibc-0012-netlinkaccess-header-types.patch
similarity index 100%
rename from package/uclibc/0.9.31.1/uClibc-0012-netlinkaccess-header-types.patch.avr32
rename to package/uclibc/0.9.31.1/uclibc-0012-netlinkaccess-header-types.patch
-- 
1.8.3.2
