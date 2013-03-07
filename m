From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  7 Mar 2013 22:53:39 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch yem-misc
Message-ID: <cover.1362693141.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This series is a based on Richard's tzdata initial series, with some fixes
discussed during the Developper's Day.

Changes v1 -> v2:
  -  rebased on master

Changes since Richard's post -> v1:
  - install POSIX time zones only once
  - path to 'zic' is exported by the 'zic' package


The following changes since commit 203c30796e232faaf3a7de19090657bf3e7db16a:

  rpi-userland: provides OpenGL ES, EGL and OpenVG (2013-03-06 22:18:39 +0100)

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
