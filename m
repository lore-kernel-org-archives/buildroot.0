From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 Aug 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-10
Message-ID: <20160811063026.E35E1101DA9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-10
===============================

        success : 196
       failures : 40 
       timeouts : 1  
          TOTAL : 237

Classification of failures by reason
====================================

                    libiio-0.7 | 2 
                openmpi-1.10.2 | 2 
             fontconfig-2.12.1 | 2 
                  cairo-1.14.6 | 2 
              lirc-tools-0.9.4 | 2 
              squeezelite-v1.8 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                pinentry-0.9.4 | 1 
           igd2-for-linux-v1.1 | 1 
           libfreeimage-3.17.0 | 1 
                  stella-4.7.2 | 1 
               domoticz-3.4834 | 1 
                  snmppp-3.3.5 | 1 
                   systemd-231 | 1 
               binutils-2.25.1 | 1 
sconeserver-bbb384404575f8a... | 1 
make[2]: *** [utils/CMakeFi... | 1 
                   cmake-3.5.2 | 1 
                tinydtls-0.8.2 | 1 
                    fftw-3.3.4 | 1 
                     xen-4.6.0 | 1 
               wvstreams-4.6.1 | 1 
          sane-backends-1.0.25 | 1 
               openipmi-2.0.21 | 1 
                  babeld-1.7.1 | 1 
                      icu-57.1 | 1 
                 mono-4.4.2.11 | 1 
         systemd-bootchart-230 | 1 
                   lldpd-0.9.4 | 1 
               wireshark-2.0.5 | 1 
               ibrcommon-1.0.1 | 1 
                  ffmpeg-2.8.7 | 1 
                alsa-lib-1.1.2 | 1 
                 openssh-7.3p1 | 1 
                 gadgetfs-test | 1 
               tinycbor-v0.3.1 | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/4e0f22b5142b4f5c1bd6a257c9b1cf5768c5464d/
      x86_64 |                   babeld-1.7.1 | NOK | http://autobuild.buildroot.net/results/36b739822d218ec8b9e9ceba1cf243cb9cbc0dbb/
         arm |                binutils-2.25.1 | NOK | http://autobuild.buildroot.net/results/3e9c128f8262697d65c58ccd24a34cdfcaf003e9/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/9619c8b11585e29166226980e8188f84a6f8855d/
        bfin |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/638e9aea2d1ace6cd89931ea4dded3066ff2dabe/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/2a27ff419264adf9f8fb1f791fd8a08e4dddada0/
     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/83daca075e348e91cce6d2e9b46aba2f1fb62893/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/992c8631cdc8da439f9905a674e5164ff547db5a/
        m68k |                     fftw-3.3.4 | NOK | http://autobuild.buildroot.net/results/a7644898a3c19c31d1b70c1c3019de3f8878cfc7/
        sh4a |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/a4d6b5c2fe757c986ddafbb4ee341a00bd09a733/
     aarch64 |              fontconfig-2.12.1 | NOK | http://autobuild.buildroot.net/results/328e712f0e7799caa3455fb37e7d525827f64035/
     powerpc |                  gadgetfs-test | NOK | http://autobuild.buildroot.net/results/5f1e1237db44dd36b9568b774b82db51e5279e99/
        bfin |                ibrcommon-1.0.1 | NOK | http://autobuild.buildroot.net/results/6d02579427a679de077f45290cdef8f957371b07/
        bfin |                       icu-57.1 | NOK | http://autobuild.buildroot.net/results/d1c4f9116f8fc92c11143144f64bf810b5c08a8a/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/0882928de0672c13a64bc475054b42a5d0dc9d9a/
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/0b7a09a0d23a434f54b28aadf3f6beec4d290a89/
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/36b38df5b13be3f6355ba5b76b7a8a16ebaa1cf8/
        i686 |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/36d0ff5e56b271b202c38b0b86cd6e8b0ed8a9c4/
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/81c8d99458ac2f2b4e345657409e79d1b266364d/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/00c86b99fe45de11065a37c0edb99c451cc702ab/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/3f98bae79caffca9d4d5c4649c3b399471efed94/
     sparc64 |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/94a3f4d1dd646581501c7578c67320dd6704127f/
microblazeel | make[2]: *** [utils/CMakeFi... | TIM | http://autobuild.buildroot.net/results/695030d05d0f8ffdeaae0b64f3b3240553599565/
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/09ef83d5cc5a00c4fb182c68dc3a247bb6baf707/
microblazeel |                openipmi-2.0.21 | NOK | http://autobuild.buildroot.net/results/9a703eec94318159c5721213591ed4e7c959de28/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/8bf4de40517725aacb29a9adb69e5a5a1532fbc5/
       sparc |                 openmpi-1.10.2 | NOK | http://autobuild.buildroot.net/results/2cd78440581066336612a3a075a7250971df2773/
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/fd05cfd9991a361066ee5d84508863fe8587900d/
      mipsel |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/dd7819d87d86a10246597ecca833a55142bdea4e/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/c87c03b3c9685010ab38028f73d974c1809899c4/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/93d07cace7a7e3356d6a8846f9e4efb61e41790e/
        bfin |                   snmppp-3.3.5 | NOK | http://autobuild.buildroot.net/results/1b9cb4e7112f492b99a86bcb39e7e635a7f042bb/
        m68k |               squeezelite-v1.8 | NOK | http://autobuild.buildroot.net/results/88562a3064e27c2ce484cf595872e96e8dfb05a0/
         arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/c23d655137b1c1825b1da69b18307c6a1d4b23b8/
     powerpc |                    systemd-231 | NOK | http://autobuild.buildroot.net/results/33912eebb5f4ee3f73be078ba2035f48d76a6a46/
        mips |          systemd-bootchart-230 | NOK | http://autobuild.buildroot.net/results/e2ae38775b6acff3c3a8ea233ec70dd68b017319/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/de983b1fb6c1bd6c703af2b56f9e4724d9878069/
        i586 |                 tinydtls-0.8.2 | NOK | http://autobuild.buildroot.net/results/3c87af506330707c915c60ad2fad9acc175cd973/
         sh4 |                wireshark-2.0.5 | NOK | http://autobuild.buildroot.net/results/2d8cd47cc664dff0f76a230b36c37291f3087e35/
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/557abb5f5838bac00db5c4627d96b320a4959bdd/
         arm |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/c74f7f1c937904c236991f4d657558caaaa88429/


-- 
http://autobuild.buildroot.net
