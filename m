From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 27 Feb 2021 08:14:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-26
Message-ID: <20210227081449.943586ED88@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-26
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  3  |  0  | 13  |
  2020.11.x  | 13  |  7  |  0  | 20  |
    master   | 120 | 47  |  1  | 168 |
     next    | 32  | 21  |  1  | 54  |

Classification of failures by reason for master
-----------------------------------------------

        host-sentry-cli-1.57.0 | 6 
                 dc3dd-7.2.641 | 3 
             libopenssl-1.1.1j | 3 
                libshout-2.4.5 | 3 
                 pixman-0.40.0 | 3 
                mono-6.12.0.90 | 2 
                       unknown | 2 
                  zeromq-4.3.4 | 2 
               apcupsd-3.14.14 | 1 
                        bustle | 1 
               capnproto-0.8.0 | 1 
  gobject-introspection-1.64.1 | 1 
                hiawatha-10.11 | 1 
             kismet-2020-12-R3 | 1 
                 libgeos-3.9.0 | 1 
             libopenh264-2.1.1 | 1 
              libostree-2020.8 | 1 
               libtheora-1.1.1 | 1 
                 mesa3d-20.3.4 | 1 
                  monkey-1.6.9 | 1 
                    mpd-0.22.3 | 1 
              netopeer2-1.1.53 | 1 
                openblas-0.3.9 | 1 
                   perl-5.32.1 | 1 
               protobuf-3.14.0 | 1 
           python-pybind-2.6.1 | 1 
                 python3-3.9.2 | 1 
                 rt-tests-1.10 | 1 
         s6-linux-init-1.0.3.1 | 1 
             tpm2-pkcs11-1.5.0 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                    xen-4.14.1 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/bef6d430955599ebdf44cbc97d3906f20f3e1aa4 |     
   sparc     |             bustle             | TIM | http://autobuild.buildroot.net/results/b7ae0d61ba64461abb4f4a6a8f6b5eeb4fceea71 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/a876b8b93258dbec874b4084d87b0b84800c5c57 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/70a5457fc0d59188c147985d3d20922799e2df46 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/a6890d8941ff7644147004f798f83b2b67078b3a | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/db2e187e5b1e55aab20603d7f54135721d5a0036 | ORPH
    mips     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/97b2cc6a65f903a3fcc17fd27b16bbcf956a8d05 | ORPH
  mips64el   |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/35b2622a69d16c56f0cfe8ef11b4333e6ed102bf |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9b0e45dadbcb59d64051443452dc02b5f35a9204 |     
  riscv64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/256f3583a84906b289069c0aba62343e03e1a50d |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/ba58aa91a96eadd3a9386d136185c72ef12e5003 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/63b4c9df98597566a56e0fe4faf7b0650bd27afb |     
   xtensa    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/c746c774f49a8844a0e8d8a6711ea15d167d53dc |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/9bade85da0d15e0474c845756a96aa5a54b7fed8 |     
  powerpc    |       kismet-2020-12-R3        | NOK | http://autobuild.buildroot.net/results/d82929b6a6da85652ccf3119b6d7e8de239626ac | ORPH
   nios2     |         libgeos-3.9.0          | NOK | http://autobuild.buildroot.net/results/0cd4c40102a1e190461f2b9c9937fe649075dac9 | ORPH
   mipsel    |       libopenh264-2.1.1        | NOK | http://autobuild.buildroot.net/results/a2a0d9600df7ce515f0825c2229e41cb07ac130f |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/7bffa787b9286cbd02a839f22d1f0f684c067d80 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/8853ed4625410dc9cae47e76cd3d13f8783c6c67 |     
  riscv32    |       libopenssl-1.1.1j        | NOK | http://autobuild.buildroot.net/results/dcd7187367597330457f739a2cdd4e9615f307d2 |     
  riscv64    |        libostree-2020.8        | NOK | http://autobuild.buildroot.net/results/c2ce0cb4a8fc4257044b356baa712a429bf7e93b |     
    arm      |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/f61443bc18c49de7c113f596aee927e946330f15 | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/9f7c16b2b1d5918eaaf607f85c640c000cb7fea9 | ORPH
    m68k     |         libshout-2.4.5         | NOK | http://autobuild.buildroot.net/results/4ad0038ae2dd864bf84eb17dbb81b1eeed0b14bf | ORPH
    or1k     |        libtheora-1.1.1         | NOK | http://autobuild.buildroot.net/results/93ee32915eb919d744305cefa16ebbc2fc91c345 | ORPH
    mips     |         mesa3d-20.3.4          | NOK | http://autobuild.buildroot.net/results/c2e342c0a615640df5017cee4c4f8190c8203dfb |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/559fe8e49f819977d8efc439187358b80db6bd5d | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/58ec4cd4e2b76de95c7fd535331ae9cd50d64a62 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/0dea4c167b6edbb0decf8d2c256fa8179c1af61b |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/b7a51cc08874af3a4be4bc2b59250f6ffba0f87a |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/4ff9f7ffabe47674c2873f1d0f1e1bd1e1f2f1d4 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/c1720470a43c599fa17a7184e9f08d0215d33ddc | ORPH
    arm      |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/8b72366fb08ac99a9bbdc9c2647cc8b22ca1d6d7 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/b48a91000ca5becc297200fcaf1d0ef8f9553623 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/9fac9ef9d6d053faf0680d7a5382d15b45ebb644 |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/613e4a779c876b4047b84041613409a7537ce65d |     
    or1k     |        protobuf-3.14.0         | NOK | http://autobuild.buildroot.net/results/8355e143ca51e2470ee9b249e4f92ce29e8306f0 |     
