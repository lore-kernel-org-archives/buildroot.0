From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 03 Apr 2021 09:22:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-04-02
Message-ID: <20210403092240.F11D160668@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-04-02
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 14  |  1  |  0  | 15  |
  2020.11.x  |  8  |  4  |  0  | 12  |
  2021.02.x  | 21  |  5  |  0  | 26  |
    master   | 104 | 32  |  0  | 136 |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
package/mender/mender.mk:10... | 5 
                  monkey-1.6.9 | 2 
                  zeromq-4.3.4 | 2 
                  boost-1.75.0 | 1 
                  botan-2.17.3 | 1 
 glslsandbox-player-2019.08.23 | 1 
  gobject-introspection-1.64.1 | 1 
             kismet-2020-12-R3 | 1 
              micropython-1.14 | 1 
                  ndisc6-1.0.4 | 1 
                 openmpi-4.0.0 | 1 
                 pixman-0.40.0 | 1 
           python-pybind-2.6.1 | 1 
                 python3-3.9.2 | 1 
      qt5webkit-examples-5.9.1 | 1 
            quickjs-2020-11-08 | 1 
                rocksdb-6.13.3 | 1 
                 samba4-4.14.2 | 1 
                   strace-5.11 | 1 
                suricata-6.0.2 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |          boost-1.75.0          | NOK | http://autobuild.buildroot.net/results/0b705fb60d7ed612bdf0634a2df6b7646d0cab71 |     
  riscv32    |          botan-2.17.3          | NOK | http://autobuild.buildroot.net/results/1c399312dbec5d7a28ec90d62fdd8f47fa14ff4b | ORPH
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/0781e1e89a132f10a5e3eb1465eabb9932252b19 |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/9a2dec1ac8c969b6842ab5c116c3afa5a3716b72 | ORPH
  powerpc    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/757511f63bdea19ef72bdcffba894e7d69a13f3c |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ab290ede4f75e0936db1016e367ec6f31e9c4f5c |     
   x86_64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/5d81981890c8e44557782473b96d722f9fa48cc9 |     
    i586     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c4e5e8bcc24106253b5ab803b750169eced1f069 |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9f08c11d3c616d32dc54c32047494d46174a965e |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/72073553b31ec9dcebaa68c8a53e53d7ad1ce281 |     
   xtensa    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/69dcb7ac99e63fca342e4d52d9311d1ee1931911 | ORPH
   xtensa    |        micropython-1.14        | NOK | http://autobuild.buildroot.net/results/eecb25385f3d3a2fe14299a1d5132f4c1e22a434 |     
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/1c67467a8e3a6c4545d8336abbe449ee641f824a | ORPH
  aarch64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/af8bb2d05722e5f7dd35a2344ffdd420a5253978 | ORPH
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/eae2307fb5dc0fdd8ffffe4e9e0c1b482934694d | ORPH
   mipsel    |         openmpi-4.0.0          | NOK | http://autobuild.buildroot.net/results/a71a0cae256bdd53613c970e930bec3c3a44b543 | ORPH
    arm      | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/4f0985742f7985a0ec907549ea976a3ecff0ec06 |     
    arm      | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/2c57dd50e6e9978c14cb967aaa8a0496a31d575e |     
    arm      | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/49c063c39a4795b69c291694ddb52cb649016d43 |     
    arm      | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/f0e220263e0a72aa5fdcea9ed750270065c2573a |     
  aarch64    | package/mender/mender.mk:10... | NOK | http://autobuild.buildroot.net/results/db7df2e6cd83cab5f7311fde925d74f0e62571b9 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/5953d95245fbe19a51caceb4b1a210da844c9ed5 |     
    arc      |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/38e8ab0e6696169d27ad7d5c6dac5efdeeede7eb |     
microblazeel |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/091cb77e3452ddf15532206ec805b14787335354 |     
  aarch64    |    qt5webkit-examples-5.9.1    | NOK | http://autobuild.buildroot.net/results/a514281cbcd74a2e049f26cc924fa17a39761801 |     
   nios2     |       quickjs-2020-11-08       | NOK | http://autobuild.buildroot.net/results/7fb093c1ac0b06fe62a7169e068cfdbba503a820 |     
    arm      |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/fd4540fc585762ba9388de947c0b7bf58229be6a |     
  aarch64    |         samba4-4.14.2          | NOK | http://autobuild.buildroot.net/results/32d6f47efc2fccdc704f22ce5f06192573b317f1 |     
   xtensa    |          strace-5.11           | NOK | http://autobuild.buildroot.net/results/b2daa7c6478770169e93786891bb5ed98a8f7a9c |     
   x86_64    |         suricata-6.0.2         | NOK | http://autobuild.buildroot.net/results/63566e8d9d2d8f86b1ed80007064a05e414a3a69 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/7c44ea433cbafa9a5fbf03ca5725786f179ebc08 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/14271fc175a27286edeca3bca7bcbf7d17a846f8 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

               dvdauthor-0.7.2 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |        dvdauthor-0.7.2         | NOK | http://autobuild.buildroot.net/results/b70e23c9be5af59c0ce8886853fa9cd3cf3330fc |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                 dc3dd-7.2.641 | 1 
        host-sentry-cli-1.57.0 | 1 
             kismet-2020-09-R4 | 1 
  matchbox-startup-monitor-0.1 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/52e5ae19760079419d555f4c3ed47b75aecc509a | ORPH
    arc      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/82be42ab36fbdbc29f0e3b9694c2275d1668a951 |     
  powerpc    |       kismet-2020-09-R4        | NOK | http://autobuild.buildroot.net/results/1d72175341705d40833dd8867ba4e0cea4ce581b | ORPH
  powerpc    |  matchbox-startup-monitor-0.1  | NOK | http://autobuild.buildroot.net/results/b4ef376236a6aa78d0c2e10fe5b5afdd71933f9a |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

                   strace-5.10 | 2 
              asterisk-16.14.1 | 1 
                coreutils-8.32 | 1 
             util-linux-2.36.1 | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.14.1        | NOK | http://autobuild.buildroot.net/results/014c0aa142237269e887d98bac06ea2ef1376233 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/bfd954fa20e3111877cfedd189643b2f29d84499 | ORPH
   xtensa    |          strace-5.10           | NOK | http://autobuild.buildroot.net/results/1224d113eb82e2fdbf83c636c6a83a1c9d1a995a |     
   xtensa    |          strace-5.10           | NOK | http://autobuild.buildroot.net/results/91850a3fc292566becdb833005f189b728992ff2 |     
  riscv32    |       util-linux-2.36.1        | NOK | http://autobuild.buildroot.net/results/09d794107c333c6836bc00a5b40fffa8c1523734 | ORPH


Gitlab CI results for 2021-04-02
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
       acmesystems_acqua_a5_256mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419605  | ORPH 
       acmesystems_acqua_a5_512mb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419606  | ORPH 
              freescale_imx8mnevk | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419682  |      
              freescale_imx8qmmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419689  |      
             freescale_imx8qxpmek | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419691  |      
             freescale_t1040d4rdb | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419697  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419760  |      
                     qemu_sh4_r2d | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419851  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1145419864  |      



-- 
http://autobuild.buildroot.net
