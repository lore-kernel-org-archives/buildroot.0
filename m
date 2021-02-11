From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Feb 2021 08:19:47 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-02-10
Message-ID: <20210211081954.A999F86644@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-02-10
===================================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 21  |  3  |  1  | 25  |
  2020.11.x  | 15  |  1  |  0  | 16  |
    master   | 140 | 83  |  6  | 229 |
     next    |  3  |  6  |  0  |  9  |

Classification of failures by reason for master
-----------------------------------------------

              netopeer2-1.1.53 | 18
                    mpd-0.22.3 | 9 
                  perl-gd-2.73 | 6 
                  dhcpcd-9.4.0 | 5 
        host-sentry-cli-1.57.0 | 4 
                libselinux-3.1 | 4 
             libopenssl-1.1.1i | 3 
                mono-6.12.0.90 | 3 
                rocksdb-6.13.3 | 3 
                    brltty-6.3 | 2 
                        bustle | 2 
                 dc3dd-7.2.641 | 2 
             libgpg-error-1.41 | 2 
                  monkey-1.6.9 | 2 
                openblas-0.3.9 | 2 
                 pixman-0.40.0 | 2 
                 python3-3.9.1 | 2 
                       unknown | 2 
               belle-sip-4.4.8 | 1 
                        c-icap | 1 
               capnproto-0.8.0 | 1 
                     efivar-37 | 1 
                elfutils-0.181 | 1 
                           fmt | 1 
 glslsandbox-player-2019.08.23 | 1 
                        hdparm | 1 
          host-gcc-final-9.3.0 | 1 
                host-go-1.15.7 | 1 
         host-shared-mime-info | 1 
                  ndisc6-1.0.4 | 1 
sox-7524160b29a476f7e87bc14... | 1 
             tpm2-pkcs11-1.5.0 | 1 
uclibc-ng-test-c64d6ac77f0e... | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.4.8         | NOK | http://autobuild.buildroot.net/results/a46c1c001249e1ed4d691a35f8467a87e92a606e |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/df8995b813fc048eb9ea41446cfee45278ec043f |     
    arm      |           brltty-6.3           | NOK | http://autobuild.buildroot.net/results/9115bc7178bde994696255eb77eaa6e943356cdd |     
   s390x     |             bustle             | TIM | http://autobuild.buildroot.net/results/fa106c559de6a4f1a8264ac14ef59a4b51152946 |     
  powerpc    |             bustle             | TIM | http://autobuild.buildroot.net/results/6d903cedc16685ad54cf158826b8e24b0781df87 |     
    arm      |             c-icap             | TIM | http://autobuild.buildroot.net/results/91bd1597def3c59dba25fd57c025fe7258fb4126 |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/3cb32adcaa89b1cb87701461028719fbf95d7377 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/b7c31ec7a37e65d922377d1e963838485d1cdd80 | ORPH
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/54b46a9c5135301dece22bb1a897baa258670435 | ORPH
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/d04d112b991df483fad8b5ec86a211140804afec |     
    m68k     |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/3cec5df711f9d1cd694552ff410fb6b97a4e1544 |     
microblazeel |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ab8faedb5b729f2fb2ec1848a98cf6baa5a10861 |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/19abeb77d5384986dd861b95d9749a6a9b95c89e |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/a3332a462e02dc7bde05ae272dc099d11b635d85 |     
   x86_64    |           efivar-37            | NOK | http://autobuild.buildroot.net/results/af1caa51ad0e1854e9182dc1b4e171b262ec03f1 |     
   sparc     |         elfutils-0.181         | NOK | http://autobuild.buildroot.net/results/068448ff7acd59031bcfba095ec6ff90c5482da1 | ORPH
    i686     |              fmt               | TIM | http://autobuild.buildroot.net/results/370a92872e23f8c05bd89187765c2203b40a410f |     
    arm      | glslsandbox-player-2019.08.23  | NOK | http://autobuild.buildroot.net/results/268f4d885986dfbcc8e5834a1a12d9878524dab6 |     
 powerpc64   |             hdparm             | TIM | http://autobuild.buildroot.net/results/70e15dbddbde23f276343ca0ea60e870d0445341 |     
