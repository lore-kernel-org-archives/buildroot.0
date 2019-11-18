From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 07:17:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2019-11-17
Message-ID: <20191118071807.2C3658627E@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2019-11-17
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  2  |  0  | 15  |
  2019.08.x  |  6  |  5  |  0  | 11  |
    master   | 134 | 42  |  0  | 176 |
     next    |  8  |  9  |  0  | 17  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gerbera-1.3.2 | 5 
              host-grpc-1.23.0 | 3 
                snort-2.9.14.1 | 3 
                 xvisor-0.2.11 | 3 
am33x-cm3-11107db2f1e9e58ee... | 2 
                       kmod-26 | 2 
                libselinux-2.9 | 2 
                    mpv-0.29.1 | 2 
                oprofile-1.3.0 | 2 
                qt5base-5.12.5 | 2 
                 acsccid-1.1.7 | 1 
                  cmocka-1.1.5 | 1 
              fstrcmp-0.7.D001 | 1 
                host-go-1.13.3 | 1 
host-google-breakpad-7515ab... | 1 
          imagemagick-7.0.8-59 | 1 
                libdrm-2.4.100 | 1 
               libupnpp-0.17.2 | 1 
                 libv4l-1.18.0 | 1 
           libwebsockets-3.2.0 | 1 
        ltp-testsuite-20190930 | 1 
mmc-utils-d40ec535b9d4e4c97... | 1 
                ramspeed-2.6.0 | 1 
                    strace-5.3 | 1 
                       unknown | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |         acsccid-1.1.7          | NOK | http://autobuild.buildroot.net/results/252fdb943215cd87972ad0b542bea0e0cbd578c8 |     
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/4c88fcf5f88e537baa336fa77299a5995db11cfe | ORPH
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/37814db31b9569ad7993f1c1b586a450bc62d333 | ORPH
  riscv64    |          cmocka-1.1.5          | NOK | http://autobuild.buildroot.net/results/30922c18150ea62aefe123d1b7cd1444efab963f |     
    arm      |        fstrcmp-0.7.D001        | NOK | http://autobuild.buildroot.net/results/767754e8ca12fd58c42c83e03d45322ca01af013 |     
  powerpc    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/a41b54f2b6cc230e27070ef7d48b9b1b67e73af4 |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/5be2265d30cf1f3c49d9ff6e292b18957f8f67dd |     
  powerpc    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/03b66462dc8c9e0da139f204194e2f1fdbc5e548 |     
  aarch64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/e77839fad16caa5798cacb36a5a48b3dbb822ea6 |     
  riscv64    |         gerbera-1.3.2          | NOK | http://autobuild.buildroot.net/results/6066ef1f1e6e98fa6164f94be283ebb21f5b7ddd |     
  mips64el   |         host-go-1.13.3         | NOK | http://autobuild.buildroot.net/results/bd94cb4c6f01a1b2c56291bca09bf1d724a42df8 |     
  aarch64    | host-google-breakpad-7515ab... | NOK | http://autobuild.buildroot.net/results/e4d03a3c76ef6b9defd72e72d92fc4597fe6224e |     
   x86_64    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/e361de8ca6ee37027603ecf6bea6a998fde154e8 |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/1430456341e67695c044ab5f5f6d6321dcce12dd |     
   mipsel    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/4b9a3b67c027d79d8ca7c807d08a435c27ceece9 |     
    arm      |      imagemagick-7.0.8-59      | NOK | http://autobuild.buildroot.net/results/0ea8aaf8855d6f73d29be6ff5cc60b8c6dac8389 | ORPH
  mips64el   |            kmod-26             | NOK | http://autobuild.buildroot.net/results/bce31e740f375354dce9040eb699410360583647 |     
 aarch64_be  |            kmod-26             | NOK | http://autobuild.buildroot.net/results/ff4b6684dc56813904078af85f3fcf78e8f6899f |     
    arc      |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/236ea7552fc77b0bcb16ca413063768fdd115d8b |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/ef2d367992b76e2f8c475fe2079efa93ee544ab6 |     
    arm      |         libselinux-2.9         | NOK | http://autobuild.buildroot.net/results/e6405a982773738ecff93f0a45031b907849039a |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/cc3ee00b3b24336c0d7d853aa179e72bf2c2ec24 |     
   x86_64    |         libv4l-1.18.0          | NOK | http://autobuild.buildroot.net/results/7c7d5d03c7a0332b51aa80c9fe9524caa999c5ac |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/cf22b8b838579fc5d98cbbf7e639760bfac28320 |     
   x86_64    |     ltp-testsuite-20190930     | NOK | http://autobuild.buildroot.net/results/854b303c31d0bc9a45bd04a5b0a0242c602e6e3a |     
powerpc64le  | mmc-utils-d40ec535b9d4e4c97... | NOK | http://autobuild.buildroot.net/results/c30a580b8a94ea79c6aee782c00515fae999ed82 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/e0c5fef1a4bb2048ebb82c36a3625291ae60a8fa |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/31b1127a4b5d14189281a64b0d8bb3aa183d811c |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/fd6e31b3c2e3b41e93048390ec18fb99178745e4 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/f8f44b0b1d54b67c9a8e6b69f1962a807bb9d0ec |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/4c45710b903d8ff3d04ed3020de3fa525be7f065 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/27367a224e652f8c90576985cd3725e6316241d8 |     
   x86_64    |         ramspeed-2.6.0         | NOK | http://autobuild.buildroot.net/results/c2f9fab78ecb0e06d7dd5f8e6848f6397c737eeb | ORPH
  mips64el   |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/0bc45d74bb7fc66f4f225bc6062df3e2b08c0e58 |     
   xtensa    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/91cdcb21b9f26f265a2c37d8df899d1ada5b8e81 |     
  riscv32    |         snort-2.9.14.1         | NOK | http://autobuild.buildroot.net/results/26e6681fddcb31e1d3b82fb23c9916827102a639 |     
    m68k     |           strace-5.3           | NOK | http://autobuild.buildroot.net/results/db6f2b167f68d146305ddd3cd249b950167c37df |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/f49535a030071cc837927be55d77a93e9bec9096 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/08b7215279f69e1929b0b2a80a21a391a3201d36 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/7a3de15ef2ddeaa276f222f7526556c7e77e5b7c |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/1a6217bb396d276ed7e93a983fec6c0e8725c519 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/62898708f04fd2a86ebb372967baa3bbbf7c7b17 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 
           host-mfgtools-v0.02 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/dccf251b6d07dc56a9ac6d6d08c9ab87f2e773c8 |     
    arm      |      host-mfgtools-v0.02       | NOK | http://autobuild.buildroot.net/results/acab1e3a0c1d31d528494456357e33821dddf86b |     


Results for branch '2019.08.x'
==============================

Classification of failures by reason
------------------------------------

                    ffmpeg-4.2 | 2 
                      icu-64-2 | 1 
                 libdrm-2.4.99 | 1 
                    mpv-0.29.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/8871aefd1cfa38a5b03ddcbfa25c7b73b249a010 |     
    or1k     |           ffmpeg-4.2           | NOK | http://autobuild.buildroot.net/results/aec90847f4cf0407ecc0e004a6b926c3115f45f0 |     
   xtensa    |            icu-64-2            | NOK | http://autobuild.buildroot.net/results/291e1739b91c9bd340fdd77210eeb100700145fa | ORPH
  riscv64    |         libdrm-2.4.99          | NOK | http://autobuild.buildroot.net/results/117f7145c057d90613fa8ff8b26d1e54af6b327c |     
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/534ce9fff1c6b5255bc161eabbe0e4d3db73ac53 |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

am33x-cm3-11107db2f1e9e58ee... | 1 
                   grpc-1.23.0 | 1 
           host-dtc-legal-info | 1 
              host-grpc-1.23.0 | 1 
                       kmod-26 | 1 
                   mimic-1.1.0 | 1 
                oprofile-1.3.0 | 1 
                 ripgrep-0.8.1 | 1 
                 rng-tools-6.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/7686bd6164aceaa1448a25c34f144f716256abd8 | ORPH
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/58b247393f4c1b8e36f2909b495bf874e9c3c298 |     
   x86_64    |      host-dtc-legal-info       | NOK | http://autobuild.buildroot.net/results/46f2a0fef40c070531c518ec23411f095f12d87a |     
  riscv32    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/5fc3cc3accac05ea75d447ecb09e27df5c924177 |     
    or1k     |            kmod-26             | NOK | http://autobuild.buildroot.net/results/9c53beab5b24357d2a1beea4ee0d35224c8b122e |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/2ec05a9bea6e8a2f7a86581e09cb129050bff151 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/eee93c0f8262da7ba0ed2a3901ebdb5e07dd1683 |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/24d17b4f54373f98a9ee8ac04090c935a881f4b4 |     
    arm      |         rng-tools-6.8          | NOK | http://autobuild.buildroot.net/results/a0a4631cc0252579b675a0c401a99239d0b97392 |     


Packages having a newer version
===============================

             name              | found by |        link to release-monitoring.org        |   version    |   upstream   | orph?
