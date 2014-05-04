From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  4 May 2014 18:01:24 +0200
Subject: [Buildroot] [PATCH 0/2 v2] tzdata-related fixes (branch yem/tz)
Message-ID: <cover.1399219226.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series installs missing timzone data files.

Changes v1 -> v2:
  - proper install location for host-tzdata
  - combine both previous patches in this series

Regards,
Yann E. MORIN.


The following changes since commit dd5dbe627f4d66603e03ae2fdb09d4fe34d34dc7:

  clapack: new package (2014-05-04 09:10:55 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/tz

for you to fetch changes up to c976aa8f37ac787ecec903272d8c5fed7a75b833:

  package/tz: install missing files (2014-05-04 17:59:34 +0200)

----------------------------------------------------------------
Yann E. MORIN (2):
      package/tzdata: install missing files
      package/tz: install missing files

 package/tz/tz.mk         | 4 ++++
 package/tzdata/tzdata.mk | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
