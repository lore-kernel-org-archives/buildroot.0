From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 13 May 2009 17:09:01 -0300
Subject: [Buildroot] [GIT PULL] For 2009.05-rc2
Message-ID: <d6cda7730905131309t2c0f8f21m2841072f983c71ac@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

The following changes since commit b124f62e23c3dc35ed0a74e68c2c596b30ea3d7c:
  Peter Korsgaard (1):
        Merge branch 'master' of
git://git.buildroot.net/~correa/git/buildroot into test

are available in the git repository at:

  git://git.buildroot.net/~correa/git/buildroot 2009.05

Olaf Rempel (1):
      rsync: fix build with config cache

Thiago A. Correa (11):
      Update atngw100-extended_defconfig
      Fix avahi build
      Update atngw100-base_defconfig
      CUPS requires stack protection support
      Update i686_defconfig
      Remove unused busybox.config
      Update i386_defconfig
      Update default linux config for x86
      Remove unused busybox config
      Update kernel config for atngw100_defconfig
      Remove unused kernel configs

 package/avahi/avahi.mk                             |    1 +
 package/cups/Config.in                             |    4 +
 package/rsync/rsync.mk                             |    1 +
 .../Atmel/atngw100-base/atngw100-base_defconfig    |  550 ++++--
 .../atngw100-expanded/atngw100-expanded_defconfig  |  634 ++----
 .../Atmel/atngw100/atngw100-linux-2.6.22.10.config | 1170 -----------
 ....6.24.config => atngw100-linux-2.6.29.2.config} |  495 ++++--
 target/device/Atmel/atngw100/atngw100_defconfig    |   19 +-
 target/device/Atmel/atngw100/busybox-1.9.1.config  |  767 -------
 target/device/x86/i686/busybox.config              |  719 -------
 target/device/x86/i686/i386_defconfig              |  139 +-
 target/device/x86/i686/i686_defconfig              |   42 +-
 target/device/x86/i686/linux-2.6.29.2.config       | 2157 ++++++++++++++++++++
 13 files changed, 3218 insertions(+), 3480 deletions(-)
 delete mode 100644 target/device/Atmel/atngw100/atngw100-linux-2.6.22.10.config
 rename target/device/Atmel/atngw100/{atngw100-linux-2.6.24.config =>
atngw100-linux-2.6.29.2.config} (77%)
 delete mode 100644 target/device/Atmel/atngw100/busybox-1.9.1.config
 delete mode 100644 target/device/x86/i686/busybox.config
 create mode 100644 target/device/x86/i686/linux-2.6.29.2.config

Kind Regards,
    Thiago A. Correa