microblazeel |      host-gcc-final-9.3.0      | NOK | http://autobuild.buildroot.net/results/c3d8f936e21671175c957eff21f0a9da0381ff57 |     
  mips64el   |         host-go-1.15.7         | NOK | http://autobuild.buildroot.net/results/daf9a0aaa1a10968bb6781f2f3766124b39788db |     
   mipsel    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bd49e9cc57276bf46803350cdcc0a7964034aa84 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/8f47905ca877aaa575623f34afb20529a8f992bd |     
  aarch64    |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/16a203158d67f10973f2ffa3912d91edf235f413 |     
    arm      |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/bb930ad3d4df87f764928e965054b9476dfdd009 |     
    mips     |     host-shared-mime-info      | TIM | http://autobuild.buildroot.net/results/616e0fd3e7b3d46054aea3642956e49e3cb443d0 |     
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/d832ed9d16b17cc0b43aab03fd0b356693d35f96 | ORPH
    arm      |       libgpg-error-1.41        | NOK | http://autobuild.buildroot.net/results/74f0f1dbf9fe735051dd572edde70dc180baef9f | ORPH
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/aa12b7cc9074cd46415fe1a864e3823be106e448 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/5a4f5fe8e042272a93e9510bfbf7e22ae01b04f1 |     
  riscv32    |       libopenssl-1.1.1i        | NOK | http://autobuild.buildroot.net/results/c591bc0267fb196cecc8a77ac6e933f4839c4aa1 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/4081c959fa9e4ca322804bc82a05965182835879 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/9207055d9568628b6519442b14b55e66e4284340 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/82f66433e8182688a7bf4e6457b81885fd7bbb83 |     
    arm      |         libselinux-3.1         | NOK | http://autobuild.buildroot.net/results/b52825b85e756d828092a5368717461089c3ebfc |     
   x86_64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/057d60e6a3318cbd1407126d62c9542a516d8dd5 | ORPH
  riscv64    |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/19c51065139788d35eb51bdc0f28568703375995 | ORPH
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/b02907dd1431fead12960365c60dfe08c67ba895 |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1a8e3a1de90afe098800d99307bec3f8dc6f4f6c |     
    arm      |         mono-6.12.0.90         | NOK | http://autobuild.buildroot.net/results/1a2d70d889d8134f3ab702ad08933481e1dea0f3 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/5c202acc48e81817504837f05c3dcc47200ac3a0 |     
   xtensa    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/96ae8d23a02ab0a9c9c96c1681e92936e6c39ce7 |     
   x86_64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d07dc1183e8fae632e6738deb6524be8ce43a706 |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/02b058032bbf14ff9d5e967f545fe712c5678dd0 |     
  aarch64    |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/4a432c18e33bb674fa8f6514cadb98730e27338a |     
  mips64el   |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/aba7e6033b055cfe651de3f5442f371deac8cd4e |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/b43e426a69590da2b207e2cc56e7624554f3a678 |     
    arm      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/d6429c74889663caaefea8afb6b562bee1a7d8ae |     
    arc      |           mpd-0.22.3           | NOK | http://autobuild.buildroot.net/results/7c5f3bcd798a08051613293c55c1cc904ba1f3fc |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/e8fb9d242d98e291a39b2a7249d4a24814417791 | ORPH
powerpc64le  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/766d7b730ed3e5ba2df07ced8828b3ea8982428a |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/37a7fc6af4ef49f0b031907b69ac97d1c9f198d9 |     
  riscv64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/5e465822bb32e3604da6c543f4091ba6bdad7af7 |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/d971c37d733d7e48f53f7a18705f46712c27685a |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c4327185b0ec8f07f5ea9c99ebed74276f74b0af |     
   mipsel    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1359d71087dbb53950050790cfedeacdbf2fbff6 |     
 aarch64_be  |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c850d4e29fa4250230ccd4a72bc33ddc0992ad49 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/aa2632c08a7042e1e7d0829ad5875df3e78c689b |     
   nios2     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e16815a612b030a0c4fb46ba95765c192889f8b8 |     
  powerpc    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/e1f3a24f3544e2944d216abe8a533a1dcb5834a2 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/1ea0423a7bad7ec3eaf609275f5cb47c524db8f4 |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/0829e11f078af8ad3834845a4114039d62cb45a9 |     
    arc      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/2daed669eca364c9650f074f2edaf8cfd6966f6e |     
    arm      |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/5e76daf5ae97536f9b631ec20f190495623a45bb |     
   x86_64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/ad15069b26b891adbe8f078e6a5e49a803bd3d6d |     
    mips     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/8ae6e56e885cc1ae765be55e66d2cf5c7d2e8d23 |     
  aarch64    |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/a6b77cc60056c4563e83cd60e6615bab90ee3151 |     
    m68k     |        netopeer2-1.1.53        | NOK | http://autobuild.buildroot.net/results/c22857684edb1aba5d55e872dae17964b4f5e033 |     
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/59069cbbbdc3bc67569171737e1acab2d323c715 | ORPH
   x86_64    |         openblas-0.3.9         | NOK | http://autobuild.buildroot.net/results/d832b81d5698c000dc6d6c890878016c886e20c3 | ORPH
   x86_64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/a834885c073bc0a9a5168caccb1f90a2341b08a6 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/ad7592c3e234b4faddbf1af67ff2b94d11c0dc99 |     
    mips     |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/3d245bca975f8cd9cd7349ef9f5b83b1579d9106 |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/802f4d16a68180683f816f4269cd85c6f6c14472 |     
    arm      |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/c4bad0a8e39fedfc00afec72c7e22d6b50197bfb |     
  aarch64    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/3b1ed00c261b6f5d0dc11cd27ef650f426209f7b |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/af183f39b608b2f7de43d6e0e8c70bd5c70129db |     
    sh4      |         pixman-0.40.0          | NOK | http://autobuild.buildroot.net/results/971f459962ee8aa2887515e0d82b7b55e98e8e93 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/c5dd05122899b3accb24652620793fef4fd93061 |     
   xtensa    |         python3-3.9.1          | NOK | http://autobuild.buildroot.net/results/deb379fd3e2d1e0c1cee078032221c00ac0a6cae |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/5e64726f488cafcb1063bfc6ba2aefc698d0134f |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/8ee9e9740ba54aaabe7283d5a58b035c9e8b54a0 |     
    m68k     |         rocksdb-6.13.3         | NOK | http://autobuild.buildroot.net/results/7003894d750bacc92f135310fe587a198ad7e157 |     
  powerpc    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/f525793728b9128aacbef48c6887af2fd0b30092 | ORPH
    arm      |       tpm2-pkcs11-1.5.0        | NOK | http://autobuild.buildroot.net/results/49bec81fc2fc7acfd27824e560dbc93bac690ff3 |     
  riscv64    | uclibc-ng-test-c64d6ac77f0e... | NOK | http://autobuild.buildroot.net/results/3176f5e5648682b41d8221d5c4281d0e782fc12d |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/8785f15397b0243a3485b19864ad23dedc65eda1 |     
   s390x     |            unknown             | NOK | http://autobuild.buildroot.net/results/079da03fbe53214eb7b85c44181aa1c6ca63041c |     
    or1k     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/03bb3ecc85409a00b9f1b1e4e242845de292d77d |     


