From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 16 Apr 2021 04:42:21 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-15
Message-ID: <20210416044226.2937E40273@smtp2.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-15
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 20  |  6  |  0  | 26  |
    master   | 132 | 65  |  1  | 198 |

Classification of failures by reason for master
-----------------------------------------------

         s6-linux-init-1.0.3.1 | 12
              skalibs-2.10.0.2 | 7 
        host-sentry-cli-1.57.0 | 4 
libplatform-a7cd0d5780ed80a... | 3 
                 pixman-0.40.0 | 3 
                       unknown | 3 
            erlang-jiffy-1.0.6 | 2 
                mono-6.12.0.90 | 2 
              netopeer2-1.1.70 | 2 
                rocksdb-6.13.3 | 2 
                 samba4-4.14.2 | 2 
                  zeromq-4.3.4 | 2 
               belle-sip-4.4.8 | 1 
                  boost-1.75.0 | 1 
               capnproto-0.8.0 | 1 
docker-proxy-55685ba49593e6... | 1 
                    ffmpeg-4.4 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
                   httping-2.5 | 1 
             kismet-2020-12-R3 | 1 
                 mesa3d-21.0.2 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
                 postgis-3.1.1 | 1 
                          qpdf | 1 
            qt5location-5.15.2 | 1 
                 ripgrep-0.8.1 | 1 
                    ruby-3.0.0 | 1 
          sane-backends-1.0.32 | 1 
sconeserver-6b932d7d8dbb700... | 1 
                   strace-5.11 | 1 
                      tar-1.34 | 1 
                      tio-1.32 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/251717e0a87eebdc3bf2d568cd3cb326577b98b6 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/35ed2ffb55da3853ca67e236c66718399e5b7edd |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/015acf45d1d4534363396aecd2939e20e8f3a6a2 |     
    i586     | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/3687478490861da90c5853a81d96e2783185eb99 |     
   mipsel    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/620bef210f8b8a872c5e00b8f8d70cfef6884c43 |     
   x86_64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/d08cba016e37dab182b6a3021fee0106a39ae9c7 |     
  mips64el   |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/574d3013b975ab82e7005ea5da0b3b7074fb4d6b |     
   x86_64    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/f070a46914d68cc44889732f9bc98694342b501d | ORPH
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/537f665e98c872576c105ffa217cce982a69f98d | ORPH
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ff6c369364e015573ecabed1c8a623c8b86b7aa7 |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/0fa32c76408c89bea2c2a6393970ce4682b2718c |     
   nios2     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/817a8b4c6a8fb76ab0daf7e4056cba2fb9c02d5d |     
microblazeel |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/1a70616e0b02b90d9d53fdaf918ecaca01b64dff |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/33fa1fe79fb3ae48861278d70fd1188e2e406f05 |     
   x86_64    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/25f112481df4f5cf588e22f96f7b2d88d3ab20ea | ORPH
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/0404789e8ba0410a4def64d7a781eaf87cc2c076 |     
  mips64el   | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/76b9682cafa2841164c080ba245979bdcc787cb5 |     
    mips     | libplatform-a7cd0d5780ed80a... | NOK | http://autobuild.buildroot.net/results/43a8e8ede9d4a8e3d3358a115a2f21e6acd2d39e |     
  riscv32    |         mesa3d-21.0.2          | NOK | http://autobuild.buildroot.net/results/10c0aba15acfc775c84ac040292fdfbaa8d97bcc |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0a0390b824394b8d578d39d2c338efcf224a0b90 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/03ace330dce15eeb8d80a4fed3f068defdccf38a |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/ba873bd9a0dbde97508379ed2a65fe126990196f |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/7e85eb2c37c1d07a8856d2a1491fc6d7dcc8eaf7 | ORPH
  mips64el   |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/8d7e255024e1056d5fd25033fb788e2012caaa9b |     
    arm      |        netopeer2-1.1.70        | NOK | http://autobuild.buildroot.net/results/ab6c80dbb2ee29ee6c3bcd0cf7a2d8f85a42368d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/76d1780e2b2386702b5202de8f5e6df43d0da00c |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/fe92f401562b9cb23d978520896cf1ab1edc6a81 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/bd87fa16e0371700e116b2dd0fedf35b1f6d9a1b |     
    arc      |         postgis-3.1.1          | NOK | http://autobuild.buildroot.net/results/e2468c1377fcc9859be41e3247df95f6fd58734a |     
  riscv64    |              qpdf              | TIM | http://autobuild.buildroot.net/results/d1357c3af08db8b41a9e9a5ab8a1550baeea92fb |     
    i686     |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/7ea0b99c890ec5a817ba875f9f63966022cd55b4 |     
   x86_64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/f2ad613ea16a53abb13efb9d79060e75404d7b8f |     
  powerpc    |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/c030c52e00f16e93169f152b0b8010a826b8ad4e |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/a38213c0222205502060d20f837639cc9ab0b623 |     
   sparc     |           ruby-3.0.0           | NOK | http://autobuild.buildroot.net/results/01521dd4245c4a9228132179a258e9d009257f5b |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/8787a2866544c51ea20c1fe6fd2370be7df4c831 |     
   s390x     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/089907f4cb637ddd0deb5183c2679d5ecf4be247 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/60d21eb31417891f6b4ec66e7f32480816486a22 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/005c0c0256e97fd59cc2bf508605477f591c8f04 |     
   nios2     |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/71a5b7657ea9e47deb14934fbc8f3075debebb22 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/e2df01cae235cd7c85e1c404f98f56623c0afbd7 |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/bd67edb21aabfb91576e6bd08a0588fd07b7da18 |     
