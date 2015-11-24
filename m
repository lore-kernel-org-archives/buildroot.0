From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2015 23:51:51 +0100
Subject: [Buildroot] [PATCH 0/2] package/mono: bump to version 4.2.1.102
Message-ID: <1448405513-20741-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series bumps mono to version 4.2.1.102

Angelo Compagnucci (2):
  package/mono: bump to version 4.2.1.102
  package/monolite: bump to version 138

 package/mono/0003-fix-parallel-install.patch       | 40 ----------------------
 ...glib-checking-for-locale_charset-function.patch | 28 +++++++++++++++
 ...6-Remove-unit-tests-from-mono-compilation.patch | 29 ++++++++++++++++
 package/mono/Config.in                             |  1 -
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               |  2 +-
 package/monolite/monolite.hash                     |  2 +-
 package/monolite/monolite.mk                       |  2 +-
 8 files changed, 61 insertions(+), 45 deletions(-)
 delete mode 100644 package/mono/0003-fix-parallel-install.patch
 create mode 100644 package/mono/0005-eglib-checking-for-locale_charset-function.patch
 create mode 100644 package/mono/0006-Remove-unit-tests-from-mono-compilation.patch

-- 
1.9.1