microblazeel |      python-pybind-2.6.1       | NOK | http://autobuild.buildroot.net/results/44c98429a90e2799a92f71e0b70c6b0cc6145867 |     
   xtensa    |         python3-3.9.2          | NOK | http://autobuild.buildroot.net/results/273e659cce053793fe8846c8bbc4d6a12dcb7630 |     
  powerpc    |         rt-tests-1.10          | NOK | http://autobuild.buildroot.net/results/56e712d0b4e186a53f71d221b08bfa703164123f |     
  riscv64    |     s6-linux-init-1.0.3.1      | NOK | http://autobuild.buildroot.net/results/5b5989dec9e8c916374eb66ad8f83397907df38f |     
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/72727462f566c1326602558e2ae637576f6d2aa7 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/6d964af74f806d702304a989b87e5629a936ca71 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/7c71c7d1c4cc615c5cdf2040c12527d3d4f2d8cf |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/94c3abaee22489fda8d6f0de56f1abd7e871bd7e |     
    arm      |           xen-4.14.1           | NOK | http://autobuild.buildroot.net/results/2c90f2088cf4883c715e3a8822e8426702158ba8 |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/02049d7e8cff404fb2bf5025a0b183d7dca8fc2a |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c0f43d62d745adea1d6df085aaeade393862bd9c |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                   mimic-1.1.0 | 1 
                qt5base-5.12.8 | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/6b298ed659dbe5456d30228f02ade92e5c53a452 |     
   x86_64    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/08427e03925a9d2356ad6ff8a4d26e21f98445ed |     
    sh4      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/06a122e4d7a25b6705370773d7f1990c007ac33f |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

                rocksdb-6.10.1 | 2 
