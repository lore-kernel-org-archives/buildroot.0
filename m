From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Oct 2020 07:10:40 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-10-22
Message-ID: <20201023071047.2F03C86F9A@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-10-22
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 23  |  4  |  0  | 27  |
  2020.08.x  | 19  |  3  |  0  | 22  |
    master   | 136 | 60  |  0  | 196 |

Classification of failures by reason for master
-----------------------------------------------

                  host-frr-7.4 | 11
              asterisk-16.13.0 | 4 
        host-sentry-cli-1.57.0 | 4 
                   guile-3.0.4 | 3 
                   libcap-2.43 | 3 
               libuhttpd-3.4.0 | 3 
              bitcoin-0.19.0.1 | 2 
                 dc3dd-7.2.641 | 2 
uclibc-ng-test-c64d6ac77f0e... | 2 
               apcupsd-3.14.14 | 1 
                  boost-1.74.0 | 1 
                 dmalloc-5.5.2 | 1 
              gnuradio-3.8.1.0 | 1 
  gobject-introspection-1.64.1 | 1 
       gst1-plugins-bad-1.18.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
                hiawatha-10.11 | 1 
                host-go-1.15.2 | 1 
                   httping-2.5 | 1 
             ipsec-tools-0.8.2 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
               libglib2-2.64.4 | 1 
               libupnpp-0.19.4 | 1 
                  luajit-2.1.2 | 1 
                   mimic-1.1.0 | 1 
         mono-gtksharp3-2.99.3 | 1 
                  ndisc6-1.0.4 | 1 
                openntpd-6.2p3 | 1 
                rocksdb-6.10.1 | 1 
      spandsp-3.0.0-6ec23e5a7e | 1 
             stress-ng-0.11.17 | 1 
                  uhd-3.15.0.0 | 1 
                       unknown | 1 
                    vlc-3.0.11 | 1 
                    xen-4.14.0 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/6afadda1f61aa116be4c9736050ff96bca31fa80 |     
   nios2     |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/5b0f5566f66561680e2f667df23ff824e3be92f1 |     
 aarch64_be  |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/fa303a4d256cdc45947cbdc24a83c6bcabc58a54 |     
   mipsel    |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/8e31b0c3a969cf31d5a3e578a6ec7412900bf1df |     
  mips64el   |        asterisk-16.13.0        | NOK | http://autobuild.buildroot.net/results/736fb68696d2c73fd837a03403408c304663716b |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/fcbd600bcbc43dad0011dfc52deb120240120671 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e40b8677f82c8d09cb8818256345da817ff63e6c |     
   nios2     |          boost-1.74.0          | NOK | http://autobuild.buildroot.net/results/12fc06be370da8ce3f817069d3a2a438563a4fd2 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/2a6fc5fae2ea765b9f8fbc5a4a93a6f98c8f66e8 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/ed534112b604872d6a90125034fc538774d79b08 | ORPH
    arc      |         dmalloc-5.5.2          | NOK | http://autobuild.buildroot.net/results/8138cb52d8c0eccb44f34f4722987bb079166520 | ORPH
    sh4      |        gnuradio-3.8.1.0        | NOK | http://autobuild.buildroot.net/results/3ce0287194907aa37965666ae4575e1405018ebe |     
   s390x     |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/8ea71bd97516eaca057a8c8395a0a256cacb7182 |     
    arm      |    gst1-plugins-bad-1.18.0     | NOK | http://autobuild.buildroot.net/results/112d9c01045bef16df828f587c0f30754d3bce54 | ORPH
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/a940964b0140f60bed47cc4425d208495aa5a1bd | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/5a61f7e8193f3450b8506d09b1bbcdc9b7d873e1 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/d3147540480d499084eb8291b789356fbc67e476 | ORPH
    arm      |          guile-3.0.4           | NOK | http://autobuild.buildroot.net/results/e91c8fed7bee38a6aabfe82175c0b269ffc5f131 | ORPH
   xtensa    |         hiawatha-10.11         | NOK | http://autobuild.buildroot.net/results/4861235e2c61dfed2cd923ccfe0b3e56dd9728f0 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/3327e702d3e44f0723f28ee01fb6d39c10c24fbb |     
  powerpc    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/c8e139ffdf6e4e8ded898d2c211fa9f69e5a9f1c |     
   x86_64    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/82e6b7c8113395b3084cd9d56abefe96accd5af3 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/24aa7ed5e5d20e9009786abd9d3b6f3879373369 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/0072ebd185c49329560d420bac93afbcf2a289dd |     
    i586     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/cae5d46f67b32c771c358acf53f39eeee1945402 |     
  mips64el   |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/678e4945eb7726eb6a9bb2730a8554d0330b24c0 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/94ec97e86468436f185fd4ce8454fe162776bf8d |     
    mips     |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4c31f14f5e7728821c0b55f9d9165ccedd1c8339 |     
    arm      |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/7db5afab191951570760f21e446f77eca1e0fe3f |     
   mipsel    |          host-frr-7.4          | NOK | http://autobuild.buildroot.net/results/4165226d1e2ad6d28cab7010e8b14db030357faa |     
  mips64el   |         host-go-1.15.2         | NOK | http://autobuild.buildroot.net/results/37ca5b4c3001135962db4c999b3a514227508a37 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8507136d54bbf0b133e0c8d5d6637c923b4f88d1 |     
  nds32le    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/d8a842458bf638e29d8c68ab368aee7e9d0a0615 |     
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/6d8a721573a2428485cda4978d93c24484df2336 |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/cb0e3e019f47096701e3be615ab13084b33f35c4 |     
   xtensa    |          httping-2.5           | NOK | http://autobuild.buildroot.net/results/a7762e3114624816869abf25ee085938aaa1b72c |     
    arc      |       ipsec-tools-0.8.2        | NOK | http://autobuild.buildroot.net/results/69aa88b3b3dd2a2d68e89cb870f2339a6e7203cf | ORPH
   x86_64    | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/4acfcd2993091dd36b465a424ab0d8879a78ffbd |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/55bee14adc8bb9ae9f42628e4d5708799d40529e |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/22100cf94f4dd4c9d22a26f1f951301b1b12e985 |     
    arm      |          libcap-2.43           | NOK | http://autobuild.buildroot.net/results/9d62920781b9dfce0453402d35aedb3142f8cc1d |     
    mips     |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/0f4647cdd9de4a1dda487d075b3ec66ce64d2228 |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/f5bcbd1db3259a99fe7e09d1aacc3c96b4763492 |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/77548aef9e3ec4218cd9102c713a3928c3492753 |     
    arm      |        libuhttpd-3.4.0         | NOK | http://autobuild.buildroot.net/results/f8ffe99a4762362a044af0554254e5c50304b063 |     
    arc      |        libupnpp-0.19.4         | NOK | http://autobuild.buildroot.net/results/115a161d49fb5c7aa6cf8b1e6078ba82f5316f71 |     
    arm      |          luajit-2.1.2          | NOK | http://autobuild.buildroot.net/results/fccd5b17fd4967f1fb5a62e66893b156c4b2fdff |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/07d90811f4199634ce6fa40d04b7bf99238f1556 |     
    arm      |     mono-gtksharp3-2.99.3      | NOK | http://autobuild.buildroot.net/results/685671cf72342513298e18c45027abf4b85a1b32 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/023b8c73ec76d370dcf5e9509551d48adafb827e | ORPH
    arm      |         openntpd-6.2p3         | NOK | http://autobuild.buildroot.net/results/ed7798e215a2c8608608bc434f66a5f2c221ee6f | ORPH
    arm      |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/487431a6a67a49b54a36970823265f4322178e39 |     
    i686     |    spandsp-3.0.0-6ec23e5a7e    | NOK | http://autobuild.buildroot.net/results/84d36e64bc2c4e01404429bb43a4ea1d500dc7ef |     
    arm      |       stress-ng-0.11.17        | NOK | http://autobuild.buildroot.net/results/9ecb92f8ffa45a16b24f5187b4c5adb5b322bcfc |     
   nios2     | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/af4dc2ec48420813b61611a07d0a4f6ee76fc407 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/2843368d18ab6a96c1adf4c250ae2e384dd81401 |     
    arm      |          uhd-3.15.0.0          | NOK | http://autobuild.buildroot.net/results/2cce4af0b671138508d16ffb4de1f1820a856f59 |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/49d26d983b541ecd4b6dedb1dc1a3882429b87a8 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/8dff65f0d8b849446fd7281eeafb82b03f41ff4f |     
  aarch64    |           xen-4.14.0           | NOK | http://autobuild.buildroot.net/results/2e392989dae32e18e1f6ecd821933a8f3eca44b9 |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                    mpv-0.29.1 | 1 
                samba4-4.11.13 | 1 
                   sdl2-2.0.10 | 1 
                    vlc-3.0.11 | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/b1f881fb88bf614106332eff3f25ff195b717cd3 |     
  mips64el   |         samba4-4.11.13         | NOK | http://autobuild.buildroot.net/results/96eaa6e369bfe20fad3b0b433bdb2099a2080a28 |     
    arc      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/050d887fa9f494ec051504cfe9abb1431d011068 |     
    sh4      |           vlc-3.0.11           | NOK | http://autobuild.buildroot.net/results/7ca34f95ea272d74a180cfda84182a992346a28a |     


