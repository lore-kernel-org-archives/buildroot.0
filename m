From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Aug 2019 06:16:08 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-08-18
Message-ID: <20190819061616.580A8878A4@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-08-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 16  |  2  |  0  | 18  |
  2019.05.x  | 24  |  0  |  0  | 24  |
    master   | 231 | 50  |  1  | 282 |
     next    | 22  |  7  |  0  | 29  |

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-erlang-21.0 | 1 
         host-ti-cgt-pru-2.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |        host-erlang-21.0        | NOK | http://autobuild.buildroot.net/results/ccb6511cc54fe0bc7532e7c0c354ecad72955ec9 |     
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/0fa4b4f0c6a8e156da275f870b4e879e27b4e4a0 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    mpv-0.29.1 | 7 
                    ffmpeg-4.2 | 3 
                host-go-1.12.8 | 3 
                 libdrm-2.4.99 | 3 
                openblas-0.3.6 | 3 
           python-numpy-1.16.4 | 3 
                  cmocka-1.1.5 | 2 
           host-nodejs-10.15.3 | 2 
                      icu-64-2 | 2 
               libsigsegv-2.12 | 2 
                qt5base-5.12.4 | 2 
   vdr-plugin-vnsiserver-1.8.0 | 2 
/home/buildroot/autobuild/i... | 1 
                  flashrom-1.1 | 1 
              host-erlang-21.0 | 1 
           host-harfbuzz-2.5.3 | 1 
                 host-icu-64-2 | 1 
                     host-llvm | 1 
            host-mfgtools-0.02 | 1 
               libupnpp-0.17.1 | 1 
               log4cplus-2.0.4 | 1 
                 mesa3d-19.0.8 | 1 
                  monkey-1.6.9 | 1 
                   mpd-0.21.11 | 1 
   openvmtools-10.3.5-10430147 | 1 
       python-matplotlib-3.0.3 | 1 
              python-pyqt5-5.7 | 1 
          qt5multimedia-5.12.4 | 1 
                suricata-4.1.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    | /home/buildroot/autobuild/i... | NOK | http://autobuild.buildroot.net/results/85dafe056dbcbd53dabdee7be99202a55414a8ed |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/16b664942a9d3f88b6e41c29ee49cc475e9bea90 |     
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/bec833fda82138c39e7f4bd3e3529090ef8652e1 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/1d550c433a11f9bf6bbbd2deb03db002117a23c6 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/ee4eec2d5fbba0e86403ecb9daab7bef88ca301b |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/24b2d7d125e02c15603f2d8f4ea356cdd541d3b0 |     
  powerpc    |          flashrom-1.1          | NOK | http://autobuild.buildroot.net/results/b715bc5489076b47ff1bb070211199f27b8bdb09 |     
  powerpc    |        host-erlang-21.0        | NOK | http://autobuild.buildroot.net/results/d15f1db47276b0606463be999487e91b8e9c1d20 |     
   x86_64    |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/fa2c94826dc295a6270bfb7a804fdb773fe96d03 |     
    arm      |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/afa9d679f722dedacbad37b2c68c57ccd61096cd |     
    arm      |         host-go-1.12.8         | NOK | http://autobuild.buildroot.net/results/c1900054f251ed5aca397d8640a7bddb52432eaa |     
  riscv32    |      host-harfbuzz-2.5.3       | NOK | http://autobuild.buildroot.net/results/99ee597868750b7f103901875d97230b4b2e383b | ORPH
    arc      |         host-icu-64-2          | NOK | http://autobuild.buildroot.net/results/d25b2b09a2e31c78645dbe32b0a0b21c33060eba | ORPH
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/bcb21646237e2ca973689bc736c007bffc484dba |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/56159e0f1ca21f5dfaca4fe9ac779dcff9a58f6a |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/1043c3dc3ab242dc422dfcb59bbe3437ec285539 |     
  aarch64    |      host-nodejs-10.15.3       | NOK | http://autobuild.buildroot.net/results/3a4885a97edc83cdd5848cb7e768bfe631f53ae4 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/21204d5f6ec6f189cc205b1e3e9744e9f7e5cb98 | ORPH
microblazeel |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/6ae4f4a2321755830b7e9d09352204602e1f55ab | ORPH
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/5101e8861964ad34a4874ca1aeae66f1b826b309 |     
   x86_64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/775f75a478055777a0db223b7388c4fe99d49918 |     
    arm      |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/34953fade1824296f52a52d1882fa97ce1e1c615 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/e1a3eb2a11a8481b323f9c4330f2aea71d55ee62 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/28fbe4b344e08d232622ccf512f228c4120eb96c |     
    arc      |        libupnpp-0.17.1         | NOK | http://autobuild.buildroot.net/results/63307169c1dc360cde424b6b3c341cccafb17c6d |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/dc0e8845a9e9cb4916b00fc04db9907ec24495e1 |     
    sh4      |         mesa3d-19.0.8          | NOK | http://autobuild.buildroot.net/results/3f5c12e0fb61076c41e6aad6cc010eb64fc9ae8c |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/84f2a1113d1e900c59a5e0be6a04ef20fe2b07ca |     