docker-proxy-55685ba49593e6... | 1 
            lttng-tools-2.12.1 | 1 
                    mpv-0.32.0 | 1 
                       unknown | 1 
                    vlc-3.0.12 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    | docker-proxy-55685ba49593e6... | NOK | http://autobuild.buildroot.net/results/7c01c930c00a5c77624dc480faa2a0f9bff0b360 |     
  riscv64    |       lttng-tools-2.12.1       | NOK | http://autobuild.buildroot.net/results/a01acfa2211d1feb93d2bd79c99858888f8ec10c |     
    arm      |           mpv-0.32.0           | NOK | http://autobuild.buildroot.net/results/df8be92407a03e8bce5b3a136fe458d63f1c78fe |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/125da71f2f8c5c4a8b9346ff024c09de082627b8 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/b2dfe28bd1c734332f73dbdfacebc8b86e9c32e5 |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/2c3a03e055d8f7fcf60c809582690ae5cc2b91df |     
    arm      |           vlc-3.0.12           | NOK | http://autobuild.buildroot.net/results/652055f4f517e5056d35495fa5e52d72a5e61b6e |     


Classification of failures by reason for next
---------------------------------------------

                    mpd-0.22.3 | 4 
                  dhcpcd-9.4.0 | 3 
             libgpg-error-1.41 | 2 
          libxcrypt-legal-info | 2 
             babeltrace2-2.0.3 | 1 
             libopenssl-1.1.1i | 1 
                     mc-4.8.26 | 1 
                mono-6.12.0.90 | 1 
                openblas-0.3.9 | 1 
                    orc-0.4.32 | 1 
                   perl-5.32.1 | 1 
                  perl-gd-2.73 | 1 
            qt5location-5.15.2 | 1 
                   xlib_libICE | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |       babeltrace2-2.0.3        | NOK | http://autobuild.buildroot.net/results/726772065190a3d0c4d6e47f8246b8caf2d38078 |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/5b86ba3a62e13fc3b58274e1f2efe80606491f08 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/61aa77ea8f010eca2ece4fc69af43a4573bb2c5f |     
   nios2     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/af9e8f63d747c4b1465c5d0e27208f2a78441199 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/aaa91d38782878aa2e1d5b29e0c927c8d63c7942 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/c9c3f961b59f717004a0fab0a2e858a556163b1b | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/fa19ee17f7c0b679a06f02461d5549fd3bd99e4f |     
    arm      |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/69ce2a6f48c70c21118a419c6a6f555d95de1f60 |     
    arc      |      libxcrypt-legal-info      | NOK | http://autobuild.buildroot.net/results/e33a7d41d0f8a1e11ff9132d1a169423e87f2aec |     
    arm      |           mc-4.8.26            | NOK | http://autobuild.buildroot.net/results/e73f3fc609dca0cee6f6a4e7041b61cf9e4ce059 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/c7e832649ce3e48172632a6a7c72386656165cba |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/0f0468cd42b8358903c3ca55fde6512de53614a7 |     
 aarch64_be  |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/8b0ddf7c0168cff7e211b74766bab3949438a9c7 |     
  riscv64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/aa6a78646f43af9d3da80e100d82bb49843b2d75 |     
  powerpc    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/04a785ab4ba545217a6db21ce2db34ec8bdf4e63 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/9e62e3da46c8a59b6c60d76da63f355b9b811659 | ORPH
  powerpc    |           orc-0.4.32           | NOK | http://autobuild.buildroot.net/results/a91af3981ff2d0cf08b6c586f8092638b2962f09 | ORPH
    i686     |          perl-5.32.1           | NOK | http://autobuild.buildroot.net/results/14fc91c358d1ee13ff66d85a84077286441c90eb |     
  riscv64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0f1e87c99c9dc44a40211615985c97e74cd1a03d |     
  aarch64    |       qt5location-5.15.2       | NOK | http://autobuild.buildroot.net/results/4a24eff7eb3324b36d7038740c4683cb7b738810 |     
    arm      |          xlib_libICE           | TIM | http://autobuild.buildroot.net/results/03ae14a8caa5fc778736b2bb1aa10b61ba242fcd |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/33007f16184f474bd808ae4c0228fb9e53619c02 |     


Gitlab CI results for 2021-02-26
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1054797807  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1054797942  |      
                    zynqmp_zcu106 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1054797982  |      



-- 
http://autobuild.buildroot.net
