From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 May 2021 04:48:29 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-05-06
Message-ID: <20210507044834.F25C6607FD@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-05-06
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 23  |  1  |  0  | 24  |
    master   | 113 | 32  |  0  | 145 |

Classification of failures by reason for master
-----------------------------------------------

                 gerbera-1.8.0 | 5 
               capnproto-0.8.0 | 3 
                    ffmpeg-4.4 | 2 
        host-sentry-cli-1.57.0 | 2 
               pipewire-0.3.26 | 2 
                   bullet-3.09 | 1 
                directfb-1.7.7 | 1 
               domoticz-2021.1 | 1 
                   eigen-3.3.7 | 1 
                 hwloc-1.11.13 | 1 
             libopenh264-2.1.1 | 1 
monkey-f54856ce250c4e257354... | 1 
                mono-6.12.0.90 | 1 
                    mpd-0.22.6 | 1 
       python-matplotlib-3.0.3 | 1 
                rocksdb-6.13.3 | 1 
           spidermonkey-60.5.2 | 1 
                   strace-5.11 | 1 
                suricata-6.0.2 | 1 
                       unknown | 1 
                    unscd-0.54 | 1 
                    vlc-3.0.12 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          bullet-3.09           | NOK | http://autobuild.buildroot.net/results/ab2efdd1eac64474adf00d8e60b42110c6e89143 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/dc4e5ca3aa3c6b25a860e383571c4fbea3f3aa9e |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/196cf0800084e5dccf2b43957d91d868d0d9009a |     
  riscv32    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/910905a96ca45e648065ed1e0cf581a19d8cc3d7 |     
  riscv32    |         directfb-1.7.7         | NOK | http://autobuild.buildroot.net/results/de5c2cbecb26916cc4748e15208eb1f83a6c8f2c | ORPH
  mips64el   |        domoticz-2021.1         | NOK | http://autobuild.buildroot.net/results/d26ddfa9a69c4d6eef05b5110fca0fb37290910c |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/ff87da172fd355133f9c64b3ffd94ee5ac10ba42 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/530d2a255258a2c37382070544bf3e5f4d2050e5 |     
   mipsel    |           ffmpeg-4.4           | NOK | http://autobuild.buildroot.net/results/9cc08aef3528c5089cce445d600192a513af7f2f |     
    arm      |         gerbera-1.8.0          | NOK | http://autobuild.buildroot.net/results/639ccc1e984d960361c6530550fa531e0ee7025e |     
    arc      |         gerbera-1.8.0          | NOK | http://autobuild.buildroot.net/results/d66f9efde9638f7ef6108e425a020dc54a3ec1ff |     
   x86_64    |         gerbera-1.8.0          | NOK | http://autobuild.buildroot.net/results/b8a60f3c2611156a559f54768d85c42c077855b4 |     
  aarch64    |         gerbera-1.8.0          | NOK | http://autobuild.buildroot.net/results/66147cc0a8eaaa087746ed336a13ad39b90ecb09 |     
    arc      |         gerbera-1.8.0          | NOK | http://autobuild.buildroot.net/results/d0dd904ef5614f0fde88d19d342c8d98368928ea |     
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/02decf21c82e9a96571536343ae1686766078239 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/7fd81ac3c8891a139395a0038c3a65a7ab2eb482 |     
   sparc     |         hwloc-1.11.13          | NOK | http://autobuild.buildroot.net/results/5f9394d3bab4e83edbea9bc607c3e135adfdabbc |     
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/265eb4e5ac2a3cbd21eab320ed16ee10fc5e656a |     
   xtensa    | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/da87d2c9bf5afe52400f921d62c0ec777c9fe0a2 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/92ca2387f4e17d005b2ece301f43bf7084bb6a63 |     
  aarch64    |           mpd-0.22.6           | NOK | http://autobuild.buildroot.net/results/058ff45b97d9e313b240c9cd01b4dd64bc051a65 |     
    arm      |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/6ce2fe6de49b0287f62a7e6c55ac6c40a2415132 |     
   sparc     |        pipewire-0.3.26         | NOK | http://autobuild.buildroot.net/results/4ee1667416340667b49a67465b2513045de01ff1 |     
   x86_64    |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/0c5e0abbcc9e6881ea717f344622c460b6db2608 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/f007412f29ab2e03a6904e2f548e77654abde6de |     
   x86_64    |      spidermonkey-60.5.2       | NOK | http://autobuild.buildroot.net/results/bad62ac16cf855ebbb03147c346da497c0cab662 | ORPH
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/62c4b7bdbe9e05eed6416d075eb0f19af3bba8ba |     
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/34b0a0fd7e5ffb5a8c025a1274f6c61183f5e22d |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/014575308eac191c70eeac6defb49a1bd9acd62c |     
  riscv32    |           unscd-0.54           | NOK | http://autobuild.buildroot.net/results/8cd72f8a78f05989ce9645a008aa5ea40ad3db62 |     
  sparc64    |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/0f386d594b830c5023dbaf90577a49589455d356 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8a59c16016c7b9975b4122ffed70fee8d4439abf |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/70f18470ae6ef9a7637ff791ba1d9f935a4e59d6 |     


Gitlab CI results for 2021-05-06
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157423  | ORPH 
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157424  | ORPH 
             amarula_vyasa_rk3288 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157431  |      
                        imx8mqevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157536  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157537  |      
                          lafrite | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157538  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157543  |      
        minnowboard_max-graphical | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157546  |      
        olimex_a20_olinuxino_lime | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157577  |      
       olimex_a20_olinuxino_lime2 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157576  |      
       olimex_a20_olinuxino_micro | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157578  |      
                 qemu_nios2_10m50 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157632  |      
                  qemu_ppc_e500mc | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157637  | ORPH 
                 qemu_ppc_g3beige | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157638  |      
                   qemu_ppc_mac99 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157639  |      
                qemu_riscv32_virt | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157641  |      
                       qemu_s390x | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157644  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1240157661  |      



-- 
http://autobuild.buildroot.net