microblazeel |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/abac465ecec7dca09cdc842f43879d7dca4842f5 |     
 powerpc64   |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/8310e149dd7910dc9233ba59b528aba9e97f475c |     
    arc      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/e8f2fe0947cfbae1663d650e8916534d58025965 |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/fe9bcf8191bde4480d42bcd2f54a0a3e0fa4103a |     
    arm      |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/286c4d39c972c7f770be9296c7a1d1e93ce22907 |     
    arc      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/5e7134884ce0c4e6a49a466bcd0da89b5aa11fc9 |     
    arc      |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/4f7775d106c1fd41af90f0f7fa602f383dddb76e |     
  mips64el   |      sane-backends-1.0.32      | NOK | http://autobuild.buildroot.net/results/c8adb7a78e4e3c6907c92de12c965e346e209f26 |     
    i586     | sconeserver-6b932d7d8dbb700... | NOK | http://autobuild.buildroot.net/results/b49dc078f6a0d7959fec04a78e8766f2ce8e7f9a |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/919e4b6e2ecd38c14a46b898c2cc499061c77069 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/8ec09201e717d17ccd163e351b07eb3f9ef1fb65 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/19efaad8316d955234eacc047a86ae9e5c642251 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/74032606ec89acc4fa070661aacfc33c4b5c9a14 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/4840a5a552a4f7bf15d9f9ebbc960233203e021f |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/1f20a0fb472aa8088f00795fb25e7ee9c17f78e0 |     
   xtensa    |        skalibs-2.10.0.2        | NOK | http://autobuild.buildroot.net/results/872483d49e2cce95b37e31b317da8457f6577aa5 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/0b92ff57696843015fec26e67aa27d1a5789a1e6 |     
   x86_64    |            tar-1.34            | NOK | http://autobuild.buildroot.net/results/03267a7cd36a4a21d2c19f2c4cba33875146bd06 | ORPH
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c531c4e1aace9bda581644b1d086400c8278b258 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/8e7cec6336d28c96833703b16d59925b3e6133c7 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/c6dcfda7deeb5b6bcc007ca1bb9b1ad02977b19c |     
powerpc64le  |            unknown             | NOK | http://autobuild.buildroot.net/results/f714dd75b4aa494b5d1c8d89dcb80944954e02fc |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/d7e29c5e551497b572e9bc7059fb6e14744a0050 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a99df5a00a90ba81f066f1157458a395c4d5e6b6 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   delve-1.5.0 | 1 
                  monkey-1.6.9 | 1 
                mono-6.12.0.90 | 1 
              netopeer2-1.1.53 | 1 
                       unknown | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |          delve-1.5.0           | NOK | http://autobuild.buildroot.net/results/067a0974d36f2f61ad3bf7a0fc1f0418534d8736 |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/00ea1e6bfbe3dc92d04dd2a25d03665cc65b44f7 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b5ff1958b74eb0d0f87eb2a6ae8765aa80550f0e |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2505dbefa9df6edeee94843fddfe3d212f652078 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/5e7f7c3477e45eea152f00dca81c8d96e9b91dec |     
  riscv32    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/21cb6351c7ce096ee5a69b637c1f1e6f1bf193e6 |     


Gitlab CI results for 2021-04-15
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653793  | ORPH 
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653794  | ORPH 
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653800  |      
              freescale_imx8mpevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653866  | ORPH 
           friendlyarm_nanopi_a64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653874  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653933  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181653938  |      
                qemu_csky860_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654002  |      
                qemu_m68k_mcf5208 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654003  |      
                   qemu_m68k_q800 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654004  |      
            qemu_microblazebe_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654005  |      
            qemu_microblazeel_mmu | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654006  |      
              qemu_mips32r2_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654007  |      
            qemu_mips32r2el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654008  |      
              qemu_mips32r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654009  |      
            qemu_mips32r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654010  |      
                qemu_mips64_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654011  |      
              qemu_mips64el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654012  |      
              qemu_mips64r6_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654013  |      
            qemu_mips64r6el_malta | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654014  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654015  |      
                        qemu_or1k | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654016  |      
                 qemu_ppc64_e5500 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654017  |      
               qemu_ppc64_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654018  |      
             qemu_ppc64le_pseries | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654019  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654020  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654021  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654022  |      
               qemu_ppc_mpc8544ds | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654023  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654024  |      
                qemu_riscv64_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654025  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654026  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654027  |      
                   qemu_sh4eb_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654028  |      
               qemu_sparc64_sun4u | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654029  |      
                  qemu_sparc_ss10 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654030  |      
                      qemu_x86_64 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654031  |      
                 qemu_xtensa_lx60 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654033  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1181654042  |      



-- 
http://autobuild.buildroot.net
