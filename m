From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:24:11 +0200
Subject: [Buildroot] [pull request] Pull request for branch yem-misc-updates
Message-ID: <cover.1374182572.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Hello All!

Here are a small series with a few mostly-unrelated changes:
  - bump RPi kernel for misc fixes
  - fix nss-mdns instalation and runtime
  - instrument the external toolchain wrapper

Regards,
Yann E. MORIN.


The following changes since commit c34cd9e2dab7c37bb0bdea6f43e57addf2b710e2:

  ti-gfx: use BR2_ARM_EABIHF (2013-07-18 13:09:57 +0200)

are available in the git repository at:

  git://gitorious.org/buildroot/buildroot.git yem-misc-updates

for you to fetch changes up to 574ef0eb7e941dcc6c9dba3540f4aa1c213472bc:

  toolchain: instrument external toolchain wrapper (2013-07-18 23:20:34 +0200)

----------------------------------------------------------------
Yann E. MORIN (4):
      defconfig/rpi: bump kernel for misc fixes
      package/nss-mdns: fix avahi socket location
      package/nss-mdns: do not overwrite user's nsswitch.conf
      toolchain: instrument external toolchain wrapper

 configs/rpi_defconfig                                |  2 +-
 package/nss-mdns/nss-mdns.mk                         |  5 ++++-
 package/nss-mdns/nsswitch.conf                       | 15 ---------------
 toolchain/toolchain-external/ext-toolchain-wrapper.c |  8 ++++++++
 4 files changed, 13 insertions(+), 17 deletions(-)
 delete mode 100644 package/nss-mdns/nsswitch.conf

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
