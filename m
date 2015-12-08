From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue,  8 Dec 2015 23:27:53 +0100
Subject: [Buildroot] [PATCH 0/2 v2] package/ustr: bump and cleanup (branch
	yem/ustr)
Message-ID: <cover.1449613577.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series updates and cleans up ustr, and fixes numerous build
failures in libsemanage (which uses ustr).


Changes v1 -> v2:
  - better document the change in apply-patch  (Yann)
  - build everything at build time, not install time  (Yann)


Regards,
Yann E. MORIN.


The following changes since commit 50b02a639558b5319e88d2c3ce66e3950352d694:

  pixman: disable vmx for powerpc CS toolchains (2015-12-08 21:54:42 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/ustr

for you to fetch changes up to 6bbfb3b8cb1249d1243175c8d0c46e9206621712:

  ustr: use Debian patches to compile w/ GCC 5.x (2015-12-08 23:02:51 +0100)

----------------------------------------------------------------
Ryan Barnett (2):
      apply-patches: only use first field of line for series file
      ustr: use Debian patches to compile w/ GCC 5.x

 .../ustr/0001-cross-compile-modifications.patch    | 144 ---------------------
 package/ustr/ustr.hash                             |   2 +
 package/ustr/ustr.mk                               |  56 ++------
 support/scripts/apply-patches.sh                   |   8 +-
 4 files changed, 22 insertions(+), 188 deletions(-)
 delete mode 100644 package/ustr/0001-cross-compile-modifications.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
