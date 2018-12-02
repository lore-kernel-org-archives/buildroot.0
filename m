From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  2 Dec 2018 15:04:13 +0100
Subject: [Buildroot] [PATCH 0/2] package/qt5base: disable for toolchains
 with binutils bug 20765 (branch yem/fixes)
Message-ID: <cover.1543759351.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

This two-patch series is a porposal to disable the build of qt5 for
those toolchains that have binutils bug 20765.

Regards,
Yann E. MORIN.


The following changes since commit ba015cdf04a2ee33615f346448ac2e92aac3865a

  package/pkg-generic: use readlink instead of realpath (2018-12-02 11:22:11 +0100)


are available in the git repository at:

  git://git.buildroot.org/~ymorin/git/buildroot.git

for you to fetch changes up to acc8229480af3087d4df4da9b306ddc8e76be1ef

  package/qt5: hide for toolchains with binutils bug 20765 (2018-12-02 14:49:24 +0100)


----------------------------------------------------------------
Yann E. MORIN (2):
      toolchain: add binutils bug 20765 to linaro Aarch64be
      package/qt5: hide for toolchains with binutils bug 20765

 package/pinentry/Config.in                                           | 1 +
 package/qt5/Config.in                                                | 1 +
 toolchain/Config.in                                                  | 5 +++++
 .../toolchain-external-linaro-aarch64-be/Config.in                   | 1 +
 4 files changed, 8 insertions(+)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