-------------------------------+----------+----------------------------------------------+--------------+--------------+-------
                 18xx-ti-utils |  GUESS   | https://release-monitoring.org/project/21391 | R8.7_SP3     | Repositories |     
            adwaita-icon-theme |  DISTRO  | https://release-monitoring.org/project/13117 | 3.22.0       | 3.34.3       |     
                      alsa-lib |  DISTRO  | https://release-monitoring.org/project/00038 | 1.1.9        | 1.2.1        |     
                    alsa-utils |  DISTRO  | https://release-monitoring.org/project/00037 | 1.1.9        | 1.2.1        |     
                 android-tools |  GUESS   | https://release-monitoring.org/project/13989 | 4.2.2+git... | 10.0.0_r14   |     
                     angularjs |  DISTRO  | https://release-monitoring.org/project/21321 | 1.7.8        | 1.7.9        |     
                     armadillo |  DISTRO  | https://release-monitoring.org/project/07006 | 7.900.1      | 9.800.2      |     
                      arp-scan |  DISTRO  | https://release-monitoring.org/project/00110 | 1.9.6        | 1.9.7        |     
                        assimp |  DISTRO  | https://release-monitoring.org/project/06988 | 4.1.0        | 5.0.0        |     
                      asterisk |  DISTRO  | https://release-monitoring.org/project/09838 | 16.6.1       | 17.0.0       |     
                   at-spi2-atk |  DISTRO  | https://release-monitoring.org/project/07840 | 2.26.2       | 2.34.1       |     
                  at-spi2-core |  DISTRO  | https://release-monitoring.org/project/07841 | 2.28.0       | 2.34.0       |     
                           atk |  DISTRO  | https://release-monitoring.org/project/00130 | 2.33.3       | 2.35.1       | ORPH
                         atkmm |  DISTRO  | https://release-monitoring.org/project/07962 | 2.24.2       | 2.29.1       |     
                          atop |  DISTRO  | https://release-monitoring.org/project/00135 | 2.4.0        | 2.5.0        |     
                        autofs |  DISTRO  | https://release-monitoring.org/project/00140 | 5.1.5        | 5.1.6        |     
                      automake |  DISTRO  | https://release-monitoring.org/project/00144 | 1.15.1       | 1.16.1       | ORPH
               azure-iot-sdk-c |  DISTRO  | https://release-monitoring.org/project/21322 | 2018-12-13   | 2019-11-1... | ORPH
                        babeld |  DISTRO  | https://release-monitoring.org/project/00154 | 1.8.4        | 1.9.1        |     
                    bandwidthd |  DISTRO  | https://release-monitoring.org/project/20544 | 2.0.1-aut... | 2.0.1        |     
                          bash |  DISTRO  | https://release-monitoring.org/project/00166 | 4.4.18       | 5.0          | ORPH
                        batctl |  DISTRO  | https://release-monitoring.org/project/14740 | 2019.3       | 2019.4       |     
                    batman-adv |  DISTRO  | https://release-monitoring.org/project/19529 | 2019.3       | 2019.4       |     
                        bcg729 |  DISTRO  | https://release-monitoring.org/project/14743 | 1.0.4        | 4.3.0        |     
                     bctoolbox |  DISTRO  | https://release-monitoring.org/project/14746 | 0.4.0        | 4.3.0-beta   | ORPH
                          bind |  DISTRO  | https://release-monitoring.org/project/14923 | 9.11.10      | 9.15.5       | ORPH
                      binutils |  DISTRO  | https://release-monitoring.org/project/07981 | 2.31.1       | 2.33.1       |     
                       bitcoin |  DISTRO  | https://release-monitoring.org/project/13618 | 0.16.3       | 0.19.0       |     
                     bitstream |  DISTRO  | https://release-monitoring.org/project/21662 | 1.4          | 1.5          |     
                    bluez-alsa |  DISTRO  | https://release-monitoring.org/project/21324 | 1.4.0        | 2.0.0        |     
                        bonnie |  DISTRO  | https://release-monitoring.org/project/00212 | 1.03e        | 1.98         | ORPH
                     bootstrap |  DISTRO  | https://release-monitoring.org/project/21578 | 4.1.0        | 4.3.1        |     
                         botan |  DISTRO  | https://release-monitoring.org/project/00214 | 2.11.0       | 2.12.1       | ORPH
                   btrfs-progs |  DISTRO  | https://release-monitoring.org/project/00227 | 5.2.1        | 5.3.1        | ORPH
                        bustle |  DISTRO  | https://release-monitoring.org/project/06428 | 0.5.4        | 0.7.5        | ORPH
                   c-periphery |  DISTRO  | https://release-monitoring.org/project/21328 | 1.1.3        | 2.0.1        |     
                         cairo |  DISTRO  | https://release-monitoring.org/project/00247 | 1.16.0       | 1.16.4       |     
                       cairomm |  DISTRO  | https://release-monitoring.org/project/07959 | 1.12.0       | 1.15.4       |     
                     cantarell |  DISTRO  | https://release-monitoring.org/project/10888 | 0.0.25       | 0.111        | ORPH
                         cargo |  DISTRO  | https://release-monitoring.org/project/07892 | 0.26.0       | 0.40.0       |     
                     cargo-bin |  DISTRO  | https://release-monitoring.org/project/07892 | 0.33.0       | 0.40.0       |     
                        ccache |  DISTRO  | https://release-monitoring.org/project/00257 | 3.7.5        | 3.7.6        | ORPH
                   checkpolicy |  DISTRO  | https://release-monitoring.org/project/00276 | 2.9          | 20191031     |     
                        clinfo |  DISTRO  | https://release-monitoring.org/project/10503 | 2.2.18.03.26 | 20170207     |     
                      collectd |  DISTRO  | https://release-monitoring.org/project/17702 | 5.9.2        | 5.10.0       |     
                 comix-cursors |  DISTRO  | https://release-monitoring.org/project/21882 | 0.8.2        | 0.9.1        | ORPH
                     coreutils |  DISTRO  | https://release-monitoring.org/project/00343 | 8.30         | 8.31         | ORPH
                          cpio |  DISTRO  | https://release-monitoring.org/project/00353 | 2.12         | 2.13         |     
                      cracklib |  DISTRO  | https://release-monitoring.org/project/00362 | 2.9.7        | 3.0pre2      |     
                        cramfs |  DISTRO  | https://release-monitoring.org/project/21408 | 1a1e65f2a049 | 2.1          |     
                    cryptsetup |  DISTRO  | https://release-monitoring.org/project/13709 | 2.0.6        | 2.2.2        |     
                  cups-filters |  DISTRO  | https://release-monitoring.org/project/05541 | 1.25.11      | 1.25.12      |     
                        dacapo |  DISTRO  | https://release-monitoring.org/project/20546 | 9.12-MR1-... | 9.12-vbump   |     
                   dahdi-linux |  DISTRO  | https://release-monitoring.org/project/21412 | 3.0.0        | 3.1.0        |     
                   dahdi-tools |  DISTRO  | https://release-monitoring.org/project/10252 | 3.0.0        | 3.1.0        |     
                         dante |  DISTRO  | https://release-monitoring.org/project/14716 | 1.4.1        | 1.4.2        |     
                          dbus |  DISTRO  | https://release-monitoring.org/project/05356 | 1.12.16      | 1.13.12      | ORPH
                         dc3dd |  DISTRO  | https://release-monitoring.org/project/15086 | 7.2.641      | 7.2.646      | ORPH
                   debianutils |  DISTRO  | https://release-monitoring.org/project/21341 | 4.8.6.3      | 4.9          | ORPH
                        dhcpcd |  DISTRO  | https://release-monitoring.org/project/11429 | 8.0.3        | 8.1.2        |     
                        dialog |  DISTRO  | https://release-monitoring.org/project/00431 | 1.3-20190808 | 1.3-20191110 | ORPH
                    docker-cli |  DISTRO  | https://release-monitoring.org/project/21076 | 18.09.9      | 19.03.5      |     
                docker-compose |  DISTRO  | https://release-monitoring.org/project/06185 | 1.24.1       | 1.25.0-rc4   |     
             docker-containerd |  DISTRO  | https://release-monitoring.org/project/16460 | 1.2.6        | 1.3.0        |     
                 docker-engine |  DISTRO  | https://release-monitoring.org/project/00447 | 18.09.9      | 19.03.5      |     
                       dovecot |  DISTRO  | https://release-monitoring.org/project/00456 | 2.3.7.2      | 2.3.8        |     
            dovecot-pigeonhole |  DISTRO  | https://release-monitoring.org/project/21418 | 0.5.7.2      | 0.5.8        |     
                    drbd-utils |  DISTRO  | https://release-monitoring.org/project/00462 | 9.2.0        | 9.11.0       |     
                            dt |  DISTRO  | https://release-monitoring.org/project/21844 | 18.32        | 21.27        | ORPH
                    efibootmgr |  DISTRO  | https://release-monitoring.org/project/00663 | 15           | 17           |     
                           efl |  DISTRO  | https://release-monitoring.org/project/06128 | 1.22.3       | 1.23.2       |     
                      ejabberd |  DISTRO  | https://release-monitoring.org/project/00667 | 18.09        | 19.09.1      |     
                           ell |  DISTRO  | https://release-monitoring.org/project/17781 | 0.24         | 0.26         |     
                         emlog |  DISTRO  | https://release-monitoring.org/project/20563 | 0.60         | 0.70         |     
                       enchant |  DISTRO  | https://release-monitoring.org/project/06601 | 1.6.0        | 2.2.7        |     
                 enlightenment |  DISTRO  | https://release-monitoring.org/project/00698 | 0.23.0       | 0.23.1       |     
                        erlang |  DISTRO  | https://release-monitoring.org/project/00707 | 21.0         | 22.1.7       |     
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
                erlang-p1-xmpp |  DISTRO  | https://release-monitoring.org/project/12752 | 1.2.5        | 1.4.2        |     
                erlang-p1-yaml |  DISTRO  | https://release-monitoring.org/project/10243 | 1.0.17       | 1.0.21       |     
                erlang-p1-zlib |  DISTRO  | https://release-monitoring.org/project/09283 | 1.0.4        | 1.0.6        |     
                      fakeroot |  DISTRO  | https://release-monitoring.org/project/12048 | 1.20.2       | 1.24         | ORPH
                        fatcat |  DISTRO  | https://release-monitoring.org/project/21349 | 1.0.6        | 1.1.0        |     
                       flannel |  DISTRO  | https://release-monitoring.org/project/07421 | 0.5.5        | 0.11.0       |     
                  flare-engine |  DISTRO  | https://release-monitoring.org/project/21433 | 1.0          | 1.11         |     
                    flare-game |  DISTRO  | https://release-monitoring.org/project/21434 | 1.0          | 1.11         |     
                         flite |  DISTRO  | https://release-monitoring.org/project/14809 | 1.4          | 2.1.0        |     
                          flot |  DISTRO  | https://release-monitoring.org/project/07184 | 0.8.3        | 4.1.0        | ORPH
                           fmt |  DISTRO  | https://release-monitoring.org/project/11526 | 5.3.0        | 6.0.0        |     
                  font-awesome |  DISTRO  | https://release-monitoring.org/project/00826 | 4.7.0        | 5.11.2       | ORPH
                    fontconfig |  DISTRO  | https://release-monitoring.org/project/00827 | 2.13.1       | 2.13.92      | ORPH
                          fwts |  DISTRO  | https://release-monitoring.org/project/17383 | 19.09.00     | 19.11.00     |     
                          fwup |  DISTRO  | https://release-monitoring.org/project/21438 | 1.2.5        | 1.5.0        |     
                           gcr |  DISTRO  | https://release-monitoring.org/project/11801 | 3.28.1       | 3.34.0       | ORPH
                    gdk-pixbuf |  DISTRO  | https://release-monitoring.org/project/09533 | 2.36.10      | 2.40.0       | ORPH
                       gerbera |  DISTRO  | https://release-monitoring.org/project/18420 | 1.3.2        | 1.3.4        |     
                   gettext-gnu |  DISTRO  | https://release-monitoring.org/project/00898 | 0.19.8.1     | 0.20.1       | ORPH
               glib-networking |  DISTRO  | https://release-monitoring.org/project/21353 | 2.61.1       | 2.63.1       |     
                        glibmm |  DISTRO  | https://release-monitoring.org/project/07960 | 2.62.0       | 2.63.1       |     
                           glm |  DISTRO  | https://release-monitoring.org/project/01181 | 0.9.9.5      | 0.9.9.6      | ORPH
                       gnu-efi |  DISTRO  | https://release-monitoring.org/project/01202 | 3.0.10       | 3.0.11       |     
                       gnuplot |  DISTRO  | https://release-monitoring.org/project/01216 | 5.0.6        | 5.2.8beta    |     
                      gnuradio |  DISTRO  | https://release-monitoring.org/project/01217 | 3.7.13.5     | 3.8.0.0      |     
                            go |  DISTRO  | https://release-monitoring.org/project/01227 | 1.13.3       | 1.13.4       |     
                           gpm |  DISTRO  | https://release-monitoring.org/project/01242 | 1.20.7       | 1.99.7       |     
                       granite |  DISTRO  | https://release-monitoring.org/project/05410 | 0.4.1        | 5.2.5        | ORPH
                     graphite2 |  DISTRO  | https://release-monitoring.org/project/10951 | 1.3.10       | 1.3.13       | ORPH
                          grpc |  DISTRO  | https://release-monitoring.org/project/19117 | 1.23.0       | 1.25.0       |     
     gsettings-desktop-schemas |  DISTRO  | https://release-monitoring.org/project/13139 | 3.33.1       | 3.34.0       | ORPH
                           gsl |  DISTRO  | https://release-monitoring.org/project/01267 | 2.5          | 2.6          | ORPH
                         gssdp |  DISTRO  | https://release-monitoring.org/project/01262 | 1.0.3        | 1.2.1        |     
               gst-plugins-bad |  GUESS   | https://release-monitoring.org/project/21849 | 0.10.23      | 1.16.1       | ORPH
              gst-plugins-base |  GUESS   | https://release-monitoring.org/project/21850 | 0.10.36      | 1.16.1       | ORPH
              gst-plugins-good |  GUESS   | https://release-monitoring.org/project/21852 | 0.10.31      | 1.16.1       | ORPH
              gst-plugins-ugly |  GUESS   | https://release-monitoring.org/project/15187 | 0.10.19      | 1.16.1       | ORPH
                     gstreamer |  GUESS   | https://release-monitoring.org/project/01263 | 0.10.36      | 1.16.1       | ORPH
                  gtk2-engines |  DISTRO  | https://release-monitoring.org/project/13141 | 2.20.2       | 2.91.1       | ORPH
                        gtkmm3 |  DISTRO  | https://release-monitoring.org/project/07963 | 3.22.0       | 3.95.1       |     
                 gtksourceview |  DISTRO  | https://release-monitoring.org/project/07724 | 3.24.7       | 4.4.0        |     
                         guile |  DISTRO  | https://release-monitoring.org/project/01277 | 2.0.14       | 2.2.6        | ORPH
                         gupnp |  DISTRO  | https://release-monitoring.org/project/01281 | 1.0.4        | 1.2.1        |     
                   gupnp-tools |  DISTRO  | https://release-monitoring.org/project/01284 | 0.8.15       | 0.10.0       |     
                    gutenprint |  DISTRO  | https://release-monitoring.org/project/01285 | 5.2.14       | 5.3.3        | ORPH
                          gvfs |  DISTRO  | https://release-monitoring.org/project/05496 | 1.31.4       | 1.43.1       | ORPH
                       haproxy |  DISTRO  | https://release-monitoring.org/project/01298 | 2.0.5        | 2.0.9        |     
                      harfbuzz |  DISTRO  | https://release-monitoring.org/project/01299 | 2.5.3        | 2.6.4        | ORPH
            hicolor-icon-theme |  DISTRO  | https://release-monitoring.org/project/01316 | 0.15         | 0.17         |     
                         hplip |  DISTRO  | https://release-monitoring.org/project/01327 | 3.17.10      | 3.19.11      | ORPH
                          htop |  DISTRO  | https://release-monitoring.org/project/01332 | 2.2.0        | 3.0.0beta5   | ORPH
                        hwdata |  DISTRO  | https://release-monitoring.org/project/05387 | 0.326        | 0.329        | ORPH
                         hwloc |  DISTRO  | https://release-monitoring.org/project/13501 | 1.11.13      | 2.1.0        |     
                          i2pd |  DISTRO  | https://release-monitoring.org/project/21355 | 2.24.0       | 2.29.0       |     
                           icu |  DISTRO  | https://release-monitoring.org/project/16134 | 64-2         | 65-1         | ORPH
                      ifupdown |  DISTRO  | https://release-monitoring.org/project/21673 | 0.8.16       | 0.8.35       | ORPH
                   imagemagick |  DISTRO  | https://release-monitoring.org/project/01372 | 7.0.8-59     | 7.0.9-5      | ORPH
                  intel-gmmlib |  DISTRO  | https://release-monitoring.org/project/20342 | 19.2.3       | 19.3.4       |     
             intel-mediadriver |  DISTRO  | https://release-monitoring.org/project/20341 | 19.2.1       | 19.3.1       |     
                intel-mediasdk |  DISTRO  | https://release-monitoring.org/project/21814 | 19.2.1       | 19.4.pre2    |     
               intel-microcode |  DISTRO  | https://release-monitoring.org/project/20614 | 20190918     | 20191115     |     
                        iozone |  DISTRO  | https://release-monitoring.org/project/21679 | 3_487        | 3.487        |     
                      ipmiutil |  DISTRO  | https://release-monitoring.org/project/01391 | 3.1.3        | 3.1.4        |     
                      iprutils |  DISTRO  | https://release-monitoring.org/project/21678 | 2.4.15.1     | 2.4.18.1     | ORPH
                         ipset |  DISTRO  | https://release-monitoring.org/project/01393 | 7.2          | 7.4          | ORPH
                         irssi |  DISTRO  | https://release-monitoring.org/project/01404 | 1.0.8        | 1.3-dev      |     
                           isl |  DISTRO  | https://release-monitoring.org/project/13286 | 0.18         | 0.22         | ORPH
                           iwd |  DISTRO  | https://release-monitoring.org/project/18380 | 0.22         | 1.1          |     
                         jack2 |  DISTRO  | https://release-monitoring.org/project/21358 | 1.9.12       | 1.9.13       |     
                     jailhouse |  DISTRO  | https://release-monitoring.org/project/21359 | 0.10         | 0.11         | ORPH
                 janus-gateway |  DISTRO  | https://release-monitoring.org/project/15715 | 0.7.3        | 0.7.5        |     
                        jimtcl |  DISTRO  | https://release-monitoring.org/project/01459 | 0.75         | 0.78         |     
                            jo |  DISTRO  | https://release-monitoring.org/project/18855 | 1.2          | 1.3          |     
                    jpeg-turbo |  DISTRO  | https://release-monitoring.org/project/01648 | 2.0.2        | 2.0.3        |     
                        jquery |  DISTRO  | https://release-monitoring.org/project/07362 | 1.11.2       | 1.12.4       | ORPH
         jquery-datetimepicker |  DISTRO  | https://release-monitoring.org/project/13910 | 2.4.5        | 2.5.20       |     
               jquery-keyboard |  DISTRO  | https://release-monitoring.org/project/21681 | 1.18.12      | 1.30.1       | ORPH
                     jquery-ui |  DISTRO  | https://release-monitoring.org/project/21815 | 1.10.4       | 1.12.1       |     
              jquery-ui-themes |  DISTRO  | https://release-monitoring.org/project/21816 | 1.10.4       | 1.12.1       |     
             jquery-validation |  DISTRO  | https://release-monitoring.org/project/21817 | 1.14.0       | 1.19.1       | ORPH
           json-for-modern-cpp |  DISTRO  | https://release-monitoring.org/project/11152 | 3.7.0        | 3.7.3        |     
                       jsoncpp |  DISTRO  | https://release-monitoring.org/project/07483 | 1.9.1        | 1.9.2        |     
                           kbd |  DISTRO  | https://release-monitoring.org/project/01492 | 2.0.4        | 2.2.0        | ORPH
                    keepalived |  DISTRO  | https://release-monitoring.org/project/01504 | 2.0.15       | 2.0.19       |     
                         kexec |  DISTRO  | https://release-monitoring.org/project/12689 | 2.0.18       | 2.0.20       | ORPH
                      keyutils |  DISTRO  | https://release-monitoring.org/project/17740 | 1.6          | 1.6.1        |     
                           kf5 |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.64         | ORPH
       kf5-extra-cmake-modules |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.64         |     
               kf5-kcoreaddons |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.64         |     
           kf5-modemmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.64         |     
         kf5-networkmanager-qt |  DISTRO  | https://release-monitoring.org/project/08762 | 5.47.0       | 5.64         |     
                        kismet |  DISTRO  | https://release-monitoring.org/project/06966 | 2016-07-R1   | 2019-09-R1   | ORPH
                          kodi |  DISTRO  | https://release-monitoring.org/project/20547 | 17.6-Krypton | 18.5-Leia    |     
        kodi-jsonschemabuilder |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.5-Leia    |     
      kodi-peripheral-joystick |  DISTRO  | https://release-monitoring.org/project/21793 | 1.3.4        | 17beta1      |     
              kodi-pvr-argustv |  DISTRO  | https://release-monitoring.org/project/21788 | 2.5.6-Kry... | 4.1.0-Matrix |     
              kodi-pvr-dvblink |  DISTRO  | https://release-monitoring.org/project/21787 | 3.4.5v2-K... | 5.2.0-Matrix |     
            kodi-pvr-dvbviewer |  DISTRO  | https://release-monitoring.org/project/21786 | 2.4.14-Kr... | 4.1.0-Matrix |     
               kodi-pvr-filmon |  DISTRO  | https://release-monitoring.org/project/21785 | 1.4.8-Kry... | 3.1.0-Matrix |     
            kodi-pvr-hdhomerun |  DISTRO  | https://release-monitoring.org/project/21784 | 2.4.7-Kry... | 4.1.0-Matrix |     
           kodi-pvr-iptvsimple |  DISTRO  | https://release-monitoring.org/project/21782 | 2.4.14-Kr... | 4.7.1-Matrix |     
 kodi-pvr-mediaportal-tvserver |  DISTRO  | https://release-monitoring.org/project/21781 | 2.4.19v2-... | 4.2.0-Matrix |     
              kodi-pvr-nextpvr |  DISTRO  | https://release-monitoring.org/project/21779 | 2.4.13-Kr... | 4.2.0-Matrix |     
                 kodi-pvr-njoy |  DISTRO  | https://release-monitoring.org/project/21778 | 2.4.3-Kry... | 4.1.0-Matrix |     
                 kodi-pvr-pctv |  DISTRO  | https://release-monitoring.org/project/21777 | 1.4.7-Kry... | 3.1.0-Matrix |     
              kodi-pvr-stalker |  DISTRO  | https://release-monitoring.org/project/21776 | 2.8.6-Kry... | 4.1.1-Matrix |     
                 kodi-pvr-vbox |  DISTRO  | https://release-monitoring.org/project/21775 | 3.6.10-Kr... | 5.5.1-Matrix |     
               kodi-pvr-vuplus |  DISTRO  | https://release-monitoring.org/project/21773 | 2.4.12-Kr... | 4.9.4-Matrix |     
                  kodi-pvr-wmc |  DISTRO  | https://release-monitoring.org/project/21772 | 1.4.9v2-K... | 3.2.1-Matrix |     
         kodi-screensaver-rsxs |  DISTRO  | https://release-monitoring.org/project/21760 | 1.3.0        | 1.4.0        |     
            kodi-texturepacker |  DISTRO  | https://release-monitoring.org/project/05511 | 17.6-Krypton | 18.5-Leia    |     
                       kvazaar |  DISTRO  | https://release-monitoring.org/project/12418 | 1.2.0        | 1.3.0        |     
                          kyua |  DISTRO  | https://release-monitoring.org/project/16901 | 0.11         | 0.13         | ORPH
                          lame |  DISTRO  | https://release-monitoring.org/project/12523 | 3.100        | 398          |     
                       lensfun |  DISTRO  | https://release-monitoring.org/project/01548 | 0.3.2        | 0.3.95       |     
                     libcap-ng |  DISTRO  | https://release-monitoring.org/project/01570 | 0.7.9        | 0.7.10       |     
                        libcgi |  DISTRO  | https://release-monitoring.org/project/21164 | 1.1          | 1.3.0        | ORPH
                       libcoap |  DISTRO  | https://release-monitoring.org/project/21471 | 4.2.0        | 4.2.1        |     
                       libdnet |  DISTRO  | https://release-monitoring.org/project/06308 | 1.11         | 1.12         | ORPH
                    libeXosip2 |  DISTRO  | https://release-monitoring.org/project/21475 | 3.6.0        | 5.1.0        | ORPH
                       libedit |  DISTRO  | https://release-monitoring.org/project/01599 | 20180525-3.1 | 20191025-3.1 |     
                      libesmtp |  DISTRO  | https://release-monitoring.org/project/21685 | 1.0.6        | 1.0.7rc1     | ORPH
                        libffi |  DISTRO  | https://release-monitoring.org/project/01611 | 3.3-rc0      | 3.3-rc2      |     
                  libfreeimage |  DISTRO  | https://release-monitoring.org/project/10655 | 3.17.0       | 3.18.0       |     
                       libfuse |  DISTRO  | https://release-monitoring.org/project/00861 | 2.9.9        | 3.8.0        | ORPH
                    libgdiplus |  DISTRO  | https://release-monitoring.org/project/06440 | 5.6          | 6.0.4        |     
                      libglade |  DISTRO  | https://release-monitoring.org/project/01174 | 2.6.4        | 3.22.1       | ORPH
                      libglib2 |  DISTRO  | https://release-monitoring.org/project/10024 | 2.62.0       | 2.63.1       |     
                       libgtk3 |  DISTRO  | https://release-monitoring.org/project/10018 | 3.24.12      | 3.94.0       |     
                      libgudev |  DISTRO  | https://release-monitoring.org/project/07735 | 232          | 233          |     
                       libical |  DISTRO  | https://release-monitoring.org/project/01637 | 1.0.1        | 3.0.6        |     
                      libiconv |  DISTRO  | https://release-monitoring.org/project/10656 | 1.15         | 1.16         | ORPH
                       libidn2 |  DISTRO  | https://release-monitoring.org/project/05597 | 2.2.0        | 2.3.0        |     
                  libimxvpuapi |  DISTRO  | https://release-monitoring.org/project/21479 | 0.10.3       | 2.0.0        |     
                      libkcapi |  DISTRO  | https://release-monitoring.org/project/16828 | 1.1.4        | 1.1.5        | ORPH
                   liblockfile |  DISTRO  | https://release-monitoring.org/project/21484 | 1.09         | 1.16         |     
                  libmaxminddb |  DISTRO  | https://release-monitoring.org/project/07470 | 1.3.2        | 1.4.2        |     
                       libmbim |  DISTRO  | https://release-monitoring.org/project/07308 | 1.20.0       | 1.20.2       |     
                      libmhash |  DISTRO  | https://release-monitoring.org/project/21488 | 0.9.9.9      | 1.4          | ORPH
                  libminiupnpc |  DISTRO  | https://release-monitoring.org/project/01986 | 2.1          | 20091016     |     
                        libndp |  DISTRO  | https://release-monitoring.org/project/14944 | 1.6          | 1.7          |     
                       libnice |  DISTRO  | https://release-monitoring.org/project/01683 | 0.1.14       | 0.1.16       |     
                      libosip2 |  DISTRO  | https://release-monitoring.org/project/15135 | 3.6.0        | 5.1.0        | ORPH
                      libplist |  DISTRO  | https://release-monitoring.org/project/11675 | 2.0.0        | 2.1.0        |     
                        libpng |  DISTRO  | https://release-monitoring.org/project/01705 | 1.6.37       | 1.7.0beta89  |     
                        libpri |  DISTRO  | https://release-monitoring.org/project/11042 | 1.5.0        | 1.6.0        |     
                  libpwquality |  DISTRO  | https://release-monitoring.org/project/15580 | 1.4.1        | 1.4.2        |     
                       librsvg |  DISTRO  | https://release-monitoring.org/project/05420 | 2.40.20      | 2.47.1       |     
                      librsync |  DISTRO  | https://release-monitoring.org/project/06309 | 2.1.0        | 2.2.1        |     
                       librtas |  DISTRO  | https://release-monitoring.org/project/10717 | 2.0.1        | 2.0.2        |     
                    libseccomp |  DISTRO  | https://release-monitoring.org/project/13823 | 2.4.1        | 2.4.2        |     
                     libsecret |  DISTRO  | https://release-monitoring.org/project/13150 | 0.18.8       | 0.19.1       | ORPH
                    libselinux |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191031     |     
                   libsemanage |  DISTRO  | https://release-monitoring.org/project/01718 | 2.9          | 20191031     |     
                      libsepol |  DISTRO  | https://release-monitoring.org/project/01719 | 2.9          | 20191031     |     
                       libsigc |  DISTRO  | https://release-monitoring.org/project/07961 | 2.10.0       | 3.0.0        | ORPH
                       libsoup |  DISTRO  | https://release-monitoring.org/project/11483 | 2.62.3       | 2.68.2       |     
               libspatialindex |  DISTRO  | https://release-monitoring.org/project/04864 | 1.9.0        | 1.9.3        |     
                        libssh |  DISTRO  | https://release-monitoring.org/project/01729 | 0.9.0        | 0.9.2        |     
                    libstrophe |  DISTRO  | https://release-monitoring.org/project/15633 | 0.9.2        | 0.9.3        |     
                     libtheora |  DISTRO  | https://release-monitoring.org/project/11793 | 1.1.1        | 1.2.0alpha1  | ORPH
                    libtommath |  DISTRO  | https://release-monitoring.org/project/15565 | 1.1.0        | 1.2.0        |     
                     libunwind |  DISTRO  | https://release-monitoring.org/project/01748 | 1.3.1        | 4.0.10       | ORPH
                       libupnp |  DISTRO  | https://release-monitoring.org/project/21315 | 1.6.25       | 1.10.0       |     
                     libupnp18 |  DISTRO  | https://release-monitoring.org/project/21315 | 1.8.5        | 1.10.0       |     
                 libusb-compat |  DISTRO  | https://release-monitoring.org/project/01750 | 0.1.5        | 1.0.18       |     
                         libva |  DISTRO  | https://release-monitoring.org/project/01752 | 2.5.0        | 2.6.0.pre1   |     
                   libva-utils |  DISTRO  | https://release-monitoring.org/project/16334 | 2.5.0        | 2.6.0.pre1   |     
                  libxkbcommon |  DISTRO  | https://release-monitoring.org/project/01780 | 0.8.4        | 0.9.1        |     
            libxml-parser-perl |  DISTRO  | https://release-monitoring.org/project/03531 | 2.44         | 2.46         |     
                     libxmlrpc |  DISTRO  | https://release-monitoring.org/project/09024 | 1.43.08      | 1.51.05      |     
                       libxslt |  DISTRO  | https://release-monitoring.org/project/13301 | 1.1.33       | 1.1.34       |     
                      linphone |  DISTRO  | https://release-monitoring.org/project/01823 | 3.6.1        | 3.10.2       | ORPH
             linuxconsoletools |  DISTRO  | https://release-monitoring.org/project/01827 | 1.6.1        | 1.7.0        |     
                       live555 |  DISTRO  | https://release-monitoring.org/project/12414 | 2019.09.30   | 2019.11.11   | ORPH
                    lm-sensors |  DISTRO  | https://release-monitoring.org/project/01831 | 3-5-0        | 3-6-0        | ORPH
                          lpty |  DISTRO  | https://release-monitoring.org/project/11671 | 1.0.1-1      | 1.2.2        |     
                        lsscsi |  DISTRO  | https://release-monitoring.org/project/01845 | 0.30         | 0.30r154     |     
                           lua |  DISTRO  | https://release-monitoring.org/project/01847 | 5.1.5        | 5.3.5        |     
                lua-resty-http |  DISTRO  | https://release-monitoring.org/project/13887 | 0.13-0       | 0.15         |     
                        luajit |  DISTRO  | https://release-monitoring.org/project/06444 | 2.0.5        | 2.1.0-beta3  |     
                          lvm2 |  DISTRO  | https://release-monitoring.org/project/05354 | 2.02.183     | 2.03.05      | ORPH
                          lynx |  DISTRO  | https://release-monitoring.org/project/01863 | 2.8.9rel.1   | 2.9.0        |     
                           lz4 |  DISTRO  | https://release-monitoring.org/project/01865 | 1.8.3        | 1.9.2        | ORPH
                          lzip |  DISTRO  | https://release-monitoring.org/project/01866 | 1.20         | 1.21         | ORPH
                          lzop |  DISTRO  | https://release-monitoring.org/project/07486 | 1.03         | 1.04         |     
                       mariadb |  DISTRO  | https://release-monitoring.org/project/01887 | 10.3.18      | 10.4.10      |     
                        mcelog |  DISTRO  | https://release-monitoring.org/project/08093 | 165          | 166          |     
                     memcached |  DISTRO  | https://release-monitoring.org/project/01965 | 1.5.19       | 1.5.20       | ORPH
                       memtool |  DISTRO  | https://release-monitoring.org/project/21747 | 2016.10.0    | 2018.03.0    |     
                        mesa3d |  DISTRO  | https://release-monitoring.org/project/01970 | 19.2.2       | 19.3.0       |     
                mesa3d-headers |  DISTRO  | https://release-monitoring.org/project/01970 | 19.2.2       | 19.3.0       |     
                      metacity |  DISTRO  | https://release-monitoring.org/project/15392 | 2.25.1       | 3.34.1       | ORPH
                      mfgtools |  DISTRO  | https://release-monitoring.org/project/21519 | 0.02         | 2.8.0        |     
                        midori |  DISTRO  | https://release-monitoring.org/project/01974 | 0.5.11       | 6.0          | ORPH
                      mii-diag |  DISTRO  | https://release-monitoring.org/project/21748 | 2.11         | 2.11-3       |     
                         mimic |  DISTRO  | https://release-monitoring.org/project/21521 | 1.1.0        | 1.2.0.2      |     
                       minizip |  DISTRO  | https://release-monitoring.org/project/17546 | 2.9.0        | 2.9.1        |     
                          mksh |  DISTRO  | https://release-monitoring.org/project/05590 | 55           | 57           | ORPH
                       mongodb |  DISTRO  | https://release-monitoring.org/project/02008 | r4.0.12      | 4.3.1        |     
                      mongrel2 |  DISTRO  | https://release-monitoring.org/project/16904 | 1.9.2        | 1.12.2       |     
                          mono |  DISTRO  | https://release-monitoring.org/project/06360 | 6.0.0.313    | 6.4.0.198    |     
                           mpv |  DISTRO  | https://release-monitoring.org/project/05348 | 0.29.1       | 0.30.0       |     
                          mraa |  DISTRO  | https://release-monitoring.org/project/21528 | 0.9.1        | 2.0.0        |     
                         ncmpc |  DISTRO  | https://release-monitoring.org/project/02055 | 0.35         | 0.36         |     
                       ncurses |  DISTRO  | https://release-monitoring.org/project/02057 | 6.1          | 6.1-20191116 | ORPH
                          ne10 |  DISTRO  | https://release-monitoring.org/project/21532 | 1.2.0        | 1.2.1        |     
                netcat-openbsd |  DISTRO  | https://release-monitoring.org/project/21534 | debian_1.... | 1.203        |     
                       netsnmp |  DISTRO  | https://release-monitoring.org/project/02062 | 5.8          | 5.8.1.pre1   | ORPH
               network-manager |  DISTRO  | https://release-monitoring.org/project/21197 | 1.20.4       | 1.21.3-dev   | ORPH
                       nghttp2 |  DISTRO  | https://release-monitoring.org/project/08651 | 1.39.2       | 1.40.0       |     
                 nginx-dav-ext |  DISTRO  | https://release-monitoring.org/project/21809 | 0.1.0        | 3.0.0        |     
                          nmon |  DISTRO  | https://release-monitoring.org/project/02097 | 16g          | 16m          | ORPH
                        nodejs |  DISTRO  | https://release-monitoring.org/project/08251 | 12.13.0      | 13.1.0       |     
                      nss-mdns |  DISTRO  | https://release-monitoring.org/project/05491 | 0.10         | 0.14.1       | ORPH
                 nss-pam-ldapd |  DISTRO  | https://release-monitoring.org/project/21868 | 0.9.8        | 0.9.11       |     
                       numactl |  DISTRO  | https://release-monitoring.org/project/02507 | 2.0.12       | 2.0.13       | ORPH
                        nuttcp |  DISTRO  | https://release-monitoring.org/project/02511 | 6.1.2        | 8.1.4        |     
                 nvidia-driver |  DISTRO  | https://release-monitoring.org/project/21843 | 390.67       | 390.132      |     
                     ocf-linux |  DISTRO  | https://release-monitoring.org/project/21541 | 20120127     | 20171122     | ORPH
                         ofono |  DISTRO  | https://release-monitoring.org/project/16859 | 1.30         | 1.31         |     
                          olsr |  DISTRO  | https://release-monitoring.org/project/21543 | 0.9.6.1      | 0.9.8        | ORPH
                     oniguruma |  DISTRO  | https://release-monitoring.org/project/11184 | 6.9.3        | 6.9.4_rc2    |     
                      openblas |  DISTRO  | https://release-monitoring.org/project/02540 | 0.3.6        | 0.3.7        | ORPH
                       openmpi |  DISTRO  | https://release-monitoring.org/project/02554 | 4.0.0        | 4.0.2        | ORPH
                       openpgm |  DISTRO  | https://release-monitoring.org/project/06598 | release-5... | 5-2-122      |     
                        openrc |  DISTRO  | https://release-monitoring.org/project/11687 | 0.41.2       | 0.42.1       |     
               opentracing-cpp |  DISTRO  | https://release-monitoring.org/project/21553 | 1.5.1        | 1.6.0        |     
                    opentyrian |  DISTRO  | https://release-monitoring.org/project/21554 | 9c9f0ec3532b | 2.1.20130907 |     
                   openvmtools |  DISTRO  | https://release-monitoring.org/project/10998 | 10.3.5-10... | 11.0.1       |     
                  oracle-mysql |  DISTRO  | https://release-monitoring.org/project/00334 | 5.1.73       | 8.0.18       | ORPH
                           orc |  DISTRO  | https://release-monitoring.org/project/02573 | 0.4.29       | 0.4.31       |     
                       p11-kit |  DISTRO  | https://release-monitoring.org/project/02582 | 0.23.16.1    | 0.23.18.1    | ORPH
                         pango |  DISTRO  | https://release-monitoring.org/project/11783 | 1.44.6       | 1.44.7       | ORPH
                       pangomm |  DISTRO  | https://release-monitoring.org/project/07958 | 2.40.1       | 2.43.1       |     
                        parted |  DISTRO  | https://release-monitoring.org/project/02596 | 3.2          | 3.3          |     
                      patchelf |  DISTRO  | https://release-monitoring.org/project/02598 | 0.9          | 0.10         | ORPH
                     pax-utils |  DISTRO  | https://release-monitoring.org/project/02601 | 1.2.2        | 1.2.4        | ORPH
                      pciutils |  DISTRO  | https://release-monitoring.org/project/02605 | 3.5.5        | 3.6.2        | ORPH
                     pcm-tools |  DISTRO  | https://release-monitoring.org/project/21377 | 201812       | 201902       |     
                          perl |  DISTRO  | https://release-monitoring.org/project/13599 | 5.28.2       | 5.31.5       |     
