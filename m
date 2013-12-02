From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  2 Dec 2013 23:29:51 +0100
Subject: [Buildroot] [pull request] Pull request for branch yem/host-packages
Message-ID: <cover.1386023329.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

This series adds parted as a host package.
This will allow (eg.) post-image scripts to use parted.

Regards,
Yann E. MORIN.


The following changes since commit edce303b8da95a9b19939ab7a4199a39c0483c6f:

  libtasn1: fix botched makeinfo/missing logic (2013-12-02 13:33:02 +0100)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem/host-packages

for you to fetch changes up to 1891fdbc7ad11ce084f2be315871eb10573953b7:

  package/parted: add a host variant (2013-12-02 23:27:45 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      package/lvm2: remove uninstall commands
      package/lvm2: add a host variant
      package/parted: add a host variant

 package/Config.in.host        |  1 +
 package/lvm2/lvm2.mk          | 13 ++++---------
 package/parted/Config.in.host |  6 ++++++
 package/parted/parted.mk      |  4 ++++
 4 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100644 package/parted/Config.in.host

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
