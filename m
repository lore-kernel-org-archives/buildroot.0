From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Feb 2013 23:49:03 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem-misc
Message-ID: <cover.1360017945.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a based on Richard's tzdata initial series, with some fixes
discussed today during the Developper's Day.

Changes since Richard's post:
  - install POSIX time zones only once
  - path to 'zic' is exported by the 'zic' package

The following changes since commit d3e7fbd75e49e3368b8c361c45344266ceca5cfd:

  heirloom-mailx: needs fork() (2013-02-03 21:37:32 +0100)

are available in the git repository at:
  git://gitorious.org/buildroot/buildroot.git yem-misc

Richard Braun (2):
      package/zic: new host package
      package/tzdata: new package

 package/Config.in                      |    1 +
 package/tzdata/Config.in               |   20 ++++++++++++++
 package/tzdata/tzdata.mk               |   46 ++++++++++++++++++++++++++++++++
 package/zic/zic-fix-dependencies.patch |   27 ++++++++++++++++++
 package/zic/zic.mk                     |   29 ++++++++++++++++++++
 5 files changed, 123 insertions(+), 0 deletions(-)
 create mode 100644 package/tzdata/Config.in
 create mode 100644 package/tzdata/tzdata.mk
 create mode 100644 package/zic/zic-fix-dependencies.patch
 create mode 100644 package/zic/zic.mk

Regards,
Yann E. MORIN

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
