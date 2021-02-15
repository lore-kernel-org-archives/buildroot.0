From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 15 Feb 2021 07:44:15 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-14
Message-ID: <20210215074424.2E9D28660D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-14
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  3  |  0  | 17  |
  2020.11.x  |  6  |  4  |  0  | 10  |
    master   | 102 | 55  |  0  | 157 |
     next    | 27  | 28  |  1  | 56  |

Classification of failures by reason for master
-----------------------------------------------

                  perl-gd-2.73 | 7 
                  zeromq-4.3.4 | 5 
                       unknown | 4 
                  dhcpcd-9.4.0 | 3 
                rocksdb-6.13.3 | 3 
               host-lcms2-2.11 | 2 
          libmicrohttpd-0.9.72 | 2 
                 pixman-0.40.0 | 2 
                    qemu-5.2.0 | 2 
             babeltrace2-2.0.3 | 1 
                  boost-1.75.0 | 1 
                  botan-2.17.3 | 1 
                  bustle-0.8.0 | 1 
            docker-cli-20.10.3 | 1 
                     efivar-37 | 1 
             gdk-pixbuf-2.42.2 | 1 
                hiawatha-10.11 | 1 
             host-cairo-1.16.0 | 1 
           host-mono-6.12.0.90 | 1 
                 libgeos-3.9.0 | 1 
             libgpg-error-1.41 | 1 
             libopenssl-1.1.1i | 1 
              libostree-2020.8 | 1 
                 mesa3d-20.3.4 | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
                  ndisc6-1.0.4 | 1 
                openblas-0.3.9 | 1 
                 openmpi-4.0.0 | 1 
                   perl-5.32.1 | 1 
                  quagga-1.2.4 | 1 
            quickjs-2020-11-08 | 1 
                      tio-1.32 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/8d0cecc56f85d3bbfd8582a3e0d43316cbf07574 |     
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/9425c08e26d385a52a85ea8cd3cf6ecc7a9694c1 |     
   sparc     |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/5c03ee53a34a3cdb409cffcda76e5cc2c723778b | ORPH
    i686     |          bustle-0.8.0          | NOK | http://autobuild.buildroot.net/results/bbf835fd312af5d06ee91ac232c620a6f332f4e7 | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/c1cdba639296325e0ea37b008528f1d0021724c7 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/c88efcc9875c2646f70e7737a5f0b0575ebb6680 |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/cc9655f7936153a91ee1c2c13cba88d71016a343 |     
    i586     |       docker-cli-20.10.3       | NOK | http://autobuild.buildroot.net/results/37f18874a1747eed204f05b5cd171c7a44769054 |     
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/0a38b5d9513195d04b5ed92ad649d8772b24f78a |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/290b8f8e6f54b3f989065e5820cf97e5cfbbb7e0 | ORPH
    m68k     |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/9c7da13be4e676364a3d1df63ac8cc6efe67a256 |     
  powerpc    |       host-cairo-1.16.0        | NOK | http://autobuild.buildroot.net/results/bd65e687093635df62348ccdb9a83a580079118d |     
   s390x     |        host-lcms2-2.11         | NOK | http://autobuild.buildroot.net/results/70ef6e7b9f87c8097839c1aa3ed1492bfcf9761d |     
microblazeel |        host-lcms2-2.11         | NOK | http://autobuild.buildroot.net/results/3a1cbf2cf744542bf5034406b35f749bba092e5f |     
    arm      |      host-mono-6.12.0.90       | NOK | http://autobuild.buildroot.net/results/871868a5b842e332a66a1c9d509a8d3c6b3eada4 |     
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/f853f180a4c3f1c8951a5ec1cdd98acdab469f88 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/453e22eb5867fdb905bc221b6258851bec232a3e | ORPH
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/9df847cccb971b245690efc90a5a55823ae8572d |     
   xtensa    |      libmicrohttpd-0.9.72      | NOK | http://autobuild.buildroot.net/results/5421847e6b2f8cb105c5159f33a4337b7b3e8a9a |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/6201352466ce7d2225cfc7e99002ad08e0530e19 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/688be392a6a55565de686291edfbf31e1999b591 |     
    arm      |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/f72db1d94d235f68f78fe64bbc96998610766e95 |     
   xtensa    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/3dec8d2b9092caf8cf6d4a2ed94e349ed8e4b17c |     
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/055bef222e07d526a1cd8565f5e4555036eee379 | ORPH
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/2e7e824d6ed70fdb67c8a1dad9ab779628db9765 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/88c23e28063da0b7f8a98d1ef99c62ecb9e2719b | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/b9e2beca9344a7da921bf226e48d5c69a25a2abf | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/7da9ac439702ca597577893f48ef8f66f4815a39 | ORPH
  powerpc    |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/7edbea3a6ccf33bdbfd3b37824a97dc7a3af8af6 |     
   xtensa    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/efa9ac1e740d88a6618d99f1e8e9aa380870fada |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/6df28eef110b32204baba8afdb889a2d4e95d246 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/230cd3256b2ca83cfb0a7ada053ea6da7e34da36 |     
  sparc64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0f4131739af8bd3dccb7ec6cf2ed6ea655930105 |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/d0d1d4320b297606b1f619e945105ea5fac6d5d8 |     
powerpc64le  |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/dc3c35e3a55a9a59330d68bb7c801507a7ee1ee4 |     
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/87fcae06a4febd1edc8ca3691ec32d17997d338d |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9ddc62faa4f2c4e15e9269af3151b2c842ecd676 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b357fcef67245cf96bf1f1cd320e491b12bcea53 |     
    arm      |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/25ecb776df7e7e6208a377ffae161487cb572abd |     
    i686     |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/b812d73f06a445bb916bf5c35eb62df74cd8b624 |     
  riscv64    |          quagga-1.2.4          | NOK | http://autobuild.buildroot.net/results/b2a8ea53ff0d82ef702ce92682213121d763e55d | ORPH
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/dbf602275f3058d37fb217faa0325992e4fa2439 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/48c4cbf84bf9dce13ee9229cff8e11198abb964d |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8c2fde26df7453389acc0ada631acb69cf776396 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/14cb031ea924e7992d42ab2e5504db76ac677ccd |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/dbd42543f2997d32ddb96ad0ad144fe5b3445702 |     
  nds32le    |            unknown             | NOK | http://autobuild.buildroot.net/results/56606aeff39a33d1c1d9e9b736f215198db6934d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/03516a32552b175321870c9dab05002263b3f5dd |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/95d059917760a4e98bd03d9e29709759aaeb05b8 |     
