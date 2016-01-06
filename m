From: Romain Naour <romain.naour@gmail.com>
Date: Thu,  7 Jan 2016 00:05:34 +0100
Subject: [Buildroot] [PATCH 0/3] efl bump to 1.15.3
Message-ID: <1452121537-32273-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump efl 1.15.3 and enlightenment 0.19.14 final release.

https://phab.enlightenment.org/phame/live/3/post/e19_14_release/
https://phab.enlightenment.org/phame/live/3//post/efl_and_elementary_1_15_3_release/

Best regards,
Romain

Romain Naour (3):
  package/efl: bump to 1.15.3
  package/elementary: bump to 1.15.3
  package/enlightenment: bump to 0.19.14

 ...ecore_fb_private.h-define-EAPI-before-use.patch |  64 ---------
 package/efl/0002-ecore_x-Remove-XPrint-usage.patch | 153 ---------------------
 package/efl/efl.hash                               |   4 +-
 package/efl/efl.mk                                 |   3 +-
 package/elementary/elementary.hash                 |   4 +-
 package/elementary/elementary.mk                   |   2 +-
 package/enlightenment/enlightenment.hash           |   4 +-
 package/enlightenment/enlightenment.mk             |   2 +-
 8 files changed, 9 insertions(+), 227 deletions(-)
 delete mode 100644 package/efl/0001-ecore_fb_private.h-define-EAPI-before-use.patch
 delete mode 100644 package/efl/0002-ecore_x-Remove-XPrint-usage.patch

-- 
2.4.3