Classification of failures by reason for 2020.08.x
--------------------------------------------------

                coreutils-8.32 | 1 
               qt5webkit-5.9.1 | 1 
                      tio-1.32 | 1 


Detail of failures for 2020.08.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/7fadca5f833e724e686ab9d2dff70c7e24a3c82c | ORPH
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/a6d6247f8e353c317aa4c2a25a9b9b1c94884090 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/c681347ba12c482c7d481b6f8c1709735771a931 |     


Gitlab CI results for 2020-10-22
================================

Detail of defconfig failures for master
---------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                amarula_a64_relic |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461728  |      
             amarula_vyasa_rk3288 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461729  |      
                 arcturus_ucp1020 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732  |      
                   armadeus_apf27 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461735  |      
                   armadeus_apf51 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461737  |      
                  at91sam9260eknf |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461739  |      
              freescale_imx8mnevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461791  |      
               freescale_p1025twr |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461795  |      
                   mx6sx_udoo_neo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461837  |      
                          mx6udoo |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461838  |      
                      orangepi_pc |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461872  |      
                qemu_arm_vexpress |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461891  |      
             qemu_arm_vexpress_tz |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461892  |      
               qemu_ppc_mpc8544ds |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461917  |      
                qemu_riscv32_virt |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461919  |      
               raspberrypi3_qt5we |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461935  |      
                           rock64 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461941  |      
                       rock_pi_n8 |  https://gitlab.com/buildroot.org/buildroot/-/jobs/805461944  |      



-- 
http://autobuild.buildroot.net
