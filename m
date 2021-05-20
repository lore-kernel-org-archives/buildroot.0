From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 20 May 2021 02:09:04 +0200
Subject: [Buildroot] [PATCH 0/1] package/udisks: bump to version 2.92
In-Reply-To: <99074531-f77a-1e83-0acb-7fbf45c0e07c@benettiengineering.com>
References: <99074531-f77a-1e83-0acb-7fbf45c0e07c@benettiengineering.com>
Message-ID: <20210520000905.3544040-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm re-taking over this patch from Adam Duskett, basically the patch is
very similar to his one that was taken by initial mine.
$(TARGET_NLS_DEPENDENCIES) in my build tests is not needed.

Giulio Benetti (1):
  package/udisks: bump to version 2.92

 ...-fix-build-with-newer-glibc-versions.patch | 29 -------
 .../0002-Fix-systemd-service-file.patch       | 33 --------
 ...issue-with-missing-sys-sysmacros.h-i.patch | 81 -------------------
 package/udisks/Config.in                      | 17 +++-
 package/udisks/udisks.hash                    |  4 +-
 package/udisks/udisks.mk                      | 27 +++++--
 6 files changed, 35 insertions(+), 156 deletions(-)
 delete mode 100644 package/udisks/0001-fix-build-with-newer-glibc-versions.patch
 delete mode 100644 package/udisks/0002-Fix-systemd-service-file.patch
 delete mode 100644 package/udisks/0003-Fix-compilation-issue-with-missing-sys-sysmacros.h-i.patch

-- 
2.25.1