perl-apache-logformat-compiler |  DISTRO  | https://release-monitoring.org/project/09186 | 0.35         | 0.36         |     
                perl-dbd-mysql |  DISTRO  | https://release-monitoring.org/project/02807 | 4.046        | 4.050        |     
             perl-http-cookies |  DISTRO  | https://release-monitoring.org/project/02974 | 6.05         | 6.07         |     
                perl-http-date |  DISTRO  | https://release-monitoring.org/project/02976 | 6.02         | 6.04         |     
       perl-http-entity-parser |  DISTRO  | https://release-monitoring.org/project/13850 | 0.21         | 0.22         |     
                perl-mail-dkim |  DISTRO  | https://release-monitoring.org/project/11868 | 0.57         | 0.58         |     
              perl-mojolicious |  DISTRO  | https://release-monitoring.org/project/05966 | 8.25         | 8.26         |     
               perl-net-ssleay |  DISTRO  | https://release-monitoring.org/project/06575 | 1.85         | 1.88         |     
                  perl-sys-cpu |  DISTRO  | https://release-monitoring.org/project/14338 | 0.52         | 0.61         |     
                perl-type-tiny |  DISTRO  | https://release-monitoring.org/project/14406 | 1.004004     | 1.006000     |     
               perl-xml-libxml |  DISTRO  | https://release-monitoring.org/project/03527 | 2.0134       | 2.0201       |     
             phidgetwebservice |  DISTRO  | https://release-monitoring.org/project/21842 | 2.1.8.201... | 2.1.9.201... |     
                   php-imagick |  DISTRO  | https://release-monitoring.org/project/17401 | 3.4.3        | 3.4.4        | ORPH
                 php-memcached |  DISTRO  | https://release-monitoring.org/project/17400 | 3.1.3        | 3.1.4        | ORPH
                      php-ssh2 |  DISTRO  | https://release-monitoring.org/project/21742 | 1.1.2        | 1.2          | ORPH
                      pinentry |  DISTRO  | https://release-monitoring.org/project/03643 | 1.0.0        | 1.1.0        | ORPH
                       pkgconf |  DISTRO  | https://release-monitoring.org/project/12753 | 1.6.1        | 1.6.3        | ORPH
                          poco |  DISTRO  | https://release-monitoring.org/project/05418 | 1.8.1        | 1.9.4        |     
               policycoreutils |  DISTRO  | https://release-monitoring.org/project/03680 | 2.9          | 20191031     |     
                        polkit |  DISTRO  | https://release-monitoring.org/project/03682 | 0.105        | 0.116        |     
                       poppler |  DISTRO  | https://release-monitoring.org/project/03686 | 0.77.0       | 0.82.0       |     
                     portaudio |  DISTRO  | https://release-monitoring.org/project/10597 | v190600_2... | 190600_20... | ORPH
                 powerpc-utils |  DISTRO  | https://release-monitoring.org/project/10715 | 1.3.5        | 1.4          | ORPH
                       privoxy |  DISTRO  | https://release-monitoring.org/project/03712 | 3.0.26       | 3.0.28       | ORPH
                       proftpd |  DISTRO  | https://release-monitoring.org/project/07609 | 1.3.6b       | 1.3.7rc2     |     
                          proj |  DISTRO  | https://release-monitoring.org/project/21570 | 6.2.0        | 6.2.1        |     
                       prosody |  DISTRO  | https://release-monitoring.org/project/03709 | 0.11.2       | 0.11.3       |     
                proxychains-ng |  DISTRO  | https://release-monitoring.org/project/06499 | 4.11         | 4.14         | ORPH
          pru-software-support |  DISTRO  | https://release-monitoring.org/project/21825 | 5.1.0        | 5.5.0        |     
                        psmisc |  DISTRO  | https://release-monitoring.org/project/03721 | 23.2         | 23.3         | ORPH
                          ptpd |  GUESS   | https://release-monitoring.org/project/03726 | 1.1.0        | 2.3.1        | ORPH
                       pugixml |  DISTRO  | https://release-monitoring.org/project/03728 | 1.9          | 1.10         |     
                python-aiocoap |  DISTRO  | https://release-monitoring.org/project/21243 | 0.3          | 0.4b1        |     
                python-aiohttp |  DISTRO  | https://release-monitoring.org/project/06713 | 3.5.4        | 4.0.0a1      |     
        python-aiohttp-session |  DISTRO  | https://release-monitoring.org/project/21250 | 2.8.0        | 2.9.0        |     
             python-aiomonitor |  DISTRO  | https://release-monitoring.org/project/21253 | 0.4.4        | 0.4.5        |     
                  python-arrow |  DISTRO  | https://release-monitoring.org/project/05314 | 0.15.2       | 0.15.4       |     
          python-async-timeout |  DISTRO  | https://release-monitoring.org/project/12525 | 3.0.1        | 4.0.0a2      |     
               python-autobahn |  DISTRO  | https://release-monitoring.org/project/07015 | 19.10.1      | 19.11.1      |     
                   python-cffi |  DISTRO  | https://release-monitoring.org/project/05536 | 1.13.1       | 1.13.2       |     
               python-cherrypy |  DISTRO  | https://release-monitoring.org/project/03799 | 12.0.1       | 18.4.0       |     
         python-configshell-fb |  DISTRO  | https://release-monitoring.org/project/19734 | 1.1.fb18     | 1.5          |     
               python-crossbar |  DISTRO  | https://release-monitoring.org/project/21696 | 19.1.2       | 19.11.1      |     
           python-cryptography |  DISTRO  | https://release-monitoring.org/project/05532 | 2.7          | 2.8          |     
                 python-cython |  DISTRO  | https://release-monitoring.org/project/12679 | 0.29.13      | 0.29.14      |     
                 python-daemon |  DISTRO  | https://release-monitoring.org/project/03816 | 2.2.3        | 2.2.4        |     
                 python-django |  DISTRO  | https://release-monitoring.org/project/03828 | 2.2.6        | 3.0b1        |     
                  python-ecdsa |  DISTRO  | https://release-monitoring.org/project/08370 | 0.13.3       | 0.14.1       |     
                python-gobject |  DISTRO  | https://release-monitoring.org/project/13158 | 2.28.6       | 3.34.0       |     
               python-gunicorn |  DISTRO  | https://release-monitoring.org/project/03882 | 19.9.0       | 20.0.0       |     
                python-hiredis |  DISTRO  | https://release-monitoring.org/project/12002 | 1.0.0        | 1.0.1        |     
             python-inflection |  DISTRO  | https://release-monitoring.org/project/20876 | 0.3.1        | 1.0.0        |     
             python-jsonschema |  DISTRO  | https://release-monitoring.org/project/03898 | 2.5.1        | 3.1.1        |     
                python-keyring |  DISTRO  | https://release-monitoring.org/project/03901 | 10.5.0       | 19.2.0       |     
                   python-lmdb |  DISTRO  | https://release-monitoring.org/project/15512 | 0.97         | 0.98         |     
             python-matplotlib |  DISTRO  | https://release-monitoring.org/project/03919 | 3.0.3        | 3.2.0rc1     |     
                python-mutagen |  DISTRO  | https://release-monitoring.org/project/03931 | 1.42.0       | 1.43.0       |     
               python-networkx |  DISTRO  | https://release-monitoring.org/project/07791 | 1.11         | 2.4          |     
                    python-nfc |  DISTRO  | https://release-monitoring.org/project/21829 | 0.13.5       | 1.0.3        |     
                  python-numpy |  DISTRO  | https://release-monitoring.org/project/02509 | 1.16.4       | 1.17.4       |     
              python-paho-mqtt |  DISTRO  | https://release-monitoring.org/project/06084 | 1.4.0        | 1.5.0        |     
                    python-pam |  DISTRO  | https://release-monitoring.org/project/05725 | 0.5.0        | 1.8.4        |     
                 python-pathpy |  DISTRO  | https://release-monitoring.org/project/21703 | 12.0.1       | 12.0.2       |     
                python-portend |  DISTRO  | https://release-monitoring.org/project/20203 | 2.5          | 2.6          |     
                 python-psutil |  DISTRO  | https://release-monitoring.org/project/03978 | 5.6.4        | 5.6.5        |     
                 python-pyasn1 |  DISTRO  | https://release-monitoring.org/project/06996 | 0.4.7        | 0.4.8        |     
                  python-pydal |  DISTRO  | https://release-monitoring.org/project/21582 | 18.09        | 19.04        |     
                 python-pygame |  DISTRO  | https://release-monitoring.org/project/17480 | d61ea8eabd56 | 2.0.0.dev6   |     
                  python-pyicu |  DISTRO  | https://release-monitoring.org/project/12004 | 1.9.7        | 2.4.2        |     
               python-pymodbus |  DISTRO  | https://release-monitoring.org/project/15600 | 2.2.0        | 2.3.0        |     
              python-pyopenssl |  DISTRO  | https://release-monitoring.org/project/05535 | 19.0.0       | 19.1.0       |     
              python-pyparsing |  DISTRO  | https://release-monitoring.org/project/03756 | 2.4.2        | 2.4.5        |     
               python-pyparted |  DISTRO  | https://release-monitoring.org/project/15558 | 3.11.0       | 3.11.3       |     
                  python-pyqt5 |  DISTRO  | https://release-monitoring.org/project/20104 | 5.7          | 5.13.2       |     
                   python-pyro |  DISTRO  | https://release-monitoring.org/project/19993 | 3.16         | 4.77         |     
                  python-pysmb |  DISTRO  | https://release-monitoring.org/project/21589 | 1.1.19       | 1.1.27       |     
                 python-pyudev |  DISTRO  | https://release-monitoring.org/project/08485 | 0.18         | 0.21.0       |     
                  python-pyusb |  DISTRO  | https://release-monitoring.org/project/21595 | 1.0.0        | 1.0.2        |     
                  python-pyzmq |  DISTRO  | https://release-monitoring.org/project/04104 | 18.1.0       | 18.1.1       |     
      python-requests-oauthlib |  DISTRO  | https://release-monitoring.org/project/11803 | 1.2.0        | 1.3.0        |     
              python-rtslib-fb |  DISTRO  | https://release-monitoring.org/project/19641 | 2.1.fb57     | 3.0-pre4     |     
                python-scapy3k |  DISTRO  | https://release-monitoring.org/project/21599 | 0.18         | 0.32         |     
                 python-semver |  DISTRO  | https://release-monitoring.org/project/12989 | 2.8.1        | 2.9.0        |     
             python-sentry-sdk |  DISTRO  | https://release-monitoring.org/project/21603 | 0.13.1       | 0.13.2       |     
             python-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 41.6.0       |     
                    python-sip |  DISTRO  | https://release-monitoring.org/project/13626 | 4.18         | 5.0.0        |     
             python-sqlalchemy |  DISTRO  | https://release-monitoring.org/project/04034 | 1.3.10       | 1.3.11       |     
                 python-thrift |  DISTRO  | https://release-monitoring.org/project/21614 | 0.11.0       | 0.13.0       |     
                   python-tqdm |  DISTRO  | https://release-monitoring.org/project/11524 | 4.37.0       | 4.38.0       |     
                python-twisted |  DISTRO  | https://release-monitoring.org/project/04071 | 19.7.0       | 19.10.0      |     
                 python-typepy |  DISTRO  | https://release-monitoring.org/project/21617 | 0.0.20       | 0.6.0        |     
                python-urllib3 |  DISTRO  | https://release-monitoring.org/project/04078 | 1.25.6       | 1.25.7       |     
                  python-urwid |  DISTRO  | https://release-monitoring.org/project/04079 | 2.0.1        | 2.1.0        |     
                 python-web2py |  DISTRO  | https://release-monitoring.org/project/20617 | 2.17.2       | 2.18.4       |     
             python-websockets |  DISTRO  | https://release-monitoring.org/project/08100 | 8.0.2        | 8.1          |     
             python-xlsxwriter |  DISTRO  | https://release-monitoring.org/project/12031 | 1.2.2        | 1.2.6        |     
                   python-yarl |  DISTRO  | https://release-monitoring.org/project/12895 | 1.3.0        | 1.4.0a11     |     
         python-zope-interface |  DISTRO  | https://release-monitoring.org/project/04112 | 4.6.0        | 4.7.1        |     
            python3-setuptools |  DISTRO  | https://release-monitoring.org/project/04021 | 41.4.0       | 41.6.0       |     
                          qemu |  DISTRO  | https://release-monitoring.org/project/13607 | 3.1.1.1      | 4.2.0-rc1    | ORPH
                         qhull |  DISTRO  | https://release-monitoring.org/project/21736 | 7.2.0        | 7.3.2        |     
                          qpdf |  DISTRO  | https://release-monitoring.org/project/05542 | 8.4.0        | 9.1.0        |     
                   qpid-proton |  DISTRO  | https://release-monitoring.org/project/15198 | 0.9.1        | 0.29.0       |     
                       qt5base |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                   qt5canvas3d |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5charts |  DISTRO  | https://release-monitoring.org/project/07927 | 2.1.3        | 5.13.2       |     
               qt5connectivity |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                qt5declarative |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
           qt5graphicaleffects |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
               qt5imageformats |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                   qt5location |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5multimedia |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
              qt5quickcontrols |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
             qt5quickcontrols2 |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5script |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                      qt5scxml |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                    qt5sensors |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5serialbus |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5serialport |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                        qt5svg |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                      qt5tools |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
            qt5virtualkeyboard |  DISTRO  | https://release-monitoring.org/project/07927 | 2.0          | 5.13.2       |     
                    qt5wayland |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5webchannel |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5webengine |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                     qt5webkit |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
            qt5webkit-examples |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                 qt5websockets |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                    qt5webview |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                  qt5x11extras |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                qt5xmlpatterns |  DISTRO  | https://release-monitoring.org/project/07927 | 5.6.3        | 5.13.2       |     
                           qwt |  DISTRO  | https://release-monitoring.org/project/04147 | 6.1.3        | 6.1.4        | ORPH
               rabbitmq-server |  DISTRO  | https://release-monitoring.org/project/05585 | 3.6.6        | 3.8.2-rc.1   |     
                        ranger |  DISTRO  | https://release-monitoring.org/project/07426 | 1.7.2        | 1.9.2        |     
                      rdesktop |  DISTRO  | https://release-monitoring.org/project/04172 | 1.8.4        | 1.9.0        | ORPH
                         redis |  DISTRO  | https://release-monitoring.org/project/04181 | 5.0.5        | 5.0.6        |     
                     refpolicy |  DISTRO  | https://release-monitoring.org/project/21663 | 2.20190201   | 2.20190609   |     
                   restorecond |  DISTRO  | https://release-monitoring.org/project/16520 | 2.9          | 20191031     |     
                         rhash |  DISTRO  | https://release-monitoring.org/project/13843 | 1.3.5        | 1.3.8        | ORPH
              riemann-c-client |  DISTRO  | https://release-monitoring.org/project/21389 | 1.9.1        | 1.10.4       | ORPH
                       ripgrep |  DISTRO  | https://release-monitoring.org/project/15461 | 0.8.1        | 11.0.2       |     
                       rsyslog |  DISTRO  | https://release-monitoring.org/project/04218 | 8.1910.0     | 8.1911.0     |     
                          rtai |  DISTRO  | https://release-monitoring.org/project/21658 | 4.0.1        | 5.2          | ORPH
                          ruby |  DISTRO  | https://release-monitoring.org/project/04223 | 2.4.9        | 2.6.5        | ORPH
                          runc |  DISTRO  | https://release-monitoring.org/project/07462 | 1.0.0-rc8    | 1.0.0-rc9    |     
                          rust |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.39.0       |     
                      rust-bin |  DISTRO  | https://release-monitoring.org/project/07635 | 1.33.0       | 1.39.0       |     
                         rygel |  DISTRO  | https://release-monitoring.org/project/04751 | 0.36.2       | 0.38.2       |     
                 sane-backends |  DISTRO  | https://release-monitoring.org/project/04760 | 1.0.27       | 1.0.28       |     
                         scons |  DISTRO  | https://release-monitoring.org/project/04770 | 3.1.0        | 3.1.1        |     
                        scrypt |  DISTRO  | https://release-monitoring.org/project/21238 | 1.2.0        | 1.3.0        |     
                          sdl2 |  DISTRO  | https://release-monitoring.org/project/04779 | 2.0.9        | 2.0.10       |     
                    sdl2_mixer |  DISTRO  | https://release-monitoring.org/project/04782 | 2.0.1        | 2.0.4        | ORPH
                       sdl_gfx |  DISTRO  | https://release-monitoring.org/project/04778 | 2.0.23       | 2.0.25       |     
                        sdparm |  DISTRO  | https://release-monitoring.org/project/04787 | 1.10         | 1.11r320     |     
                selinux-python |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191031     |     
                semodule-utils |  DISTRO  | https://release-monitoring.org/project/01717 | 2.9          | 20191031     |     
                       ser2net |  DISTRO  | https://release-monitoring.org/project/21655 | 3.5          | 4.0          |     
                shairport-sync |  DISTRO  | https://release-monitoring.org/project/21384 | 3.3.2        | 3.3.5        |     
              shared-mime-info |  DISTRO  | https://release-monitoring.org/project/05524 | 1.12         | 1.15         | ORPH
                      sispmctl |  DISTRO  | https://release-monitoring.org/project/21653 | 4.1          | 4.2          |     
                 smartmontools |  DISTRO  | https://release-monitoring.org/project/04835 | 6.5          | 7.0          | ORPH
                     smstools3 |  DISTRO  | https://release-monitoring.org/project/04841 | 3.1.15       | 3.1.21       | ORPH
                         snort |  DISTRO  | https://release-monitoring.org/project/13263 | 2.9.14.1     | 2.9.15       |     
                       solarus |  DISTRO  | https://release-monitoring.org/project/21319 | 1.6.0        | 1.6.2        |     
       sound-theme-freedesktop |  DISTRO  | https://release-monitoring.org/project/10152 | 0.7          | 0.8          |     
                      speexdsp |  DISTRO  | https://release-monitoring.org/project/08419 | SpeexDSP-... | 1.2.0        | ORPH
                         spice |  DISTRO  | https://release-monitoring.org/project/04871 | 0.14.1       | 0.14.2       |     
                spice-protocol |  DISTRO  | https://release-monitoring.org/project/14892 | 0.12.14      | 0.14.0       |     
                     sqlcipher |  DISTRO  | https://release-monitoring.org/project/11213 | 4.0.1        | 4.2.0        |     
                         squid |  DISTRO  | https://release-monitoring.org/project/04880 | 4.8          | 4.9          | ORPH
                         sshfs |  DISTRO  | https://release-monitoring.org/project/11058 | 2.8          | 3.6.0        | ORPH
             start-stop-daemon |  DISTRO  | https://release-monitoring.org/project/08127 | 1.18.10      | 1.19.7       | ORPH
          startup-notification |  DISTRO  | https://release-monitoring.org/project/10089 | 0.9          | 0.12         | ORPH
                     stress-ng |  DISTRO  | https://release-monitoring.org/project/12538 | 0.10.07      | 0.10.10      |     
                    strongswan |  DISTRO  | https://release-monitoring.org/project/04899 | 5.6.3        | 5.8.1        |     
                    subversion |  DISTRO  | https://release-monitoring.org/project/04905 | 1.12.2       | 1.13.0       |     
                          sudo |  DISTRO  | https://release-monitoring.org/project/04906 | 1.8.28       | 1.8.29       | ORPH
                   sunxi-tools |  DISTRO  | https://release-monitoring.org/project/16291 | 1.4.1        | 1.4.2        | ORPH
                      suricata |  DISTRO  | https://release-monitoring.org/project/10925 | 4.1.5        | 5.0.0        |     
                      swupdate |  DISTRO  | https://release-monitoring.org/project/15714 | 2019.04      | 2019.11-rc1  |     
                        sysdig |  DISTRO  | https://release-monitoring.org/project/16898 | 0.23.1       | 0.26.4       |     
                      sysklogd |  DISTRO  | https://release-monitoring.org/project/10331 | 1.6          | 2.0          | ORPH
                       sysstat |  DISTRO  | https://release-monitoring.org/project/04931 | 11.6.3       | 12.2.0       | ORPH
                       systemd |  DISTRO  | https://release-monitoring.org/project/05440 | 243-78-ge... | 243          |     
                        taglib |  DISTRO  | https://release-monitoring.org/project/01982 | 1.11.1       | 1.12-beta-1  |     
                           tar |  DISTRO  | https://release-monitoring.org/project/04939 | 1.29         | 1.32         | ORPH
                  targetcli-fb |  DISTRO  | https://release-monitoring.org/project/09174 | 2.1.fb41     | 3.0-pre4     |     
                           tcl |  DISTRO  | https://release-monitoring.org/project/04941 | 8.6.9        | 8.7a1        | ORPH
                        tcllib |  DISTRO  | https://release-monitoring.org/project/04943 | 1.13         | 1.19         |     
                   terminology |  DISTRO  | https://release-monitoring.org/project/04951 | 1.5.0        | 1.6.0        |     
                        thrift |  DISTRO  | https://release-monitoring.org/project/05581 | 0.12.0       | 0.13.0       | ORPH
                          tiff |  DISTRO  | https://release-monitoring.org/project/01738 | 4.0.10       | 4.1.0        | ORPH
                          tinc |  DISTRO  | https://release-monitoring.org/project/07716 | 1.0.36       | 1.1pre14     |     
                      tinycbor |  DISTRO  | https://release-monitoring.org/project/21379 | 0.5.2        | 0.5.3        |     
                       tinyxml |  DISTRO  | https://release-monitoring.org/project/10162 | 2.6.2_2      | 2.6.2        |     
                          tmux |  DISTRO  | https://release-monitoring.org/project/04980 | 2.9a         | 3.0          |     
                    tpm2-abrmd |  DISTRO  | https://release-monitoring.org/project/16819 | 2.0.3        | 2.3.0        |     
                    tpm2-tools |  DISTRO  | https://release-monitoring.org/project/12841 | 3.1.4        | 4.1-rc0      |     
                     tpm2-totp |  DISTRO  | https://release-monitoring.org/project/18790 | 0.1.2        | 0.2.0        |     
                      tpm2-tss |  DISTRO  | https://release-monitoring.org/project/12683 | 2.1.3        | 2.3.1        |     
                     trace-cmd |  DISTRO  | https://release-monitoring.org/project/07873 | trace-cmd... | 2.8.3        |     
                       twolame |  DISTRO  | https://release-monitoring.org/project/12524 | 0.3.13       | 0.4.0        | ORPH
                         udpxy |  DISTRO  | https://release-monitoring.org/project/21664 | 1.0.23-9-... | 1.0.23-12... |     
                         unrar |  DISTRO  | https://release-monitoring.org/project/13306 | 5.8.3        | 5.8.4        | ORPH
                        upower |  DISTRO  | https://release-monitoring.org/project/05056 | 0.99.4       | 0.99.11      |     
                           upx |  DISTRO  | https://release-monitoring.org/project/13737 | 3.91         | 3.95         |     
                          vala |  DISTRO  | https://release-monitoring.org/project/05065 | 0.34.7       | 0.47.1       | ORPH
                           vim |  DISTRO  | https://release-monitoring.org/project/05092 | 8.1.1929     | 8.1.2318     | ORPH
                           vte |  DISTRO  | https://release-monitoring.org/project/10895 | 0.48.3       | 0.59.0       | ORPH
                           waf |  DISTRO  | https://release-monitoring.org/project/05116 | 1.9.5        | 2.0.18       | ORPH
                       wayland |  DISTRO  | https://release-monitoring.org/project/10061 | 1.17.0       | 1.18         |     
             wayland-protocols |  DISTRO  | https://release-monitoring.org/project/13997 | 1.17         | 1.18         | ORPH
                     webkitgtk |  DISTRO  | https://release-monitoring.org/project/05355 | 2.26.1       | 2.27.2       |     
       webrtc-audio-processing |  DISTRO  | https://release-monitoring.org/project/15929 | 0.3          | 0.3.1        | ORPH
                        weston |  DISTRO  | https://release-monitoring.org/project/13745 | 6.0.1        | 7.0.0        |     
                         whois |  DISTRO  | https://release-monitoring.org/project/05128 | 5.5.0        | 5.5.3        |     
                          wine |  DISTRO  | https://release-monitoring.org/project/05134 | 4.0.2        | 4.20         |     
                     wireshark |  DISTRO  | https://release-monitoring.org/project/05137 | 3.0.5        | 3.1.0        | ORPH
                     wpewebkit |  DISTRO  | https://release-monitoring.org/project/17557 | 2.26.1       | 2.27.2       |     
                          x264 |  DISTRO  | https://release-monitoring.org/project/15280 | 20190623-... | 20191117-... |     
                          x265 |  DISTRO  | https://release-monitoring.org/project/07275 | 3.2          | 3.2.1        |     
                     xapp_luit |  DISTRO  | https://release-monitoring.org/project/15047 | 1.1.1        | 20190106     |     
      xdriver_xf86-input-tslib |  DISTRO  | https://release-monitoring.org/project/21713 | 1.1.1        | 1.2.0-rc1    |     
      xdriver_xf86-video-geode |  DISTRO  | https://release-monitoring.org/project/05219 | 2.11.19      | 2.11.20      |     
                      xfsprogs |  DISTRO  | https://release-monitoring.org/project/05188 | 5.2.1        | 5.3.0        | ORPH
                        xinetd |  DISTRO  | https://release-monitoring.org/project/06382 | 2-3-15       | 2.3.15.4     |     
                         xl2tp |  DISTRO  | https://release-monitoring.org/project/05193 | 1.3.14       | 1.3.15       | ORPH
                       xorriso |  DISTRO  | https://release-monitoring.org/project/13270 | 1.5.0        | 1.5.2        |     
                         xterm |  DISTRO  | https://release-monitoring.org/project/05272 | 349          | 350          | ORPH
                        xxhash |  DISTRO  | https://release-monitoring.org/project/17583 | 0.7.1        | 0.7.2        | ORPH
                            xz |  DISTRO  | https://release-monitoring.org/project/05277 | 5.2.4        | 5.3.1alpha   | ORPH
                         ytree |  DISTRO  | https://release-monitoring.org/project/05296 | 1.99pl2      | 2.00         |     
               zd1211-firmware |  DISTRO  | https://release-monitoring.org/project/14849 | 1.4          | 1.5          | ORPH
                          zstd |  DISTRO  | https://release-monitoring.org/project/12083 | 1.4.3        | 1.4.4        |     
                 zynq-boot-bin |  DISTRO  | https://release-monitoring.org/project/21623 | 2015.1       | 2019.2       |     

-- 
http://autobuild.buildroot.net