microblazeel |            unknown             | NOK | http://autobuild.buildroot.net/results/6a74640710139e3d61cf8b245f06be3345c539c2 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c0af6f8a393fbd5d8cd5c44a5918e73ecf9b8087 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/a94e76c3340708deb8104659093da168d82df373 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/8b4e80404855d981aeeb706457a1661712feb533 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/f30d2e132b941676a8518bac90088e2e78b6de8d |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/dee5695ecd3924d44fdc835f547407e8ecddcf3b |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                  connman-1.38 | 2 
sox-7524160b29a476f7e87bc14... | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/372d1c3cdcba4bf30855125edfe6718eb855d1ea |     
    arm      |          connman-1.38          | NOK | http://autobuild.buildroot.net/results/1c19257b4ba4dd13814cfaf905401e3d00daf513 |     
 aarch64_be  | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/237165e112cea1be557e51f60ed2feca9863584b | ORPH


Classification of failures by reason for 2020.11.x
--------------------------------------------------

  gobject-introspection-1.64.1 | 1 
        host-sentry-cli-1.57.0 | 1 
             ipsec-tools-0.8.2 | 1 
sox-7524160b29a476f7e87bc14... | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/c081ae1fe65dc4a75e72ce78430615bd89a0edc0 | ORPH
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/766b68a8d1f8591b0664565458a7deb81c4c4854 |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/316ce97af5d3442e0042f4b8ab9d23ee8d5b8187 |     
    mips     | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/65e584c64a2c8ccbfc6a66bbf20110af42d52fe6 | ORPH


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 5 
                  dhcpcd-9.4.0 | 4 
                  perl-gd-2.73 | 3 
                 python3-3.9.1 | 2 
                  zeromq-4.3.4 | 2 
                coreutils-8.32 | 1 
             gdk-pixbuf-2.42.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
             libgpg-error-1.41 | 1 
                libshout-2.4.5 | 1 
               libtheora-1.1.1 | 1 
                linux-firmware | 1 
              netopeer2-1.1.53 | 1 
                 openmpi-4.0.0 | 1 
                    qemu-5.2.0 | 1 
         s6-linux-init-1.0.3.1 | 1 
                       unknown | 1 
            wpa_supplicant-2.9 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/722c08d1631ab700ddea6a89910b412f84c7c69c | ORPH
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/45f7c5a15906113c1de25442bbad4d20c6e97d36 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/35f69b74766879de5aeb61eec58bd34c8d46760e |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/131dc0312ddb7aa447d795b442b87dad8effa036 |     
  sparc64    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/2c6819998c34acbdb8f1ca403a86a365fd139022 |     
    arm      |       gdk-pixbuf-2.42.2        | NOK | http://autobuild.buildroot.net/results/22ae0c57cc502d310cea9ff3f7179c74440cb65c | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/9fda6ef6125c01ca6dcbfdf0bb5d329befd10f3c |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/a0a753f75dc2a0051e24432ff9014b0af3fc07b0 | ORPH
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/1d5ef827a54cab1230f320fd63ed21987e824dd5 | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/7f980c76803ac2e907eadd9e98cfaafa90137b0a | ORPH
   s390x     |         linux-firmware         | TIM | http://autobuild.buildroot.net/results/258e1e67bf4dbb706e7e3da8a913b94698ed56d4 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/62c9b5212f5e90fc6ae3dc4210b78b78521919a0 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/6a4a450053d784d59c8e197f37c8b69d1ce8cc80 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9484143b6ac6e74c8527e2537a6b72b6a57c2781 |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8f9ee3ad84c9c624446460eaaa1076f62529b5e0 |     
    m68k     |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/9f46052adb7f4bc07ede845e656744117828dd27 |     
  sparc64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/d44165dbaa4fe0eca5d3fee72ae33da9d87757c6 |     
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/6e97e43c134b279f9e36b0163dba339083fc1edc | ORPH
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/60e8e9c0435d6529c4416a96b7e049f5c1d0b78b |     
    m68k     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/55c7eadd8c008e3d52771541d3d4c694b44ad2bd |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/96d9c5a5a1a7ac49a478c59cadda058715d96ae0 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/251e46ee0fd5696c7e54427952c049e205ab61e4 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/46619aa6c00fb6b14d3de278016163b0b59c26ad |     
   x86_64    |           qemu-5.2.0           | NOK | http://autobuild.buildroot.net/results/c09946ad2c8f57dba6218d8229c0326123dda43b |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/df600c86c3e8d64681e0396ce769260a418a76d2 |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/27d20f4f8a8f63207c75507f4c96f193407db324 |     
  mips64el   |       wpa_supplicant-2.9       | NOK | http://autobuild.buildroot.net/results/12c37afb07438c117afc7ed3104489fa3726353f |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b71f366f438fd7d0cbc07d0a55a27d9a493fd745 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/b475031e74e32577431b596953cc29e74ac6921f |     


Gitlab CI results for 2021-02-14
================================

Packages having CVEs
====================

             name              |       CVE        |                             link                            
