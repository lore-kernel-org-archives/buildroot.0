From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  4 Nov 2010 20:31:24 +0100
Subject: [Buildroot] [pull request] Pull request for branch
	remove-shared-config-cache
Message-ID: <cover.1288899072.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The following changes since commit df3e367c5b6253ebb1ca2de6b97b662793bdb5f3:
  Peter Korsgaard (1):
        CHANGES: update with modifications from gtk-bump branch

are available in the git repository at:

  git://git.busybox.net/~tpetazzoni/git/buildroot remove-shared-config-cache

Thomas Petazzoni (1):
      Remove support for shared configuration cache

 Config.in                                          |   14 --------------
 Makefile                                           |    9 ---------
 configs/arm_nptl_toolchain_defconfig               |    1 -
 configs/arm_toolchain_defconfig                    |    1 -
 configs/at91rm9200df_defconfig                     |    1 -
 configs/at91rm9200df_ext_bare_defconfig            |    1 -
 configs/at91rm9200df_ext_defconfig                 |    1 -
 configs/at91sam9260dfc_defconfig                   |    1 -
 configs/at91sam9260dfc_ext_bare_defconfig          |    1 -
 configs/at91sam9260dfc_ext_defconfig               |    1 -
 configs/at91sam9261ek_defconfig                    |    1 -
 configs/at91sam9261ek_ext_bare_defconfig           |    1 -
 configs/at91sam9261ek_ext_defconfig                |    1 -
 configs/at91sam9263ek_defconfig                    |    1 -
 configs/at91sam9263ek_ext_bare_defconfig           |    1 -
 configs/at91sam9263ek_ext_defconfig                |    1 -
 configs/at91sam9g20dfc_defconfig                   |    1 -
 configs/at91sam9g20dfc_ext_bare_defconfig          |    1 -
 configs/at91sam9g20dfc_ext_defconfig               |    1 -
 configs/atngw100-base_defconfig                    |    1 -
 configs/atngw100_defconfig                         |    1 -
 configs/atstk1005_defconfig                        |    1 -
 configs/atstk100x_defconfig                        |    1 -
 configs/i386_defconfig                             |    1 -
 configs/i686_defconfig                             |    1 -
 configs/integrator926_defconfig                    |    1 -
 configs/integrator926_huge_defconfig               |    1 -
 docs/buildroot.html                                |    7 -------
 package/Makefile.autotools.in                      |    3 ---
 package/fontconfig/fontconfig.mk                   |    1 -
 package/gamin/gamin.mk                             |    2 --
 package/haserl/haserl.mk                           |    2 --
 package/libxml2/libxml2.mk                         |    2 --
 package/multimedia/alsa-lib/alsa-lib.mk            |    2 --
 package/ng-spice-rework/ng-spice-rework.mk         |    2 --
 package/rpm/rpm.mk                                 |    2 --
 package/sqlite/sqlite.mk                           |    2 --
 .../xserver_xorg-server/xserver_xorg-server.mk     |    1 -
 38 files changed, 0 insertions(+), 74 deletions(-)

Thanks,
-- 
Thomas Petazzoni
