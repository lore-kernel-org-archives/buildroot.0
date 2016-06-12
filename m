From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Sun, 12 Jun 2016 13:59:57 +0200
Subject: [Buildroot] [PATCH 0/2] mono: bump to version 4.4.0.182
Message-ID: <1465732799-7929-1-git-send-email-angelo.compagnucci@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch bumps mono to version 4.4.0.182 and monolite to version 140.
It removes also the mainstreamed patches.

Angelo Compagnucci (2):
  package/mono: bump to version 4.4.0.182
  package/monolite: bump to version 140

 ...glib-checking-for-locale_charset-function.patch | 28 ----------------------
 ....in-fixing-wrong-MonoPosixHelper-location.patch | 28 ----------------------
 package/mono/mono.hash                             |  2 +-
 package/mono/mono.mk                               |  2 +-
 package/monolite/monolite.hash                     |  2 +-
 package/monolite/monolite.mk                       |  2 +-
 6 files changed, 4 insertions(+), 60 deletions(-)
 delete mode 100644 package/mono/0005-eglib-checking-for-locale_charset-function.patch
 delete mode 100644 package/mono/0007-config.in-fixing-wrong-MonoPosixHelper-location.patch

-- 
1.9.1
