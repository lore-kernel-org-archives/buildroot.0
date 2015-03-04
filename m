From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed,  4 Mar 2015 23:15:28 +0100
Subject: [Buildroot] [PATCH 0/2] package/vlc: fix build failures (branch
	yem/vlc)
Message-ID: <cover.1425507251.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Since we bumped FreeRDP, vlc no longer builds (see commit log for
autobuild references).

Bump vlc, and express the missing dependencies.

Regards,
Yann E. MORIN.


The following changes since commit 9d0c45094118d1c238b389c5d6dc9a1a901bc575:

  openswan: re-add -fPIE flag (2015-03-04 23:04:29 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/vlc

for you to fetch changes up to 4ecf72039d9f27d864bc0d72b6738e5fa3e5192a:

  package/vlc: bump to 2.2.0 (2015-03-04 23:13:07 +0100)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/vlc: express the dependency on freerdp
      package/vlc: bump to 2.2.0

 package/vlc/0001-vlc-static.patch                  |  2 +-
 ...ac-add-check-for-libgcrypt-config-program.patch | 14 ++++-----
 package/vlc/0004-libav.patch                       | 22 --------------
 package/vlc/Config.in                              |  7 +++--
 package/vlc/vlc.hash                               |  4 +--
 package/vlc/vlc.mk                                 | 35 +++++++++++++++++-----
 6 files changed, 42 insertions(+), 42 deletions(-)
 delete mode 100644 package/vlc/0004-libav.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
