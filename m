From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Dec 2019 15:01:16 +0100
Subject: [Buildroot] [PATCH 0/2] package/libnss: fix build and remove a patch
Message-ID: <20191212140118.90730-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset must be applied after patch:
https://patchwork.ozlabs.org/patch/1207065/

Giulio Benetti (2):
  package/libnss: fix build failure on RHEL 7
  package/libnss: remove patch

 ... 0001-add-zlib-include-dir-variable.patch} |  0
 package/libnss/0001-fix-uclibc-build.patch    | 22 --------------
 ...uild-failure-due-to-missing-posix-s.patch} |  0
 ...ix-PowerPc-build-sys-auxv.h-failure.patch} |  0
 ...-nsinstall.c-build-failure-on-RHEL-7.patch | 29 +++++++++++++++++++
 5 files changed, 29 insertions(+), 22 deletions(-)
 rename package/libnss/{0002-add-zlib-include-dir-variable.patch => 0001-add-zlib-include-dir-variable.patch} (100%)
 delete mode 100644 package/libnss/0001-fix-uclibc-build.patch
 rename package/libnss/{0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch => 0002-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch} (100%)
 rename package/libnss/{0004-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch => 0003-Bug-1602743-Fix-PowerPc-build-sys-auxv.h-failure.patch} (100%)
 create mode 100644 package/libnss/0004-Bug-1603398-Fix-nsinstall.c-build-failure-on-RHEL-7.patch

-- 
2.20.1
