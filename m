From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 11 Jun 2019 22:55:40 +0200
Subject: [Buildroot] [PATCH 0/2] package/libglib2: fix build with NLS on
 musl/uclibc (branch yem/meson-per-pkg-flags)
Message-ID: <cover.1560286529.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Under musl or uclibc, we need -lintl when NLS is enabled.


Regards,
Yann E. MORIN.


The following changes since commit 04efb17c863606cdbc2405d01c3d48d6868c5245

  package/vlc: bump version to 3.0.7 (2019-06-11 00:54:16 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 348952c2f966fb8c1ccb5b18418b3a8596925645

  package/libglib2: fix NLS build on musl and uclibc (2019-06-11 22:52:30 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      infra/pkg-meson: allow packages to expand their CFLAGS/CXXFLAGS/LDFLAGS
      package/libglib2: fix NLS build on musl and uclibc

 package/libglib2/libglib2.mk |  2 ++
 package/pkg-meson.mk         | 10 +++++++---
 2 files changed, 9 insertions(+), 3 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