microblazeel |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/849cc2b41fbdf4eacf9e229214ae0ab98d20fb98 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2c25116cd1095a7ab6f4eb6b10eabefa36a9bbac |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/a5de3ecf821114d6157e7d9cd49ca252e6206ce4 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/60087bc62c1f5812b2444ddc679f3e6b9faf8215 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/921dd38adaa0f5cba736d0cfc7ca47c1d9b927c9 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/45d3e4749a8261b44251a528e8b51b30c1cef890 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/4ad7c0a4c41f5bb3d946686c406d0a2cfaae95ff |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/6c3c84bd4a6836a1da9d8c3b66527e067137d148 |     
  aarch64    |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/6d3e98894ec7f83726172a8434cc619a640df462 | ORPH
  mips64el   |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/b9fd49475fad0f9f1c6acd4b519d4885469f9044 | ORPH
  mips64el   |         openblas-0.3.6         | NOK | http://autobuild.buildroot.net/results/cc673a32790e3df143874f53b566ad0add180ed8 | ORPH
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/80004f871268b1ae6fa4667495da30b3234a7bf7 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/ef1ea37f62d1a74b3470d0eb1712d39a8cba508e |     
    sh4      |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/61f9744a374751cb1fd6ca68f4b20f87f74ddf74 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/1267efde7068dc330299be3f060a059c4473a537 |     
  powerpc    |      python-numpy-1.16.4       | NOK | http://autobuild.buildroot.net/results/2f1286ff957df08d32fcc56ebc815bf938f3e71a |     
   mipsel    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/cb69c5daa564aa9f3250faa395399cb00a445e85 |     
 aarch64_be  |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/92577e276816e0085ce786e2cbf2efbb7bfe522b |     
   x86_64    |         qt5base-5.12.4         | NOK | http://autobuild.buildroot.net/results/f8d2ae9a60d7fbd9034d0a9b5d1850f97b3d56ae |     
    arm      |      qt5multimedia-5.12.4      | NOK | http://autobuild.buildroot.net/results/ad03c83a9b0f95715d92a1ff53ff29692ca98cbf |     
    m68k     |         suricata-4.1.3         | NOK | http://autobuild.buildroot.net/results/9f3cbdfc833816df208b7e63fc2efe35f73cdfd7 |     
  riscv32    |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/5afdd10630be28f8d11335dc30605489838b0132 |     
    mips     |  vdr-plugin-vnsiserver-1.8.0   | NOK | http://autobuild.buildroot.net/results/fb057946161ea725abb599f85beda88a2e61b257 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                   evtest-1.34 | 1 
                    ffmpeg-4.2 | 1 
                 libdrm-2.4.99 | 1 
                  luv-1.30.1-0 | 1 
                   mpd-0.21.11 | 1 
                    mpv-0.29.1 | 1 
                    wampcc-1.6 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |          evtest-1.34           | NOK | http://autobuild.buildroot.net/results/c5f1b95741b37f6d949b3407fff901a960c6b781 | ORPH
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/58faf52d1fa327c1c274ad6c385fd4f7dca7a62b |     
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/de5ea7cb5f64d60d82fcdb111339ee2bbee0586b |     
  riscv64    |          luv-1.30.1-0          | NOK | http://autobuild.buildroot.net/results/831f7a60cbc5f64cd76e84efed4181d5733bde30 |     
    sh4      |          mpd-0.21.11           | NOK | http://autobuild.buildroot.net/results/e0e562295b3d390f4434ecccd2967801ea7a8a7f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/76a04a736d25500b0780c395f45e22a03e48c5b5 |     
  riscv64    |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/2795edd7802419bc840159dede54a81f97c6a93c |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                           4th |  DISTRO  | https://release-monitoring.org/project/20471 | 3.62.4       | 3625         |     
                        acpica |  DISTRO  | https://release-monitoring.org/project/00018 | 20190703     | 20190816     |     
                         acpid |  DISTRO  | https://release-monitoring.org/project/00019 | 2.0.30       | 2.0.32       | ORPH
                       acsccid |  DISTRO  | https://release-monitoring.org/project/15661 | 1.1.4        | 1.1.7        |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.32.0       |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 9.0.0_r47    |     
                           apr |  GUESS   | https://release-monitoring.org/project/00095 | 1.6.3        | 1.7.0        |     
                      argparse |  GUESS   | https://release-monitoring.org/project/02100 | 0.6.0-1      | 1.0.10       |     
                         argus |  GUESS   | https://release-monitoring.org/project/00107 | 3.0.8        | 3.0.8.2      | ORPH
                     armadillo |  GUESS   | https://release-monitoring.org/project/07006 | 7.900.1      | 9.600.6      |     
                      asterisk |  GUESS   | https://release-monitoring.org/project/09838 | 16.4.1       | 16.5.0       |     
                            at |  GUESS   | https://release-monitoring.org/project/00127 | release_3... | 3.1.23       | ORPH
                   at-spi2-atk |  GUESS   | https://release-monitoring.org/project/07840 | 2.26.2       | 2.33.2       |     
                  at-spi2-core |  GUESS   | https://release-monitoring.org/project/07841 | 2.28.0       | 2.33.90      |     
                         atkmm |  GUESS   | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                         aubio |  GUESS   | https://release-monitoring.org/project/10301 | 0.4.6        | 0.4.7        |     
              autoconf-archive |  GUESS   | https://release-monitoring.org/project/00142 | 2017.03.21   | 2019.01.06   |     
                        autofs |  GUESS   | https://release-monitoring.org/project/00140 | 5.1.4        | 5.1.5        |     
                      automake |  GUESS   | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
                  b43-fwcutter |  GUESS   | https://release-monitoring.org/project/00152 | 015          | 019          |     
                        babeld |  GUESS   | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.0        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  GUESS   | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                            bc |  GUESS   | https://release-monitoring.org/project/00170 | 1.06.95      | 1.07.1       |     
                     bctoolbox |  GUESS   | https://release-monitoring.org/project/14746 | 0.4.0        | 0.6.0        | ORPH
                         bdwgc |  GUESS   | https://release-monitoring.org/project/17108 | 8.0.0        | 8.0.4        | ORPH
                          bind |  GUESS   | https://release-monitoring.org/project/14923 | 9.11.6-P1    | 9.15.2       | ORPH
                      binutils |  GUESS   | https://release-monitoring.org/project/07981 | 2.31.1       | 2.32         |     
                          bird |  GUESS   | https://release-monitoring.org/project/00192 | 2.0.4        | 2.0.5        |     
                       bitcoin |  GUESS   | https://release-monitoring.org/project/13618 | v0.16.3      | 0.18.1       |     
                     bitstream |  GUESS   | https://release-monitoring.org/project/16268 | 1.4          | 2.5.4        |     
                        bonnie |  GUESS   | https://release-monitoring.org/project/15231 | 1.03e        | 1.98         | ORPH
                         boost |  GUESS   | https://release-monitoring.org/project/06845 | 1.70.0       | 1.71.0.beta1 |     
                        brltty |  GUESS   | https://release-monitoring.org/project/00220 | 5.6          | 6.0          |     
                        bustle |  GUESS   | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                         cairo |  GUESS   | https://release-monitoring.org/project/00247 | 1.15.12      | 1.16.4       |     
                       cairomm |  GUESS   | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     capnproto |  GUESS   | https://release-monitoring.org/project/11515 | 0.6.1        | 0.7.0        |     
                         cargo |  GUESS   | https://release-monitoring.org/project/17512 | 0.26.0       | 0.38.0       |     
                        ccache |  GUESS   | https://release-monitoring.org/project/00257 | 3.6          | 3.7.3        | ORPH
                        ccrypt |  GUESS   | https://release-monitoring.org/project/14496 | 1.10         | 1.11         |     
                   checkpolicy |  GUESS   | https://release-monitoring.org/project/00276 | 2.9          | 20190315     |     
                      chipmunk |  GUESS   | https://release-monitoring.org/project/09061 | 7.0.2        | 7.0.3        |     
                        chrony |  GUESS   | https://release-monitoring.org/project/08810 | 3.4          | 3.5          | ORPH
                    cifs-utils |  GUESS   | https://release-monitoring.org/project/00287 | 6.8          | 6.9          |     
                        clinfo |  GUESS   | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                         cmake |  GUESS   | https://release-monitoring.org/project/00306 | 3.8.2        | 3.15.2       |     
                     coreutils |  GUESS   | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                       cppunit |  GUESS   | https://release-monitoring.org/project/09543 | 1.13.2       | 1.14.0       | ORPH
                      cracklib |  GUESS   | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                    cryptsetup |  GUESS   | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.0        |     
                          cups |  GUESS   | https://release-monitoring.org/project/00380 | 2.2.11       | 2.3b8        |     
                  cups-filters |  GUESS   | https://release-monitoring.org/project/05541 | 1.23.0       | 1.25.2       |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                         dante |  GUESS   | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                         dc3dd |  GUESS   | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                    dehydrated |  GUESS   | https://release-monitoring.org/project/11312 | 0.6.2        | 0.6.5        |     
                        dhcpcd |  GUESS   | https://release-monitoring.org/project/11429 | 7.2.2        | 8.0.2        |     
                        dialog |  GUESS   | https://release-monitoring.org/project/00431 | 1.3-20170509 | 1.3-20190808 | ORPH
                        docker |  GUESS   | https://release-monitoring.org/project/11719 | 1.5          | 19.03.2-b... | ORPH
                docker-compose |  GUESS   | https://release-monitoring.org/project/06185 | 1.20.1       | 1.25.0-rc2   |     
                    drbd-utils |  GUESS   | https://release-monitoring.org/project/00462 | 9.2.0        | 9.10.0       |     
                         dstat |  GUESS   | https://release-monitoring.org/project/00630 | 0.7.3        | 0.7.4        | ORPH
                     e2fsprogs |  GUESS   | https://release-monitoring.org/project/00646 | 1.45.2       | 1.45.3       | ORPH
                      easy-rsa |  GUESS   | https://release-monitoring.org/project/17770 | 3.0.1        | 3.0.6        |     
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 16           |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.08        |     
                      elfutils |  DISTRO  | https://release-monitoring.org/project/05679 | 0.176        | 0.177        | ORPH
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.20         | 0.21         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.5        |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.0.7       |     
                   erlang-eimp |  DISTRO  | https://release-monitoring.org/project/17060 | 1.0.8        | 1.0.12       |     
               erlang-goldrush |  DISTRO  | https://release-monitoring.org/project/09692 | 0.1.9        | 0.2.0        |     
                  erlang-jiffy |  DISTRO  | https://release-monitoring.org/project/09323 | 0.14.11      | 1.0.1        |     
                  erlang-lager |  DISTRO  | https://release-monitoring.org/project/00727 | 3.4.2        | 3.8.0        |     
           erlang-p1-cache-tab |  DISTRO  | https://release-monitoring.org/project/08757 | 1.0.16       | 1.0.20       |     
              erlang-p1-oauth2 |  DISTRO  | https://release-monitoring.org/project/09302 | 0.6.3        | 0.7.0        |     
                 erlang-p1-sip |  DISTRO  | https://release-monitoring.org/project/10576 | 1.0.26       | 1.0.30       |     
          erlang-p1-stringprep |  DISTRO  | https://release-monitoring.org/project/09222 | 1.0.14       | 1.0.17       |     
                erlang-p1-stun |  DISTRO  | https://release-monitoring.org/project/09151 | 1.0.25       | 1.0.29       |     
                 erlang-p1-tls |  DISTRO  | https://release-monitoring.org/project/10455 | 1.0.25       | 1.1.2        |     
               erlang-p1-utils |  DISTRO  | https://release-monitoring.org/project/08643 | 1.0.13       | 1.0.16       |     
                 erlang-p1-xml |  DISTRO  | https://release-monitoring.org/project/10464 | 1.1.34       | 1.1.37       |     
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.0        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.20       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      eventlog |  GUESS   | https://release-monitoring.org/project/14684 | 0.2.12       | 3.22.1       |     
                      execline |  DISTRO  | https://release-monitoring.org/project/05482 | 2.5.0.0      | 2.5.1.0      |     
                        exempi |  DISTRO  | https://release-monitoring.org/project/00767 | 2.4.5        | 2.5.0        |     
                         exiv2 |  GUESS   | https://release-monitoring.org/project/00769 | 0.27.1       | 0.27.2       |     
                    f2fs-tools |  DISTRO  | https://release-monitoring.org/project/14689 | v1.11.0      | 1.12.0       |     
                      fakeroot |  GUESS   | https://release-monitoring.org/project/12048 | 1.20.2       | 1.23         | ORPH
                           feh |  GUESS   | https://release-monitoring.org/project/00790 | 3.1.3        | 3.2.1        |     
                          file |  GUESS   | https://release-monitoring.org/project/00807 | 5.36         | 5.37         | ORPH
                           fio |  GUESS   | https://release-monitoring.org/project/00806 | fio-3.9      | 3.15         |     
                          flac |  GUESS   | https://release-monitoring.org/project/00817 | 1.3.2        | 1.3.3        |     
                       flannel |  GUESS   | https://release-monitoring.org/project/07421 | v0.5.5       | 0.11.0       |     
                         flite |  GUESS   | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  GUESS   | https://release-monitoring.org/project/07184 | 0.8.3        | 3.2.7        | ORPH
                          fltk |  GUESS   | https://release-monitoring.org/project/00823 | 1.3.4        | 1.3.5        | ORPH
                    fontconfig |  GUESS   | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                         fping |  GUESS   | https://release-monitoring.org/project/00834 | 4.0          | 4.2          | ORPH
                          fwts |  GUESS   | https://release-monitoring.org/project/17383 | V18.09.00    | 19.07.00     |     
                        gauche |  GUESS   | https://release-monitoring.org/project/00873 | 0.9.5        | 0.9.8        |     
                          gawk |  GUESS   | https://release-monitoring.org/project/00868 | 4.2.1        | 5.0.1        | ORPH
                           gcr |  GUESS   | https://release-monitoring.org/project/11801 | 3.28.1       | 3.33.4       | ORPH
                    gdk-pixbuf |  GUESS   | https://release-monitoring.org/project/09533 | 2.36.10      | 2.39.2       | ORPH
                     gengetopt |  GUESS   | https://release-monitoring.org/project/00892 | 2.22.6       | 2.23         |     
                        gflags |  GUESS   | https://release-monitoring.org/project/08735 | 2.2.0        | 2.2.2        |     
                        giflib |  GUESS   | https://release-monitoring.org/project/01158 | 5.1.4        | 5.2.1        |     
                        glibmm |  GUESS   | https://release-monitoring.org/project/07960 | 2.60.0       | 2.61.1       |     
                          glog |  GUESS   | https://release-monitoring.org/project/08732 | 0.3.5        | 0.4.0        |     
                       gnuplot |  GUESS   | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.7        |     
                      gnuradio |  GUESS   | https://release-monitoring.org/project/01217 | 3.7.13.3     | 3.8.0.0      |     
                        gnutls |  GUESS   | https://release-monitoring.org/project/01221 | 3.6.8        | 3.6.9        |     
                            go |  GUESS   | https://release-monitoring.org/project/01227 | 1.12.8       | 1.12.9       |     
                         gperf |  GUESS   | https://release-monitoring.org/project/01237 | 3.0.4        | 3.1          | ORPH
                           gpm |  GUESS   | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                          gqrx |  GUESS   | https://release-monitoring.org/project/09771 | 2.11.4       | 2.11.5       |     
                       granite |  GUESS   | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.4        | ORPH
                     graphite2 |  GUESS   | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  GUESS   | https://release-monitoring.org/project/19117 | 1.18.0       | 1.23.0       |     
                         grub2 |  GUESS   | https://release-monitoring.org/project/01257 | 2.02         | 2.04         |     
     gsettings-desktop-schemas |  GUESS   | https://release-monitoring.org/project/13139 | 3.33.1       | 3.33.90      | ORPH
                         gssdp |  GUESS   | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.0       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.0       | ORPH
                         gtest |  DISTRO  | https://release-monitoring.org/project/18290 | 1.8.0        | 1.8.1        |     
                 gtksourceview |  GUESS   | https://release-monitoring.org/project/07724 | 3.24.7       | 4.3.1        |     
                         guile |  GUESS   | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  GUESS   | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  GUESS   | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                          gvfs |  GUESS   | https://release-monitoring.org/project/05496 | 1.31.4       | 1.41.90      | ORPH
                       haproxy |  GUESS   | https://release-monitoring.org/project/01298 | 1.9.1        | 2.0.5        |     
                      harfbuzz |  GUESS   | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.0        | ORPH
                        hdparm |  GUESS   | https://release-monitoring.org/project/01304 | 9.56         | 9.58         |     
            hicolor-icon-theme |  GUESS   | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                       hostapd |  GUESS   | https://release-monitoring.org/project/01325 | 2.7          | 2.9          |     
                         hplip |  GUESS   | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.6       | ORPH
                          htop |  GUESS   | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  GUESS   | https://release-monitoring.org/project/05387 | 0.308        | 0.326        | ORPH
                         hwloc |  GUESS   | https://release-monitoring.org/project/13501 | 1.11.7       | 2.0.4        |     
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.8-61     | ORPH
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190514a    | 20190618     |     
                      ipmiutil |  GUESS   | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                         ipset |  GUESS   | https://release-monitoring.org/project/01393 | 7.2          | 7.3          | ORPH
                    irqbalance |  GUESS   | https://release-monitoring.org/project/01402 | 1.5.0        | 1.6.0        |     
                         irssi |  GUESS   | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  GUESS   | https://release-monitoring.org/project/13286 | 0.18         | 0.21         | ORPH
                            iw |  GUESS   | https://release-monitoring.org/project/01410 | 5.0.1        | 5.3          |     
                           iwd |  GUESS   | https://release-monitoring.org/project/18380 | 0.18         | 0.19         |     
                        jimtcl |  GUESS   | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                            jo |  GUESS   | https://release-monitoring.org/project/18855 | 1.1          | 1.2          |     
                           joe |  GUESS   | https://release-monitoring.org/project/01467 | 4.4          | 4.6          | ORPH
                       jsoncpp |  GUESS   | https://release-monitoring.org/project/07483 | 1.8.4        | 1.9.1        |     
                           kbd |  GUESS   | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  GUESS   | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.18       |     
                      keyutils |  GUESS   | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-08-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.3-Leia    |     
        kodi-audioencoder-flac |  DISTRO  | https://release-monitoring.org/project/17755 | 1.1.0        | 2.0.1        |     
                       kvazaar |  GUESS   | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  GUESS   | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  GUESS   | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  GUESS   | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                          less |  GUESS   | https://release-monitoring.org/project/01550 | 487          | 551          | ORPH
                       leveldb |  GUESS   | https://release-monitoring.org/project/09338 | 1.20         | 1.22         |     
                 libatomic_ops |  GUESS   | https://release-monitoring.org/project/01561 | 7.6.6        | 7.6.10       | ORPH
                       libbson |  GUESS   | https://release-monitoring.org/project/09537 | 1.9.4        | 1.9.5        |     
                        libcap |  GUESS   | https://release-monitoring.org/project/01569 | 2.25         | 2.27         |     
                        libcgi |  GUESS   | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                      libcroco |  GUESS   | https://release-monitoring.org/project/11787 | 0.6.12       | 0.6.13       | ORPH
                       libdnet |  GUESS   | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libdvdread |  GUESS   | https://release-monitoring.org/project/05614 | 6.0.0        | 6.0.1        |     
                    libebur128 |  GUESS   | https://release-monitoring.org/project/07316 | 1.2.2        | 1.2.4        |     
                       libedit |  GUESS   | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20190324-3.1 |     
                       libestr |  GUESS   | https://release-monitoring.org/project/13288 | 0.1.10       | 0.1.11       |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libftdi |  GUESS   | https://release-monitoring.org/project/14622 | 0.20         | 1.4          | ORPH
                       libfuse |  GUESS   | https://release-monitoring.org/project/00861 | 2.9.9        | 3.6.2        | ORPH
                    libgdiplus |  GUESS   | https://release-monitoring.org/project/06440 | 5.6          | 6.0.2        |     
                        libgee |  GUESS   | https://release-monitoring.org/project/01625 | 0.20.1       | 0.20.2       |     
                       libgit2 |  GUESS   | https://release-monitoring.org/project/01627 | 0.27.9       | 0.28.3       |     
                       libglfw |  DISTRO  | https://release-monitoring.org/project/01180 | 3.2.1        | 3.3          |     
                      libgudev |  GUESS   | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  GUESS   | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.5        |     
                      libiconv |  GUESS   | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                      libinput |  GUESS   | https://release-monitoring.org/project/05781 | 1.13.4       | 1.14.0       |     
                      libkcapi |  GUESS   | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                       libmbim |  GUESS   | https://release-monitoring.org/project/07308 | 1.18.0       | 1.18.2       |     
                 libmicrohttpd |  GUESS   | https://release-monitoring.org/project/01658 | 0.9.64       | 0.9.66       |     
                    libmodplug |  GUESS   | https://release-monitoring.org/project/05669 | 0.8.8.5      | 0.8.9.0      |     
                        libndp |  GUESS   | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                       libnice |  GUESS   | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  GUESS   | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                        libp11 |  GUESS   | https://release-monitoring.org/project/01699 | 0.4.9        | 0.4.10       |     
                      libpjsip |  GUESS   | https://release-monitoring.org/project/15701 | 2.7.2        | 2.9          |     
                        libpng |  GUESS   | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  GUESS   | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                       librsvg |  GUESS   | https://release-monitoring.org/project/05420 | 2.40.20      | 2.45.91      |     
                      librsync |  GUESS   | https://release-monitoring.org/project/06309 | 2.0.2        | 2.1.0        |     
                       librtas |  GUESS   | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                     librtlsdr |  GUESS   | https://release-monitoring.org/project/15172 | 0.6.0        | 0.7.0        |     
                    libselinux |  GUESS   | https://release-monitoring.org/project/01717 | 2.9          | 20190315     |     
                   libsemanage |  GUESS   | https://release-monitoring.org/project/01718 | 2.9          | 20190315     |     
                      libsepol |  GUESS   | https://release-monitoring.org/project/01719 | 2.9          | 20190315     |     
                     libsodium |  GUESS   | https://release-monitoring.org/project/01728 | 1.0.17       | 1.0.18       |     
                       libsoup |  GUESS   | https://release-monitoring.org/project/11483 | 2.62.3       | 2.67.91      |     
                      libtasn1 |  GUESS   | https://release-monitoring.org/project/01734 | 4.13         | 4.14         | ORPH
                     libtheora |  GUESS   | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                     libunwind |  GUESS   | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                 libusb-compat |  GUESS   | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       | ORPH
                         libuv |  GUESS   | https://release-monitoring.org/project/10784 | 1.30.1       | 1.31.0       |     
                        libvpx |  GUESS   | https://release-monitoring.org/project/11083 | 1.8.0        | 1.8.1        |     
                 libwebsockets |  GUESS   | https://release-monitoring.org/project/11181 | 2.4.2        | 3.2.0        |     
                        libwpe |  GUESS   | https://release-monitoring.org/project/17789 | 1.2.0        | 1.3.1        |     
                        libxcb |  GUESS   | https://release-monitoring.org/project/01767 | 1.13         | 1.13.1       |     
                  libxkbcommon |  GUESS   | https://release-monitoring.org/project/01780 | 0.8.3        | 0.8.4        |     
                       libyaml |  GUESS   | https://release-monitoring.org/project/13522 | 0.2.1        | 0.2.2        | ORPH
                      lighttpd |  GUESS   | https://release-monitoring.org/project/01817 | 1.4.53       | 1.4.54       |     
                         links |  GUESS   | https://release-monitoring.org/project/01822 | 2.14         | 2.19         | ORPH
                      linphone |  GUESS   | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  GUESS   | https://release-monitoring.org/project/01827 | 1.6.0        | 1.6.1        |     
                    liquid-dsp |  GUESS   | https://release-monitoring.org/project/14535 | 1.3.0        | 1.3.2        |     
                       live555 |  GUESS   | https://release-monitoring.org/project/12414 | 2019.03.06   | 2019.08.16   | ORPH
                         lldpd |  GUESS   | https://release-monitoring.org/project/14019 | 1.0.3        | 1.0.4        |     
                          llvm |  GUESS   | https://release-monitoring.org/project/01830 | 8.0.0        | 8.0.1        |     
                lockfile-progs |  GUESS   | https://release-monitoring.org/project/10135 | 0.1.17       | 0.1.18       | ORPH
                          lpty |  GUESS   | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                          lsof |  GUESS   | https://release-monitoring.org/project/01844 | 4.91         | 4.93.2       | ORPH
                        lsscsi |  GUESS   | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                 lttng-modules |  DISTRO  | https://release-monitoring.org/project/07141 | 2.10.6       | 2.10.10      |     
                   lttng-tools |  DISTRO  | https://release-monitoring.org/project/07136 | 2.10.5       | 2.10.7       |     
                           lua |  GUESS   | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  GUESS   | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                       luaossl |  GUESS   | https://release-monitoring.org/project/11690 | 20190612-0   | 20190731     |     
                      luksmeta |  GUESS   | https://release-monitoring.org/project/11763 | 8            | 9            |     
                           lxc |  GUESS   | https://release-monitoring.org/project/01860 | 3.1.0        | 3.2.1        |     
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  GUESS   | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.1        | ORPH
                          lzip |  GUESS   | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  GUESS   | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  GUESS   | https://release-monitoring.org/project/01887 | 10.3.16      | 10.4.7       |     
                            mc |  GUESS   | https://release-monitoring.org/project/01954 | 4.8.20       | 4.8.23       |     
                        mcelog |  GUESS   | https://release-monitoring.org/project/08093 | v153         | 164          |     
                     memcached |  GUESS   | https://release-monitoring.org/project/01965 | 1.5.12       | 1.5.16       | ORPH
                      metacity |  GUESS   | https://release-monitoring.org/project/15392 | 2.25.1       | 3.32.0       | ORPH
                   micropython |  GUESS   | https://release-monitoring.org/project/10539 | 1.9.4        | 1.11         |     
                        midori |  GUESS   | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                          mksh |  GUESS   | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                        moarvm |  GUESS   | https://release-monitoring.org/project/21100 | 2019.03      | 2019.07.1    |     
