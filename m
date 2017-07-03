From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  3 Jul 2017 21:22:04 +0200
Subject: [Buildroot] [PATCH 0/2] system: default to using Etc/UTC as a
	timezone
Message-ID: <cover.1499109719.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

A tiemzone is required by systemd, so we must have one defined.
See the second commit log for more details.


Regards,
Yann E. MORIN.


The following changes since commit 3529ee59d1954da17b6b74b51d400317c774225a

  qt5virtualkeyboard: new package (2017-07-03 00:36:01 +0200)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 8704f2d3078e10fe9df1c73b02bca452f8aab5b2

  system: use Etc/UTC as default timezone (2017-07-03 21:21:12 +0200)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/tz: fix variable name
      system: use Etc/UTC as default timezone

 package/tz/tz.mk         | 17 +++++++++--------
 package/tzdata/tzdata.mk | 19 ++++++++++---------
 system/Config.in         |  3 +--
 3 files changed, 20 insertions(+), 19 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