Classification of failures by reason for 2020.02.x
--------------------------------------------------

                        c-icap | 1 
                 rocksdb-6.6.4 | 1 
sox-7524160b29a476f7e87bc14... | 1 
                       unknown | 1 


Detail of failures for 2020.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |             c-icap             | TIM | http://autobuild.buildroot.net/results/0bddb6c677309097cd6ce98aae28441470ac87ca |     
    or1k     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/513bdff67ece4cc751d03ef5c8f0790791ebcbed |     
   xtensa    | sox-7524160b29a476f7e87bc14... | NOK | http://autobuild.buildroot.net/results/cd3dc9c8e08518c6c193e6d87bd2707e33ac4379 | ORPH
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/ed2097dab89f8bcb413371c03c14f24dabdef9e2 |     


Classification of failures by reason for 2020.11.x
--------------------------------------------------

               capnproto-0.8.0 | 1 


Detail of failures for 2020.11.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/fdf7ae4f72c00885c4da37c69b9cc3529c69b47d |     


Classification of failures by reason for next
---------------------------------------------

                  dhcpcd-9.4.0 | 2 
                clamav-0.103.1 | 1 
                  perl-gd-2.73 | 1 
                       unknown | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for next
---------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |         clamav-0.103.1         | NOK | http://autobuild.buildroot.net/results/c69f71bf34a8c56548770629f4df987b509c98ec |     
   xtensa    |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/400b528bea499decd1b6ad73ecb953a4e40c9a71 |     
    arc      |          dhcpcd-9.4.0          | NOK | http://autobuild.buildroot.net/results/ca1c1cb5c05881f5635a8fd73e84f5a456d4e939 |     
  powerpc    |          perl-gd-2.73          | NOK | http://autobuild.buildroot.net/results/0b7fa3316401e430627bdb79c61653193012620e |     
   x86_64    |            unknown             | NOK | http://autobuild.buildroot.net/results/1f453773eafdd8beb247e66cbb325f4e21a2c2f0 |     
    i586     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/c132142308c39ca48d3755c9bdbb802bb9b8462a |     


Gitlab CI results for 2021-02-10
================================

Detail of defconfig failures for 2021.02-rc1
--------------------------------------------

                        defconfig |                        link to the job                        | orph?
----------------------------------+---------------------------------------------------------------+------
                        avenger96 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385566  |      
              kontron_smarc_sal28 | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385674  |      
      microchip_sam9x60ek_mmc_dev | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385684  |      
               raspberrypi3_qt5we | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385852  |      


Detail of runtime-test failures for 2021.02-rc1
-----------------------------------------------

             runtime-test |                        link to the job                        | orph?
--------------------------+---------------------------------------------------------------+------
         TestATFAllwinner | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385909  | ORPH 
     TestGlibcAllTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385939  | ORPH 
...DefaultLimitedTimezone | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019385940  | ORPH 
          TestPerlGDGraph | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019386088  | ORPH 
                 TestRust | https://gitlab.com/buildroot.org/buildroot/-/jobs/1019386205  | ORPH 



-- 
http://autobuild.buildroot.net
