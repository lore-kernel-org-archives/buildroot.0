From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 29 Nov 2019 07:17:38 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-28
Message-ID: <20191129071743.E7A1C86B62@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-28
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 20  |  0  |  0  | 20  |
  2019.08.x  | 15  |  2  |  0  | 17  |
    master   | 103 | 35  |  0  | 138 |
     next    |  3  |  5  |  0  |  8  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                libselinux-2.9 | 5 
                snort-2.9.14.1 | 3 
                       unknown | 3 
host-google-breakpad-7515ab... | 2 
                libgdiplus-5.6 | 2 
                    mpv-0.29.1 | 2 
                    xen-4.12.1 | 2 
domoticz-0f411f781ae4fb4a82... | 1 
       gdb-arc-2019.09-rc1-gdb | 1 
              host-grpc-1.23.0 | 1 
                 jack1-0.125.0 | 1 
              jpeg-turbo-2.0.3 | 1 
                libcurl-7.66.0 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.4 | 1 
                     lxc-3.2.1 | 1 
                 mesa3d-19.2.6 | 1 
   openvmtools-10.3.5-10430147 | 1 
                oprofile-1.3.0 | 1 
toolchain-external-codesour... | 1 
    xserver_xorg-server-1.20.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/808f243bf651344d78062af0bfc026175386155c |     
    arc      |    gdb-arc-2019.09-rc1-gdb     | NOK | http://autobuild.buildroot.net/results/bc52d0012944e15dee30a6e00a92f23c87d0dfda | ORPH
    arm      | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/5fb44db7b0942f685024be167b7090872f367b32 |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/002fe9b00c9817761d82e57a016aff526addf54c |     
  mips64el   |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/5cfbb52f7077f310a8f5edd23ca656d389e7f234 |     
   x86_64    |         jack1-0.125.0          | NOK | http://autobuild.buildroot.net/results/5dba38e768d6feaed173adca300fcf6a7b7a44ff |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/9ce5f7e9ab5ca5973006ef6768301329639dc111 |     
    arm      |         libcurl-7.66.0         | NOK | http://autobuild.buildroot.net/results/1bd2e59e03763548a8b0354f6846997806b5ea34 |     
   xtensa    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/19dbc9ccbbee39fba354622918737fa487e34ef8 |     
   mipsel    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/f14877d38c3276787d36c26fa69366a0a5e96b71 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/03ea036ec430089a3a977a0f059f36871074ffad |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ef6ff91086a094eb25b145d66d072c6d2fc60154 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/2692e9cfcc4edc98a547b963bf85755d1a9c4ee6 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/56a60885896abc56eab7a9d328aa015c6ca090fe |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/a65eaa802af90db484043755a1b0470df431efe8 |     
  mips64el   | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/7b9bc3f24f1465522b55e015cb382349faa0c3dd | ORPH
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/4451bb7c9a87129476fa9dc2772f0eb0ec25db74 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/4cc2f2d4283c219231e0429bf4d2cc4dfc03d942 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/206ff002c4880980a64434bcb58b85faf27a13fb |     
    arm      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/ea02710aa1bb54e8c3964e49b5bf907baa1163ec |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4affe45d03db05b9e030de8eb66cdd24646f2930 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4f47b9d378b5baa924599d8a34b5062480d56030 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/b4204145992c13ad5e87883df6407a4d0b243ad5 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/aaccb0a1d8196d46ae91e1c3bd7bdb9d736a6ca7 |     
  aarch64    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/45bc7fbbdab3962de75c02ee0cba960b5dced10a |     
 aarch64_be  |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/e5dce1bf1d67de38badc1815d255d1e74306b9da |     
  nds32le    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/be254734dd2fa9b615fb3bab7cc2b438a62bb5ea |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/ad7a9404b80e5049de2d05db7f375d7dfaf78758 | ORPH
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/d1f7f26754280cafefed8f1f7435c30f009a00da |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/809cb1f334e9ca00352ef0e33004cffd39d030b5 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/0be89818216611ae96632fbb0ba5146447c282ad |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/a0710128a216123984b422fbb445e320c282b406 |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/400c40af4ba1faad347692eff5c03b00f2fb6d41 |     
    mips     |   xserver_xorg-server-1.20.5   | NOK | http://autobuild.buildroot.net/results/4861ec29cb3b741acaf7a1ad3d0b82613297cad4 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/c444e149335816a4c293f48bfa5b85a970b16d57 |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

kvm-unit-tests-kvm-unit-tes... | 1 
               libupnpp-0.17.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/5fcc51f9ca902200e88a134898f260a0d80c2b8e |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/affbe71fcc764fed80cae0a49deb03d693cc3a25 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

linux-serial-test-9965dad53... | 2 
                libselinux-2.9 | 1 
               log4cplus-2.0.4 | 1 
                 samba4-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/023d4404e0197ccb3f74495832b35550dea3c1c1 |     
  mips64el   | linux-serial-test-9965dad53... | NOK | http://autobuild.buildroot.net/results/245b52ac2ee5e053c109c1d4262e5e6f7128fe2a |     
    arm      | linux-serial-test-9965dad53... | NOK | http://autobuild.buildroot.net/results/89fec49033b0d453c36d60a8666265596a803671 |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/62fe7359913d33fb79f6e0231d3224140bd0a7e0 |     
    i686     |         samba4-4.11.2          | NOK | http://autobuild.buildroot.net/results/0a300f5c854c37cd3984761f029705b2780ad215 |     



-- 
http://autobuild.buildroot.net