mobile-broadband-provider-info |  GUESS   | https://release-monitoring.org/project/10267 | 20190116     | 20190618     | ORPH
                       mongodb |  GUESS   | https://release-monitoring.org/project/02008 | r4.0.6       | 4.0.3        |     
                         monit |  GUESS   | https://release-monitoring.org/project/05483 | 5.25.3       | 5.26.0       |     
                          mono |  GUESS   | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.0.0.319    |     
                        motion |  GUESS   | https://release-monitoring.org/project/20616 | 4.2.1        | 4.2.2        |     
                           mpd |  GUESS   | https://release-monitoring.org/project/14864 | 0.21.11      | 0.21.13      |     
                     mpdecimal |  GUESS   | https://release-monitoring.org/project/11578 | 2.4.1        | 2.4.2        |     
                         msmtp |  GUESS   | https://release-monitoring.org/project/02024 | 1.8.3        | 1.8.5        |     
                         mtdev |  GUESS   | https://release-monitoring.org/project/08868 | 1.1.4        | 1.1.5        |     
                          mutt |  GUESS   | https://release-monitoring.org/project/02035 | 1.11.4       | 1.12.1       |     
                          ncdu |  GUESS   | https://release-monitoring.org/project/06045 | 1.14         | 1.14.1       |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20190817 | ORPH
                      nftables |  GUESS   | https://release-monitoring.org/project/02082 | 0.9.0        | 0.9.1        | ORPH
                       nghttp2 |  GUESS   | https://release-monitoring.org/project/08651 | 1.37.0       | 1.39.2       |     
                         nginx |  GUESS   | https://release-monitoring.org/project/05413 | 1.16.0       | 1.17.3       |     
                         ngrep |  GUESS   | https://release-monitoring.org/project/02084 | 1_47         | 1.45         |     
                          nmap |  GUESS   | https://release-monitoring.org/project/02096 | 7.70         | 7.80         | ORPH
                          nmon |  GUESS   | https://release-monitoring.org/project/02097 | 16g          | 16k          | ORPH
                        nodejs |  GUESS   | https://release-monitoring.org/project/08251 | 10.15.3      | 12.8.1       |     
                      nss-mdns |  GUESS   | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                        nuttcp |  GUESS   | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                         ofono |  GUESS   | https://release-monitoring.org/project/16859 | 1.29         | 1.30         | ORPH
                      openblas |  GUESS   | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                      openipmi |  GUESS   | https://release-monitoring.org/project/02549 | 2.0.24       | 2.0.27       |     
                      openldap |  GUESS   | https://release-monitoring.org/project/02551 | 2.4.47       | 2.4.48       |     
                       openmpi |  GUESS   | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.1        | ORPH
                       openpgm |  GUESS   | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                       pangomm |  GUESS   | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                      patchelf |  GUESS   | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  GUESS   | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  GUESS   | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                        physfs |  GUESS   | https://release-monitoring.org/project/03631 | 3.0.1        | 3.0.2        |     
                      pinentry |  GUESS   | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  GUESS   | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                      pngquant |  GUESS   | https://release-monitoring.org/project/03674 | 2.12.3       | 2.12.5       |     
                          poco |  GUESS   | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.2        |     
               policycoreutils |  GUESS   | https://release-monitoring.org/project/03680 | 2.9          | 20190315     |     
                        polkit |  GUESS   | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  GUESS   | https://release-monitoring.org/project/03686 | 0.77.0       | 0.79.0       |     
                     portaudio |  GUESS   | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  GUESS   | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  GUESS   | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                      protobuf |  GUESS   | https://release-monitoring.org/project/03715 | 3.6.0        | 3.9.1        |     
                    protobuf-c |  GUESS   | https://release-monitoring.org/project/03716 | 1.3.0        | 1.3.2        |     
                proxychains-ng |  GUESS   | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                    pulseaudio |  GUESS   | https://release-monitoring.org/project/03729 | 12.2         | 12.99.2      |     
                            pv |  GUESS   | https://release-monitoring.org/project/03736 | 1.6.0        | 1.6.6        | ORPH
                        python |  GUESS   | https://release-monitoring.org/project/13254 | 2.7.16       | 3.8.0        |     
              python-alsaaudio |  GUESS   | https://release-monitoring.org/project/10072 | 0.8.2        | 0.8.4        |     
                    python-can |  GUESS   | https://release-monitoring.org/project/17873 | 3.3.1        | 3.3.2        |     
                python-cheroot |  GUESS   | https://release-monitoring.org/project/20163 | 5.10.0       | 6.5.6        |     
              python-daemonize |  GUESS   | https://release-monitoring.org/project/12761 | 2.4.7        | 2.5.0        |     
               python-engineio |  GUESS   | https://release-monitoring.org/project/15064 | 3.3.0        | 3.9.3        |     
                python-futures |  DISTRO  | https://release-monitoring.org/project/06595 | 3.2.0        | 3.3.0        |     
                 python-ipaddr |  DISTRO  | https://release-monitoring.org/project/12022 | 2.1.11       | 2.2.0        |     
               python-iptables |  GUESS   | https://release-monitoring.org/project/11475 | 0.13.0       | 0.14.0       |     
         python-jaraco-classes |  GUESS   | https://release-monitoring.org/project/20150 | 1.4.3        | 2.0          |     
               python-oauthlib |  DISTRO  | https://release-monitoring.org/project/05377 | 3.0.2        | 3.1.0        |     
                    python-pam |  GUESS   | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                python-portend |  GUESS   | https://release-monitoring.org/project/20203 | 1.8          | 2.5          |     
             python-ptyprocess |  GUESS   | https://release-monitoring.org/project/06446 | 0.5.1        | 0.6.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
         python-setuptools-scm |  DISTRO  | https://release-monitoring.org/project/07874 | 3.2.0        | 3.3.3        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
                  python-webpy |  DISTRO  | https://release-monitoring.org/project/04090 | 0.39         | 0.40.dev1    |     
                   python-xlrd |  GUESS   | https://release-monitoring.org/project/15107 | 1.0.0        | 1.2.0        |     
                   python-xlwt |  GUESS   | https://release-monitoring.org/project/15108 | 1.2.0        | 1.3.0        |     
              python-xmltodict |  GUESS   | https://release-monitoring.org/project/15109 | 0.11.0       | 0.12.0       |     
                          qpdf |  GUESS   | https://release-monitoring.org/project/05542 | 8.4.0        | 8.4.2        |     
                   qpid-proton |  GUESS   | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                           qwt |  GUESS   | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
                        ranger |  GUESS   | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                     refpolicy |  GUESS   | https://release-monitoring.org/project/15707 | 2.20190201   | 20081014     |     
                   restorecond |  GUESS   | https://release-monitoring.org/project/16520 | 2.9          | 20190315     |     
                     rng-tools |  GUESS   | https://release-monitoring.org/project/04202 | 5            | 6.7          |     
                           rpm |  GUESS   | https://release-monitoring.org/project/15204 | 4.14.2.1     | 4.15.0-beta1 |     
                       rrdtool |  GUESS   | https://release-monitoring.org/project/04214 | 1.7.0        | 1.7.2        | ORPH
                       rsyslog |  GUESS   | https://release-monitoring.org/project/04218 | 8.22.0       | 8.1907.0     |     
                          ruby |  GUESS   | https://release-monitoring.org/project/04223 | 2.4.6        | 2.6.3        | ORPH
                          rust |  GUESS   | https://release-monitoring.org/project/07635 | 1.33.0       | 1.37.0       |     
                         rygel |  GUESS   | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.1       |     
                            s6 |  GUESS   | https://release-monitoring.org/project/05485 | 2.7.1.1      | 2.9.0.0      |     
                        s6-dns |  GUESS   | https://release-monitoring.org/project/16547 | 2.3.0.0      | 2.3.0.2      |     
                 s6-linux-init |  GUESS   | https://release-monitoring.org/project/16552 | 0.4.0.0      | 1.0.2.1      |     
                s6-linux-utils |  GUESS   | https://release-monitoring.org/project/16551 | 2.5.0.0      | 2.5.0.1      |     
                 s6-networking |  GUESS   | https://release-monitoring.org/project/16550 | 2.3.0.2      | 2.3.0.4      |     
             s6-portable-utils |  GUESS   | https://release-monitoring.org/project/16549 | 2.2.1.1      | 2.2.1.3      |     
                         s6-rc |  GUESS   | https://release-monitoring.org/project/16548 | 0.4.0.1      | 0.5.0.0      |     
                        samba4 |  DISTRO  | https://release-monitoring.org/project/04758 | 4.10.6       | 4.11.0rc1    |     
                 sane-backends |  GUESS   | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                           sbc |  GUESS   | https://release-monitoring.org/project/16338 | 1.3          | 1.4          | ORPH
                         scons |  GUESS   | https://release-monitoring.org/project/04770 | 3.0.5        | 3.1.1        |     
                        scrypt |  GUESS   | https://release-monitoring.org/project/09158 | 1.2.0        | 1.4.0        |     
                        sdparm |  GUESS   | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                       skalibs |  GUESS   | https://release-monitoring.org/project/05486 | 2.6.4.0      | 2.8.1.0      |     
                         slang |  GUESS   | https://release-monitoring.org/project/04829 | 2.3.1a       | 2.3.2        | ORPH
                         smack |  GUESS   | https://release-monitoring.org/project/06120 | 1.3.1        | 4.3.4        |     
                 smartmontools |  GUESS   | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                      smcroute |  GUESS   | https://release-monitoring.org/project/17369 | 2.4.2        | 2.4.4        |     
                     smstools3 |  GUESS   | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  GUESS   | https://release-monitoring.org/project/13263 | 2.9.12       | 2.9.14.1     |     
                         socat |  GUESS   | https://release-monitoring.org/project/04848 | 1.7.3.2      | 1.7.3.3      |     
       sound-theme-freedesktop |  GUESS   | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  GUESS   | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  GUESS   | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  GUESS   | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  GUESS   | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         squid |  GUESS   | https://release-monitoring.org/project/04880 | 4.6          | 4.8          | ORPH
                         sshfs |  GUESS   | https://release-monitoring.org/project/11058 | 2.8          | 3.5.2        | ORPH
          startup-notification |  GUESS   | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                        stella |  GUESS   | https://release-monitoring.org/project/06861 | 6.0          | 6.0.1        |     
                        strace |  DISTRO  | https://release-monitoring.org/project/04897 | 5.0          | 5.2          |     
                     stress-ng |  GUESS   | https://release-monitoring.org/project/12538 | 0.09.58      | 0.10.01      |     
                    strongswan |  GUESS   | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.0        |     
                    subversion |  GUESS   | https://release-monitoring.org/project/04905 | 1.9.12       | 1.12.2       |     
                   sunxi-tools |  GUESS   | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      suricata |  GUESS   | https://release-monitoring.org/project/10925 | 4.1.3        | 5.0.0-beta1  |     
                          swig |  GUESS   | https://release-monitoring.org/project/04919 | 3.0.12       | 4.0.0        | ORPH
                        sysdig |  GUESS   | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.2       |     
                     syslog-ng |  GUESS   | https://release-monitoring.org/project/04930 | 3.19.1       | 3.22.1       |     
                       sysstat |  GUESS   | https://release-monitoring.org/project/04931 | 11.6.3       | 12.1.6       | ORPH
                       systemd |  GUESS   | https://release-monitoring.org/project/05440 | 241          | 243-rc1      |     
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  GUESS   | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                         tclap |  GUESS   | https://release-monitoring.org/project/04942 | 1.2.1        | 1.2.2        |     
                        tcllib |  GUESS   | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                   terminology |  GUESS   | https://release-monitoring.org/project/04951 | 1.4.1        | 1.5.0        |     
                          tinc |  GUESS   | https://release-monitoring.org/project/07716 | 1.0.35       | 1.1pre14     |     
                       tinyxml |  GUESS   | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                      tinyxml2 |  GUESS   | https://release-monitoring.org/project/04976 | 7.0.1        | 7.1.0        |     
                            tk |  GUESS   | https://release-monitoring.org/project/11426 | 8.6.6        | 8.7a1        |     
                          tmux |  GUESS   | https://release-monitoring.org/project/04980 | 2.8          | 3.0          |     
                    tpm2-abrmd |  GUESS   | https://release-monitoring.org/project/16819 | 2.0.3        | 2.2.0        |     
                    tpm2-tools |  GUESS   | https://release-monitoring.org/project/12841 | 3.1.4        | 3.2.1-rc0    |     
                     tpm2-totp |  GUESS   | https://release-monitoring.org/project/18790 | 0.1.1        | 0.1.2        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.0        |     
                     trace-cmd |  GUESS   | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                          tree |  GUESS   | https://release-monitoring.org/project/05006 | 1.7.0        | 1.8.0        | ORPH
                        tzdata |  GUESS   | https://release-monitoring.org/project/05021 | 2018e        | 2019b        |     
                      udftools |  GUESS   | https://release-monitoring.org/project/15774 | 2.0          | 2.1          |     
                         unrar |  GUESS   | https://release-monitoring.org/project/13306 | 5.6.4        | 5.7.5        | ORPH
                         unscd |  GUESS   | https://release-monitoring.org/project/07070 | 0.52         | 0.53         |     
                        upower |  GUESS   | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.7       |     
                           upx |  GUESS   | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                      usbredir |  GUESS   | https://release-monitoring.org/project/16012 | 0.7.1        | 0.8.0        |     
                          vala |  GUESS   | https://release-monitoring.org/project/05065 | 0.34.7       | 0.45.90      | ORPH
                           vdr |  GUESS   | https://release-monitoring.org/project/05069 | 2.4.0        | 2.4.1        |     
                           vim |  GUESS   | https://release-monitoring.org/project/05092 | 8.1.0133     | 8.1.1888     | ORPH
                        vnstat |  GUESS   | https://release-monitoring.org/project/07283 | 1.17         | 2.4          |     
                           vte |  GUESS   | https://release-monitoring.org/project/04674 | 0.48.3       | 3.3.7        | ORPH
                           waf |  GUESS   | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  GUESS   | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  GUESS   | https://release-monitoring.org/project/05355 | 2.24.3       | 2.25.4       |     
       webrtc-audio-processing |  GUESS   | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  GUESS   | https://release-monitoring.org/project/13745 | 6.0.1        | 6.0.93       |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.4.3        | 5.5.0        |     
                     wireguard |  GUESS   | https://release-monitoring.org/project/13481 | 0.0.20190601 | 0.0.20190702 | ORPH
                     wireshark |  GUESS   | https://release-monitoring.org/project/05137 | 3.0.2        | 3.1.0        | ORPH
                wpa_supplicant |  GUESS   | https://release-monitoring.org/project/05146 | 2.7          | 2.9          |     
                wpebackend-fdo |  GUESS   | https://release-monitoring.org/project/17547 | 1.2.1        | 1.3.1        |     
                     wpewebkit |  GUESS   | https://release-monitoring.org/project/17557 | 2.24.2       | 2.25.2       |     
                          x265 |  GUESS   | https://release-monitoring.org/project/07275 | 3.0          | 3.1.1        |     
                       xdotool |  DISTRO  | https://release-monitoring.org/project/08648 | 3.20150503.1 | 3.20160805.1 |     
                           xen |  GUESS   | https://release-monitoring.org/project/05181 | 4.11.2       | 4.12.1       |     
                      xfsprogs |  GUESS   | https://release-monitoring.org/project/05188 | 4.18.0       | 5.2.0        | ORPH
                        xinetd |  GUESS   | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.04         | ORPH
                xtables-addons |  GUESS   | https://release-monitoring.org/project/07736 | 2.12         | 3.3          | ORPH
                         xterm |  GUESS   | https://release-monitoring.org/project/05272 | 327          | 348          | ORPH
                        xvisor |  DISTRO  | https://release-monitoring.org/project/18448 | 0.2.9        | 0.2.11       |     
                        xxhash |  GUESS   | https://release-monitoring.org/project/17583 | 0.6.5        | 0.7.1        | ORPH
                            xz |  GUESS   | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
               zd1211-firmware |  GUESS   | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                           zic |  DISTRO  | https://release-monitoring.org/project/16905 | 2018e        | 2019b        |     
                           zsh |  GUESS   | https://release-monitoring.org/project/05307 | 5.6.2        | 5.7.1        |     

-- 
http://autobuild.buildroot.net