-------------------------------+------------------+--------------------------------------------------------------
                        apache | CVE-1999-0236    | https://security-tracker.debian.org/tracker/CVE-1999-0236   
                        apache | CVE-1999-0289    | https://security-tracker.debian.org/tracker/CVE-1999-0289   
                        apache | CVE-1999-0678    | https://security-tracker.debian.org/tracker/CVE-1999-0678   
                        apache | CVE-1999-1237    | https://security-tracker.debian.org/tracker/CVE-1999-1237   
                        apache | CVE-1999-1412    | https://security-tracker.debian.org/tracker/CVE-1999-1412   
                        apache | CVE-2007-0086    | https://security-tracker.debian.org/tracker/CVE-2007-0086   
                        apache | CVE-2007-0450    | https://security-tracker.debian.org/tracker/CVE-2007-0450   
                        apache | CVE-2007-4465    | https://security-tracker.debian.org/tracker/CVE-2007-4465   
                        apache | CVE-2007-5000    | https://security-tracker.debian.org/tracker/CVE-2007-5000   
                        apache | CVE-2007-6388    | https://security-tracker.debian.org/tracker/CVE-2007-6388   
                        apache | CVE-2007-6420    | https://security-tracker.debian.org/tracker/CVE-2007-6420   
                        apache | CVE-2007-6421    | https://security-tracker.debian.org/tracker/CVE-2007-6421   
                        apache | CVE-2007-6422    | https://security-tracker.debian.org/tracker/CVE-2007-6422   
                        apache | CVE-2007-6423    | https://security-tracker.debian.org/tracker/CVE-2007-6423   
                        apache | CVE-2008-0455    | https://security-tracker.debian.org/tracker/CVE-2008-0455   
                        apache | CVE-2008-2168    | https://security-tracker.debian.org/tracker/CVE-2008-2168   
                        apache | CVE-2008-2939    | https://security-tracker.debian.org/tracker/CVE-2008-2939   
                        apache | CVE-2009-1195    | https://security-tracker.debian.org/tracker/CVE-2009-1195   
                        apache | CVE-2009-1890    | https://security-tracker.debian.org/tracker/CVE-2009-1890   
                        apache | CVE-2009-1891    | https://security-tracker.debian.org/tracker/CVE-2009-1891   
                        apache | CVE-2009-2699    | https://security-tracker.debian.org/tracker/CVE-2009-2699   
                        apache | CVE-2010-0408    | https://security-tracker.debian.org/tracker/CVE-2010-0408   
                        apache | CVE-2010-0425    | https://security-tracker.debian.org/tracker/CVE-2010-0425   
                        apache | CVE-2010-0434    | https://security-tracker.debian.org/tracker/CVE-2010-0434   
                        apache | CVE-2010-1452    | https://security-tracker.debian.org/tracker/CVE-2010-1452   
                        apache | CVE-2014-0231    | https://security-tracker.debian.org/tracker/CVE-2014-0231   
                      apparmor | CVE-2016-1585    | https://security-tracker.debian.org/tracker/CVE-2016-1585   
                         argus | CVE-2011-3332    | https://security-tracker.debian.org/tracker/CVE-2011-3332   
                         asn1c | CVE-2017-12966   | https://security-tracker.debian.org/tracker/CVE-2017-12966  
                 at91bootstrap | CVE-2020-11683   | https://security-tracker.debian.org/tracker/CVE-2020-11683  
                 at91bootstrap | CVE-2020-11684   | https://security-tracker.debian.org/tracker/CVE-2020-11684  
                          atop | CVE-2011-3618    | https://security-tracker.debian.org/tracker/CVE-2011-3618   
                          bash | CVE-2019-18276   | https://security-tracker.debian.org/tracker/CVE-2019-18276  
                    berkeleydb | CVE-2019-2708    | https://security-tracker.debian.org/tracker/CVE-2019-2708   
                    berkeleydb | CVE-2020-2981    | https://security-tracker.debian.org/tracker/CVE-2020-2981   
                          bind | CVE-2017-3139    | https://security-tracker.debian.org/tracker/CVE-2017-3139   
                          bind | CVE-2019-6470    | https://security-tracker.debian.org/tracker/CVE-2019-6470   
                       bitcoin | CVE-2012-1909    | https://security-tracker.debian.org/tracker/CVE-2012-1909   
                       bitcoin | CVE-2012-4682    | https://security-tracker.debian.org/tracker/CVE-2012-4682   
                       bitcoin | CVE-2012-4683    | https://security-tracker.debian.org/tracker/CVE-2012-4683   
                       bitcoin | CVE-2013-2272    | https://security-tracker.debian.org/tracker/CVE-2013-2272   
                       bitcoin | CVE-2013-2273    | https://security-tracker.debian.org/tracker/CVE-2013-2273   
                       bitcoin | CVE-2013-2292    | https://security-tracker.debian.org/tracker/CVE-2013-2292   
                       bitcoin | CVE-2013-2293    | https://security-tracker.debian.org/tracker/CVE-2013-2293   
                       bitcoin | CVE-2013-3220    | https://security-tracker.debian.org/tracker/CVE-2013-3220   
                       bitcoin | CVE-2021-3195    | https://security-tracker.debian.org/tracker/CVE-2021-3195   
                  bluez5_utils | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
                  bluez5_utils | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
          bluez5_utils-headers | CVE-2020-12352   | https://security-tracker.debian.org/tracker/CVE-2020-12352  
          bluez5_utils-headers | CVE-2020-24490   | https://security-tracker.debian.org/tracker/CVE-2020-24490  
                         botan | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                         botan | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                         botan | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                        bsdiff | CVE-2020-14315   | https://security-tracker.debian.org/tracker/CVE-2020-14315  
                         cairo | CVE-2019-6461    | https://security-tracker.debian.org/tracker/CVE-2019-6461   
                         cairo | CVE-2019-6462    | https://security-tracker.debian.org/tracker/CVE-2019-6462   
                        cereal | CVE-2020-11104   | https://security-tracker.debian.org/tracker/CVE-2020-11104  
                        clamav | CVE-2016-1405    | https://security-tracker.debian.org/tracker/CVE-2016-1405   
                         cmake | CVE-2016-10642   | https://security-tracker.debian.org/tracker/CVE-2016-10642  
                     coreutils | CVE-2013-0221    | https://security-tracker.debian.org/tracker/CVE-2013-0221   
                     coreutils | CVE-2013-0222    | https://security-tracker.debian.org/tracker/CVE-2013-0222   
                     coreutils | CVE-2013-0223    | https://security-tracker.debian.org/tracker/CVE-2013-0223   
                     coreutils | CVE-2016-2781    | https://security-tracker.debian.org/tracker/CVE-2016-2781   
                          cpio | CVE-2010-4226    | https://security-tracker.debian.org/tracker/CVE-2010-4226   
                      cryptopp | CVE-2019-14318   | https://security-tracker.debian.org/tracker/CVE-2019-14318  
                          cups | CVE-2018-6553    | https://security-tracker.debian.org/tracker/CVE-2018-6553   
                           cvs | CVE-2017-12836   | https://security-tracker.debian.org/tracker/CVE-2017-12836  
                        docker | CVE-2014-0048    | https://security-tracker.debian.org/tracker/CVE-2014-0048   
                        docker | CVE-2014-8178    | https://security-tracker.debian.org/tracker/CVE-2014-8178   
                        docker | CVE-2014-8179    | https://security-tracker.debian.org/tracker/CVE-2014-8179   
                        docker | CVE-2015-1843    | https://security-tracker.debian.org/tracker/CVE-2015-1843   
                        docker | CVE-2015-3627    | https://security-tracker.debian.org/tracker/CVE-2015-3627   
                        docker | CVE-2015-3630    | https://security-tracker.debian.org/tracker/CVE-2015-3630   
                        docker | CVE-2015-3631    | https://security-tracker.debian.org/tracker/CVE-2015-3631   
                        docker | CVE-2016-3697    | https://security-tracker.debian.org/tracker/CVE-2016-3697   
                        docker | CVE-2017-14992   | https://security-tracker.debian.org/tracker/CVE-2017-14992  
                        docker | CVE-2017-7297    | https://security-tracker.debian.org/tracker/CVE-2017-7297   
                        docker | CVE-2019-13139   | https://security-tracker.debian.org/tracker/CVE-2019-13139  
                        docker | CVE-2019-13509   | https://security-tracker.debian.org/tracker/CVE-2019-13509  
                        docker | CVE-2019-15752   | https://security-tracker.debian.org/tracker/CVE-2019-15752  
                        docker | CVE-2019-16884   | https://security-tracker.debian.org/tracker/CVE-2019-16884  
                        docker | CVE-2019-5736    | https://security-tracker.debian.org/tracker/CVE-2019-5736   
                        docker | CVE-2020-27534   | https://security-tracker.debian.org/tracker/CVE-2020-27534  
                        docker | CVE-2021-21284   | https://security-tracker.debian.org/tracker/CVE-2021-21284  
                        docker | CVE-2021-21285   | https://security-tracker.debian.org/tracker/CVE-2021-21285  
                        docker | CVE-2021-3162    | https://security-tracker.debian.org/tracker/CVE-2021-3162   
                       dovecot | CVE-2016-4983    | https://security-tracker.debian.org/tracker/CVE-2016-4983   
                ecryptfs-utils | CVE-2016-1572    | https://security-tracker.debian.org/tracker/CVE-2016-1572   
                         exiv2 | CVE-2007-6353    | https://security-tracker.debian.org/tracker/CVE-2007-6353   
                         fastd | CVE-2020-27638   | https://security-tracker.debian.org/tracker/CVE-2020-27638  
                        ffmpeg | CVE-2020-35964   | https://security-tracker.debian.org/tracker/CVE-2020-35964  
                        ffmpeg | CVE-2020-35965   | https://security-tracker.debian.org/tracker/CVE-2020-35965  
                   flatbuffers | CVE-2020-35864   | https://security-tracker.debian.org/tracker/CVE-2020-35864  
                          flex | CVE-2019-6293    | https://security-tracker.debian.org/tracker/CVE-2019-6293   
                         glibc | CVE-2010-4756    | https://security-tracker.debian.org/tracker/CVE-2010-4756   
                         glibc | CVE-2019-1010022 | https://security-tracker.debian.org/tracker/CVE-2019-1010022
                         glibc | CVE-2019-1010023 | https://security-tracker.debian.org/tracker/CVE-2019-1010023
                         glibc | CVE-2019-1010024 | https://security-tracker.debian.org/tracker/CVE-2019-1010024
                         glibc | CVE-2019-1010025 | https://security-tracker.debian.org/tracker/CVE-2019-1010025
                         gnupg | CVE-2006-3082    | https://security-tracker.debian.org/tracker/CVE-2006-3082   
                         gnupg | CVE-2011-2207    | https://security-tracker.debian.org/tracker/CVE-2011-2207   
                         gnupg | CVE-2015-1606    | https://security-tracker.debian.org/tracker/CVE-2015-1606   
                         gnupg | CVE-2018-12020   | https://security-tracker.debian.org/tracker/CVE-2018-12020  
                         gnupg | CVE-2019-13050   | https://security-tracker.debian.org/tracker/CVE-2019-13050  
                         gnupg | CVE-2019-14855   | https://security-tracker.debian.org/tracker/CVE-2019-14855  
                            go | CVE-2020-29509   | https://security-tracker.debian.org/tracker/CVE-2020-29509  
                            go | CVE-2020-29511   | https://security-tracker.debian.org/tracker/CVE-2020-29511  
                graphicsmagick | CVE-2007-0770    | https://security-tracker.debian.org/tracker/CVE-2007-0770   
                graphicsmagick | CVE-2008-6621    | https://security-tracker.debian.org/tracker/CVE-2008-6621   
                     graphite2 | CVE-2017-5436    | https://security-tracker.debian.org/tracker/CVE-2017-5436   
                         grub2 | CVE-2019-14865   | https://security-tracker.debian.org/tracker/CVE-2019-14865  
                         grub2 | CVE-2020-15705   | https://security-tracker.debian.org/tracker/CVE-2020-15705  
                       haproxy | CVE-2016-2102    | https://security-tracker.debian.org/tracker/CVE-2016-2102   
                   imagemagick | CVE-2007-1667    | https://security-tracker.debian.org/tracker/CVE-2007-1667   
                   imagemagick | CVE-2014-9804    | https://security-tracker.debian.org/tracker/CVE-2014-9804   
                   imagemagick | CVE-2014-9805    | https://security-tracker.debian.org/tracker/CVE-2014-9805   
                   imagemagick | CVE-2014-9806    | https://security-tracker.debian.org/tracker/CVE-2014-9806   
                   imagemagick | CVE-2014-9807    | https://security-tracker.debian.org/tracker/CVE-2014-9807   
                   imagemagick | CVE-2014-9808    | https://security-tracker.debian.org/tracker/CVE-2014-9808   
                   imagemagick | CVE-2014-9809    | https://security-tracker.debian.org/tracker/CVE-2014-9809   
                   imagemagick | CVE-2014-9810    | https://security-tracker.debian.org/tracker/CVE-2014-9810   
                   imagemagick | CVE-2014-9811    | https://security-tracker.debian.org/tracker/CVE-2014-9811   
                   imagemagick | CVE-2014-9812    | https://security-tracker.debian.org/tracker/CVE-2014-9812   
                   imagemagick | CVE-2014-9813    | https://security-tracker.debian.org/tracker/CVE-2014-9813   
                   imagemagick | CVE-2014-9814    | https://security-tracker.debian.org/tracker/CVE-2014-9814   
                   imagemagick | CVE-2014-9815    | https://security-tracker.debian.org/tracker/CVE-2014-9815   
                   imagemagick | CVE-2014-9816    | https://security-tracker.debian.org/tracker/CVE-2014-9816   
                   imagemagick | CVE-2014-9817    | https://security-tracker.debian.org/tracker/CVE-2014-9817   
                   imagemagick | CVE-2014-9818    | https://security-tracker.debian.org/tracker/CVE-2014-9818   
                   imagemagick | CVE-2014-9819    | https://security-tracker.debian.org/tracker/CVE-2014-9819   
                   imagemagick | CVE-2014-9820    | https://security-tracker.debian.org/tracker/CVE-2014-9820   
                   imagemagick | CVE-2014-9821    | https://security-tracker.debian.org/tracker/CVE-2014-9821   
                   imagemagick | CVE-2014-9822    | https://security-tracker.debian.org/tracker/CVE-2014-9822   
                   imagemagick | CVE-2014-9823    | https://security-tracker.debian.org/tracker/CVE-2014-9823   
                   imagemagick | CVE-2014-9824    | https://security-tracker.debian.org/tracker/CVE-2014-9824   
                   imagemagick | CVE-2014-9825    | https://security-tracker.debian.org/tracker/CVE-2014-9825   
                   imagemagick | CVE-2014-9826    | https://security-tracker.debian.org/tracker/CVE-2014-9826   
                   imagemagick | CVE-2014-9827    | https://security-tracker.debian.org/tracker/CVE-2014-9827   
                   imagemagick | CVE-2014-9828    | https://security-tracker.debian.org/tracker/CVE-2014-9828   
                   imagemagick | CVE-2014-9829    | https://security-tracker.debian.org/tracker/CVE-2014-9829   
                   imagemagick | CVE-2014-9830    | https://security-tracker.debian.org/tracker/CVE-2014-9830   
                   imagemagick | CVE-2014-9831    | https://security-tracker.debian.org/tracker/CVE-2014-9831   
                   imagemagick | CVE-2014-9848    | https://security-tracker.debian.org/tracker/CVE-2014-9848   
                   imagemagick | CVE-2014-9852    | https://security-tracker.debian.org/tracker/CVE-2014-9852   
                   imagemagick | CVE-2014-9853    | https://security-tracker.debian.org/tracker/CVE-2014-9853   
                   imagemagick | CVE-2014-9854    | https://security-tracker.debian.org/tracker/CVE-2014-9854   
                   imagemagick | CVE-2014-9907    | https://security-tracker.debian.org/tracker/CVE-2014-9907   
                   imagemagick | CVE-2016-10062   | https://security-tracker.debian.org/tracker/CVE-2016-10062  
                   imagemagick | CVE-2016-10144   | https://security-tracker.debian.org/tracker/CVE-2016-10144  
                   imagemagick | CVE-2016-10145   | https://security-tracker.debian.org/tracker/CVE-2016-10145  
                   imagemagick | CVE-2016-10146   | https://security-tracker.debian.org/tracker/CVE-2016-10146  
                   imagemagick | CVE-2016-7513    | https://security-tracker.debian.org/tracker/CVE-2016-7513   
                   imagemagick | CVE-2016-7514    | https://security-tracker.debian.org/tracker/CVE-2016-7514   
                   imagemagick | CVE-2016-7515    | https://security-tracker.debian.org/tracker/CVE-2016-7515   
                   imagemagick | CVE-2016-7516    | https://security-tracker.debian.org/tracker/CVE-2016-7516   
                   imagemagick | CVE-2016-7517    | https://security-tracker.debian.org/tracker/CVE-2016-7517   
                   imagemagick | CVE-2016-7518    | https://security-tracker.debian.org/tracker/CVE-2016-7518   
                   imagemagick | CVE-2016-7519    | https://security-tracker.debian.org/tracker/CVE-2016-7519   
                   imagemagick | CVE-2016-7520    | https://security-tracker.debian.org/tracker/CVE-2016-7520   
                   imagemagick | CVE-2016-7521    | https://security-tracker.debian.org/tracker/CVE-2016-7521   
                   imagemagick | CVE-2016-7522    | https://security-tracker.debian.org/tracker/CVE-2016-7522   
                   imagemagick | CVE-2016-7523    | https://security-tracker.debian.org/tracker/CVE-2016-7523   
                   imagemagick | CVE-2016-7524    | https://security-tracker.debian.org/tracker/CVE-2016-7524   
                   imagemagick | CVE-2016-7525    | https://security-tracker.debian.org/tracker/CVE-2016-7525   
                   imagemagick | CVE-2016-7526    | https://security-tracker.debian.org/tracker/CVE-2016-7526   
                   imagemagick | CVE-2016-7527    | https://security-tracker.debian.org/tracker/CVE-2016-7527   
                   imagemagick | CVE-2016-7528    | https://security-tracker.debian.org/tracker/CVE-2016-7528   
                   imagemagick | CVE-2016-7529    | https://security-tracker.debian.org/tracker/CVE-2016-7529   
                   imagemagick | CVE-2016-7530    | https://security-tracker.debian.org/tracker/CVE-2016-7530   
                   imagemagick | CVE-2016-7531    | https://security-tracker.debian.org/tracker/CVE-2016-7531   
                   imagemagick | CVE-2016-7532    | https://security-tracker.debian.org/tracker/CVE-2016-7532   
                   imagemagick | CVE-2016-7533    | https://security-tracker.debian.org/tracker/CVE-2016-7533   
                   imagemagick | CVE-2016-7534    | https://security-tracker.debian.org/tracker/CVE-2016-7534   
                   imagemagick | CVE-2016-7535    | https://security-tracker.debian.org/tracker/CVE-2016-7535   
                   imagemagick | CVE-2016-7536    | https://security-tracker.debian.org/tracker/CVE-2016-7536   
                   imagemagick | CVE-2016-7537    | https://security-tracker.debian.org/tracker/CVE-2016-7537   
                   imagemagick | CVE-2016-7538    | https://security-tracker.debian.org/tracker/CVE-2016-7538   
                   imagemagick | CVE-2017-5506    | https://security-tracker.debian.org/tracker/CVE-2017-5506   
                   imagemagick | CVE-2017-5509    | https://security-tracker.debian.org/tracker/CVE-2017-5509   
                   imagemagick | CVE-2017-5510    | https://security-tracker.debian.org/tracker/CVE-2017-5510   
                   imagemagick | CVE-2017-5511    | https://security-tracker.debian.org/tracker/CVE-2017-5511   
                   imagemagick | CVE-2021-20176   | https://security-tracker.debian.org/tracker/CVE-2021-20176  
                        jasper | CVE-2015-8751    | https://security-tracker.debian.org/tracker/CVE-2015-8751   
                        jasper | CVE-2021-3272    | https://security-tracker.debian.org/tracker/CVE-2021-3272   
                         jhead | CVE-2020-6624    | https://security-tracker.debian.org/tracker/CVE-2020-6624   
                         jhead | CVE-2020-6625    | https://security-tracker.debian.org/tracker/CVE-2020-6625   
                        jquery | CVE-2007-2379    | https://security-tracker.debian.org/tracker/CVE-2007-2379   
                         libao | CVE-2017-11548   | https://security-tracker.debian.org/tracker/CVE-2017-11548  
                      libesmtp | CVE-2019-19977   | https://security-tracker.debian.org/tracker/CVE-2019-19977  
                       libexif | CVE-2016-6328    | https://security-tracker.debian.org/tracker/CVE-2016-6328   
                     libgcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                     libgcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                     libiberty | CVE-2012-3509    | https://security-tracker.debian.org/tracker/CVE-2012-3509   
                     libiberty | CVE-2016-2226    | https://security-tracker.debian.org/tracker/CVE-2016-2226   
                     libiberty | CVE-2016-4487    | https://security-tracker.debian.org/tracker/CVE-2016-4487   
                     libiberty | CVE-2016-4488    | https://security-tracker.debian.org/tracker/CVE-2016-4488   
                     libiberty | CVE-2016-4489    | https://security-tracker.debian.org/tracker/CVE-2016-4489   
                     libiberty | CVE-2016-4490    | https://security-tracker.debian.org/tracker/CVE-2016-4490   
                     libiberty | CVE-2016-4491    | https://security-tracker.debian.org/tracker/CVE-2016-4491   
                     libiberty | CVE-2016-4492    | https://security-tracker.debian.org/tracker/CVE-2016-4492   
                     libiberty | CVE-2016-4493    | https://security-tracker.debian.org/tracker/CVE-2016-4493   
                     libiberty | CVE-2016-6131    | https://security-tracker.debian.org/tracker/CVE-2016-6131   
                       libkrb5 | CVE-1999-0143    | https://security-tracker.debian.org/tracker/CVE-1999-0143   
                       libkrb5 | CVE-1999-0713    | https://security-tracker.debian.org/tracker/CVE-1999-0713   
                       libkrb5 | CVE-2001-1323    | https://security-tracker.debian.org/tracker/CVE-2001-1323   
                       libkrb5 | CVE-2007-3149    | https://security-tracker.debian.org/tracker/CVE-2007-3149   
                       libkrb5 | CVE-2007-5894    | https://security-tracker.debian.org/tracker/CVE-2007-5894   
                       libkrb5 | CVE-2007-5902    | https://security-tracker.debian.org/tracker/CVE-2007-5902   
                       libkrb5 | CVE-2009-0844    | https://security-tracker.debian.org/tracker/CVE-2009-0844   
                       libkrb5 | CVE-2009-0846    | https://security-tracker.debian.org/tracker/CVE-2009-0846   
                        libmad | CVE-2018-7263    | https://security-tracker.debian.org/tracker/CVE-2018-7263   
                        libndp | CVE-2014-3554    | https://security-tracker.debian.org/tracker/CVE-2014-3554   
                    libopenssl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                    libopenssl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                    libopenssl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                      libplist | CVE-2017-5834    | https://security-tracker.debian.org/tracker/CVE-2017-5834   
                      libplist | CVE-2017-5835    | https://security-tracker.debian.org/tracker/CVE-2017-5835   
                      libplist | CVE-2017-5836    | https://security-tracker.debian.org/tracker/CVE-2017-5836   
                      libressl | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                      libressl | CVE-2018-12437   | https://security-tracker.debian.org/tracker/CVE-2018-12437  
                      libressl | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                   libtomcrypt | CVE-2018-12433   | https://security-tracker.debian.org/tracker/CVE-2018-12433  
                   libtomcrypt | CVE-2018-12438   | https://security-tracker.debian.org/tracker/CVE-2018-12438  
                    libtorrent | CVE-2009-1760    | https://security-tracker.debian.org/tracker/CVE-2009-1760   
                    libtorrent | CVE-2016-5301    | https://security-tracker.debian.org/tracker/CVE-2016-5301   
                        libuci | CVE-2019-15513   | https://security-tracker.debian.org/tracker/CVE-2019-15513  
                     lightning | CVE-2020-7747    | https://security-tracker.debian.org/tracker/CVE-2020-7747   
                           lua | CVE-2014-5461    | https://security-tracker.debian.org/tracker/CVE-2014-5461   
                           lua | CVE-2020-15888   | https://security-tracker.debian.org/tracker/CVE-2020-15888  
                           lua | CVE-2020-15945   | https://security-tracker.debian.org/tracker/CVE-2020-15945  
                          lynx | CVE-1999-0817    | https://security-tracker.debian.org/tracker/CVE-1999-0817   
                          lynx | CVE-2012-5821    | https://security-tracker.debian.org/tracker/CVE-2012-5821   
                          lynx | CVE-2016-9179    | https://security-tracker.debian.org/tracker/CVE-2016-9179   
                        midori | CVE-2019-19916   | https://security-tracker.debian.org/tracker/CVE-2019-19916  
                       mongodb | CVE-2014-8180    | https://security-tracker.debian.org/tracker/CVE-2014-8180   
                       mongodb | CVE-2017-18381   | https://security-tracker.debian.org/tracker/CVE-2017-18381  
                       mongodb | CVE-2017-2665    | https://security-tracker.debian.org/tracker/CVE-2017-2665   
                      mongoose | CVE-2021-26528   | https://security-tracker.debian.org/tracker/CVE-2021-26528  
                      mongoose | CVE-2021-26529   | https://security-tracker.debian.org/tracker/CVE-2021-26529  
                      mongoose | CVE-2021-26530   | https://security-tracker.debian.org/tracker/CVE-2021-26530  
                        monkey | CVE-2013-1771    | https://security-tracker.debian.org/tracker/CVE-2013-1771   
                        monkey | CVE-2013-2183    | https://security-tracker.debian.org/tracker/CVE-2013-2183   
                           mpd | CVE-2020-7465    | https://security-tracker.debian.org/tracker/CVE-2020-7465   
                           mpd | CVE-2020-7466    | https://security-tracker.debian.org/tracker/CVE-2020-7466   
                          mutt | CVE-2011-1429    | https://security-tracker.debian.org/tracker/CVE-2011-1429   
                       ncurses | CVE-2018-19211   | https://security-tracker.debian.org/tracker/CVE-2018-19211  
                       ncurses | CVE-2018-19217   | https://security-tracker.debian.org/tracker/CVE-2018-19217  
                         nginx | CVE-2009-4487    | https://security-tracker.debian.org/tracker/CVE-2009-4487   
                           ntp | CVE-2019-11331   | https://security-tracker.debian.org/tracker/CVE-2019-11331  
                       openjdk | CVE-2009-2475    | https://security-tracker.debian.org/tracker/CVE-2009-2475   
                       openjdk | CVE-2009-2476    | https://security-tracker.debian.org/tracker/CVE-2009-2476   
                       openjdk | CVE-2009-2689    | https://security-tracker.debian.org/tracker/CVE-2009-2689   
                       openjdk | CVE-2009-2690    | https://security-tracker.debian.org/tracker/CVE-2009-2690   
                       openjdk | CVE-2009-3728    | https://security-tracker.debian.org/tracker/CVE-2009-3728   
                       openjdk | CVE-2009-3879    | https://security-tracker.debian.org/tracker/CVE-2009-3879   
                       openjdk | CVE-2009-3880    | https://security-tracker.debian.org/tracker/CVE-2009-3880   
                       openjdk | CVE-2009-3881    | https://security-tracker.debian.org/tracker/CVE-2009-3881   
                       openjdk | CVE-2009-3882    | https://security-tracker.debian.org/tracker/CVE-2009-3882   
                       openjdk | CVE-2009-3883    | https://security-tracker.debian.org/tracker/CVE-2009-3883   
                       openjdk | CVE-2009-3884    | https://security-tracker.debian.org/tracker/CVE-2009-3884   
                       openjdk | CVE-2013-0169    | https://security-tracker.debian.org/tracker/CVE-2013-0169   
                      openjpeg | CVE-2016-7163    | https://security-tracker.debian.org/tracker/CVE-2016-7163   
                      openjpeg | CVE-2016-9675    | https://security-tracker.debian.org/tracker/CVE-2016-9675   
                      openldap | CVE-2015-3276    | https://security-tracker.debian.org/tracker/CVE-2015-3276   
                       openssh | CVE-2007-2768    | https://security-tracker.debian.org/tracker/CVE-2007-2768   
                       openssh | CVE-2008-3844    | https://security-tracker.debian.org/tracker/CVE-2008-3844   
                       openssh | CVE-2014-9278    | https://security-tracker.debian.org/tracker/CVE-2014-9278   
                       openssh | CVE-2020-14145   | https://security-tracker.debian.org/tracker/CVE-2020-14145  
                      openswan | CVE-2019-10155   | https://security-tracker.debian.org/tracker/CVE-2019-10155  
                         patch | CVE-2018-6952    | https://security-tracker.debian.org/tracker/CVE-2018-6952   
                         patch | CVE-2019-20633   | https://security-tracker.debian.org/tracker/CVE-2019-20633  
                           php | CVE-2006-7168    | https://security-tracker.debian.org/tracker/CVE-2006-7168   
                           php | CVE-2007-2728    | https://security-tracker.debian.org/tracker/CVE-2007-2728   
                           php | CVE-2007-3205    | https://security-tracker.debian.org/tracker/CVE-2007-3205   
                           php | CVE-2007-4596    | https://security-tracker.debian.org/tracker/CVE-2007-4596   
                           php | CVE-2014-5459    | https://security-tracker.debian.org/tracker/CVE-2014-5459   
                        pixman | CVE-2013-0800    | https://security-tracker.debian.org/tracker/CVE-2013-0800   
                    postgresql | CVE-2017-8806    | https://security-tracker.debian.org/tracker/CVE-2017-8806   
                 powerpc-utils | CVE-2014-8165    | https://security-tracker.debian.org/tracker/CVE-2014-8165   
                      protobuf | CVE-2015-5237    | https://security-tracker.debian.org/tracker/CVE-2015-5237   
                        python | CVE-2015-5652    | https://security-tracker.debian.org/tracker/CVE-2015-5652   
                        python | CVE-2017-17522   | https://security-tracker.debian.org/tracker/CVE-2017-17522  
                        python | CVE-2017-18207   | https://security-tracker.debian.org/tracker/CVE-2017-18207  
                        python | CVE-2019-20907   | https://security-tracker.debian.org/tracker/CVE-2019-20907  
                        python | CVE-2019-9674    | https://security-tracker.debian.org/tracker/CVE-2019-9674   
                          qemu | CVE-2008-4539    | https://security-tracker.debian.org/tracker/CVE-2008-4539   
                          qemu | CVE-2017-5957    | https://security-tracker.debian.org/tracker/CVE-2017-5957   
                          qemu | CVE-2018-18438   | https://security-tracker.debian.org/tracker/CVE-2018-18438  
                          qemu | CVE-2020-35517   | https://security-tracker.debian.org/tracker/CVE-2020-35517  
                   qpid-proton | CVE-2016-2166    | https://security-tracker.debian.org/tracker/CVE-2016-2166   
                   qpid-proton | CVE-2016-4467    | https://security-tracker.debian.org/tracker/CVE-2016-4467   
                        quagga | CVE-2016-4049    | https://security-tracker.debian.org/tracker/CVE-2016-4049   
                        quagga | CVE-2017-3224    | https://security-tracker.debian.org/tracker/CVE-2017-3224   
                   resiprocate | CVE-2017-9454    | https://security-tracker.debian.org/tracker/CVE-2017-9454   
                       rsyslog | CVE-2015-3243    | https://security-tracker.debian.org/tracker/CVE-2015-3243   
                        samba4 | CVE-2011-2411    | https://security-tracker.debian.org/tracker/CVE-2011-2411   
                        samba4 | CVE-2018-1050    | https://security-tracker.debian.org/tracker/CVE-2018-1050   
                        samba4 | CVE-2018-1057    | https://security-tracker.debian.org/tracker/CVE-2018-1057   
                          shim | CVE-2014-3675    | https://security-tracker.debian.org/tracker/CVE-2014-3675   
                         smack | CVE-2014-0363    | https://security-tracker.debian.org/tracker/CVE-2014-0363   
                         smack | CVE-2014-0364    | https://security-tracker.debian.org/tracker/CVE-2014-0364   
                         smack | CVE-2016-10027   | https://security-tracker.debian.org/tracker/CVE-2016-10027  
                         spice | CVE-2016-0749    | https://security-tracker.debian.org/tracker/CVE-2016-0749   
                         spice | CVE-2016-2150    | https://security-tracker.debian.org/tracker/CVE-2016-2150   
                         spice | CVE-2018-10893   | https://security-tracker.debian.org/tracker/CVE-2018-10893  
                     syslog-ng | CVE-2008-5110    | https://security-tracker.debian.org/tracker/CVE-2008-5110   
                           tar | CVE-2007-4476    | https://security-tracker.debian.org/tracker/CVE-2007-4476   
                        thttpd | CVE-2012-5640    | https://security-tracker.debian.org/tracker/CVE-2012-5640   
                          tinc | CVE-2013-1428    | https://security-tracker.debian.org/tracker/CVE-2013-1428   
                           tor | CVE-2016-9079    | https://security-tracker.debian.org/tracker/CVE-2016-9079   
                           tor | CVE-2017-16541   | https://security-tracker.debian.org/tracker/CVE-2017-16541  
                           vlc | CVE-2020-26664   | https://security-tracker.debian.org/tracker/CVE-2020-26664  
                           xen | CVE-2011-1936    | https://security-tracker.debian.org/tracker/CVE-2011-1936   
                           xen | CVE-2011-3346    | https://security-tracker.debian.org/tracker/CVE-2011-3346   
                           xen | CVE-2014-2580    | https://security-tracker.debian.org/tracker/CVE-2014-2580   
                           xen | CVE-2014-3672    | https://security-tracker.debian.org/tracker/CVE-2014-3672   
                           xen | CVE-2015-7504    | https://security-tracker.debian.org/tracker/CVE-2015-7504   
                           xen | CVE-2015-8550    | https://security-tracker.debian.org/tracker/CVE-2015-8550   
                           xen | CVE-2015-8553    | https://security-tracker.debian.org/tracker/CVE-2015-8553   
                           xen | CVE-2016-3960    | https://security-tracker.debian.org/tracker/CVE-2016-3960   
                           xen | CVE-2016-7092    | https://security-tracker.debian.org/tracker/CVE-2016-7092   
                           xen | CVE-2016-9379    | https://security-tracker.debian.org/tracker/CVE-2016-9379   
                           xen | CVE-2016-9380    | https://security-tracker.debian.org/tracker/CVE-2016-9380   
                           xen | CVE-2016-9383    | https://security-tracker.debian.org/tracker/CVE-2016-9383   
                           xen | CVE-2016-9386    | https://security-tracker.debian.org/tracker/CVE-2016-9386   
                           xen | CVE-2017-12134   | https://security-tracker.debian.org/tracker/CVE-2017-12134  
                           xen | CVE-2017-12135   | https://security-tracker.debian.org/tracker/CVE-2017-12135  
                           xen | CVE-2017-12137   | https://security-tracker.debian.org/tracker/CVE-2017-12137  
                           xen | CVE-2017-7228    | https://security-tracker.debian.org/tracker/CVE-2017-7228   
                           xen | CVE-2018-5244    | https://security-tracker.debian.org/tracker/CVE-2018-5244   
                           xen | CVE-2018-8897    | https://security-tracker.debian.org/tracker/CVE-2018-8897   
                           xen | CVE-2021-3308    | https://security-tracker.debian.org/tracker/CVE-2021-3308   
                        xerces | CVE-2012-0880    | https://security-tracker.debian.org/tracker/CVE-2012-0880   
                         xterm | CVE-1999-0965    | https://security-tracker.debian.org/tracker/CVE-1999-0965   
                           zip | CVE-2018-13410   | https://security-tracker.debian.org/tracker/CVE-2018-13410  

-- 
http://autobuild.buildroot.net
