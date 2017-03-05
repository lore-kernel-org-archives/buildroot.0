From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Mar 2017 11:56:48 +0100
Subject: [Buildroot] [PATCH 0/2] package/wayland: disable building tests
Message-ID: <cover.1488711390.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Building tests require a C++ compiler, while the rest of wayland is
entirely written in C.

This series adds an option to configure to disable building tests.
It also gets rid of an option that was removed back in 2015.


Regards,
Yann E. MORIN.


The following changes since commit 1558a93484b8f95153d64f90a688707f5aeb747f

  DEVELOPERS: remove cosmo package (2017-03-04 15:35:01 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to 59483ee76c501ec78cfbb2250c3fbcf02f6f7a85

  package/wayland: don't build tests (2017-03-05 11:56:08 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      package/wayland: drop non-existing configure option
      package/wayland: don't build tests

 ...002-configure-add-option-to-disable-tests.patch | 68 ++++++++++++++++++++++
 package/wayland/wayland.mk                         |  6 +-
 2 files changed, 73 insertions(+), 1 deletion(-)
 create mode 100644 package/wayland/0002-configure-add-option-to-disable-tests.patch

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
