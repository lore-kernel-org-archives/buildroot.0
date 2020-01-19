From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 19 Jan 2020 07:16:55 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-18
Message-ID: <20200119071703.D96AD84EA0@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-18
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 19  |  3  |  0  | 22  |
  2019.11.x  |  8  |  4  |  0  | 12  |
    master   | 88  | 77  |  2  | 167 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   mutt-1.13.3 | 9 
                    brltty-6.0 | 8 
                    parted-3.3 | 6 
                apr-util-1.6.1 | 5 
             freeswitch-1.10.2 | 5 
                      bash-5.0 | 4 
              host-grpc-1.25.0 | 3 
                       unknown | 3 
                coreutils-8.31 | 2 
                haproxy-2.0.10 | 2 
           host-doxygen-1.8.17 | 2 
                     host-llvm | 2 
                 mesa3d-19.3.2 | 2 
                  olsr-0.9.6.1 | 2 
           uboot-tools-2019.10 | 2 
                     vlc-3.0.8 | 2 
                 binutils-2.32 | 1 
                  cairo-1.16.0 | 1 
                 exim-4.93.0.4 | 1 
          gstreamer1-mm-1.10.0 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                libdrm-2.4.100 | 1 
                 libnss-3.49.1 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
               log4cplus-2.0.5 | 1 
                     lxc-3.2.1 | 1 
               mongodb-r4.0.12 | 1 
                  monkey-1.6.9 | 1 
                  ndisc6-1.0.4 | 1 
                 opencv3-3.4.9 | 1 
           python-bcrypt-3.1.7 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.5 | 1 
toolchain-external-codesour... | 1 
                    xen-4.12.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
 aarch64_be  |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/027415c7576c5d29a797baae888b1b51ff6aaf1a |     
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/edbb055b2622f64d13e366121c85d8646926b717 |     
    mips     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7aadf981e8e2fa3d7682cf1daebc7c63b3caac11 |     
    mips     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/587eda2ffd81b5ac78fc1cec2c44e1bf1c43941c |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8e43aa5429b588842592e19dadbf5aa7cf76be30 |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/ef4530a9465f1b6c84e43198e99b8e54765f79df | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/374f2e72f635fc9c2a4b3e1a10dae3ef6c0094b9 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/53979d342f77b28fe3050646f337d7c0a76f5d22 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/42075ecb4b702f9b1543d95bd4aea714bde609b2 | ORPH
    m68k     |         binutils-2.32          | NOK | http://autobuild.buildroot.net/results/2a1bfce5a6873d2f3e7e8ce74f54b1536fa1efb3 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/62a03728f71b120cf6ea58489332b79e668c3182 |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4a9279240a2c856c3572efa4607a4a1cbfcf4806 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/776d8d0471bba33570f75dbcc56bd0a8a6176fb8 |     
    arc      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/a7ba74a3dd8a21619591e33cc39dd5e7d8e1a22a |     
   x86_64    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/5fb9e6566adf36821dfb715e03ddd407ff77744c |     
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c4e3e873fed9f0313ecfcc05b2b7bc0841e03cfd |     
    m68k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/45586be8aaa5658d0221a44d5ae3ec99c9a0d003 |     
   sparc     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/8438757c89b39f70723a4306aa0d4d6f5f0c8dec |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/aa4b16257a37592d1589f3c639c931fa6903d87b |     
    m68k     |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/0f373dc68e1be8bbda0480c56aeff34a7174f43c | ORPH
   xtensa    |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/6543606ae5d7141d2e8456cf6672c65839def254 | ORPH
    arm      |         exim-4.93.0.4          | NOK | http://autobuild.buildroot.net/results/4378cf3ada4ce513ca85b7ee1264dc3415d7677a |     
    i686     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/beae33e60c2574ee0740c5a6863ccb75a679a630 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/38b841de97d9a265e0d813d966421f2d51bbdc13 |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/777f35db938de2a43da35a11abbbafa11f32d47c |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/abb6602d840d6bbdb1cef5f5ad6ab8bd1e454252 |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/5e50545906f4a4597e6ec95156424a981a107d28 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/438a948a375f4279054e116b3dc4d8a4ebc6c828 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/131181b1cdd2ba855291d0a03e29fcd643c92a5c |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/cde93d0af7b6893690216d8a255db33b2320afde |     
  riscv32    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/779b048c92ed8700014b5aa77906f33b71ee95b4 |     
  sparc64    |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/6565451e766ec8f4a075578c26a95255b0dc4adc |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/186d70e915af7abdc1bebc72fad19d37b0bc2aa3 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/bca8eaf84547888466f76a5c379f3eb865c73d2a |     
   nios2     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/4670d1c3ef2c0d0c88e961a9cd10a216ae7a0547 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/3ee5410c1630e954889ad2cd06e45b88ed37697b |     
    i686     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/a932b1cefc76cd914c7ffd3d03a939734370a785 |     
powerpc64le  | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/eb4f95419c206323b4dfad2e271d70d50c779f36 |     
   sparc     |         libdrm-2.4.100         | NOK | http://autobuild.buildroot.net/results/f09c56aa2d7274a1926444c3ef48613cdc5477d5 |     
    arm      |         libnss-3.49.1          | NOK | http://autobuild.buildroot.net/results/ee19f469b6cc244362177b9e0d45197596748c76 |     
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/6fbe8393b0fac494810cfa95ddafb912b77c7c4a |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/8482f725fc42cb9f17d0bcf07ad49a5075917a9b | ORPH
    arc      |        log4cplus-2.0.5         | NOK | http://autobuild.buildroot.net/results/fca3562636738b2119dba0bc741a4fb0c4f22cbd |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/944f05786cf3a66b46402e01bbbff78ec6949edc |     
   x86_64    |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/bd9711d1bc738a0cfab02e06f76225d12b7f1f83 |     
    or1k     |         mesa3d-19.3.2          | NOK | http://autobuild.buildroot.net/results/d7962c1347f6c592ccaa0c4e1a3a7b75a567fed8 |     
   x86_64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/993c704920cfd14806116f157075abf89176b340 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/57a79f9967755f49c9fe628ac3dc7c7e0cc8eb72 | ORPH
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/a28756b67048d29f7027e9b4b332020b9678ffb7 |     
    arm      |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f59cf888f609374f7f1c25dbd51141e87269c5ea |     
    m68k     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/f64ebca878445da0402bc29d6fe668b2d8deebb1 |     
   x86_64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/013bca4509838a2ff4e59a6a15a2a068e108ccfe |     
   mipsel    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/57c24f3e949c563e24d50788d05807f763850daf |     
   nios2     |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/3140d6ca5f4f31e8d9ac1091f2d5bc216b7e9d10 |     
  mips64el   |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/0d0a1b94e73e794c470d58630d766653e66552c9 |     
  aarch64    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/892237ea44086b2c571d0f953c4af23e75ada49a |     
   xtensa    |          mutt-1.13.3           | NOK | http://autobuild.buildroot.net/results/fb59943c9ec68f0298719d55ae08b625652a02d5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/6825ef3bb81e195e35bf4e0e5c6f137412484ea6 | ORPH
  riscv64    |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/d9a143c8e9a175741acfafd17b63544d04744ac9 | ORPH
microblazeel |          olsr-0.9.6.1          | NOK | http://autobuild.buildroot.net/results/9d6d69133789aba16daeb6dc53721597e6be9806 | ORPH
   x86_64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/7861db87afba67159211ed7253697bbb5537b46d |     
microblazeel |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/99e20e0deaf25f70464604dbbecd81b5ba8206cb |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/cba2dc97ac6c1c6c81578a726512f6803c3b8a1b |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/55ab354741a5e3905577d75d0ab21a83e87085f2 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/6a7f99b8a89fe97a0ecc1c79f16a2700fe908de1 |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/5209b37309ae6e53f5d47ef678f4342666dc1540 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/f79a314520db363a5289237d1d67cd48785c7ece |     
  riscv64    |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/3d184f1ab562f36843030400641a44c0ad2d04be |     
 powerpc64   |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/990e4f480ccca93736de9656ad21f991a7315f32 |     
 aarch64_be  |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/0c3d96fdb35bb764809c4fa14f119333b843dd24 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/7fdd015e339b23893ffb20573f4e3e41dbaca6a1 | ORPH
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/218e6e1e6ca63db8cd1ed24ccd1d51cd077b23cf |     
   x86_64    |      uboot-tools-2019.10       | NOK | http://autobuild.buildroot.net/results/004dc9954bc84da76f3c5fa1ebdb6d04c199a816 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d7e40b093a72cb255cbd09b385695841b9fc403f |     
  sparc64    |            unknown             | NOK | http://autobuild.buildroot.net/results/de12e20bdcaeee335d8cb5089f585563aebb36a5 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/5ed561d2bc015f83b438bd49c834bcc1d05d7dc4 |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/332f6be77cd438d64b6e73207922ea2c8daa0033 |     
    mips     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/aa27430fe3e2e59592920ca8eb479418448ff490 |     
  aarch64    |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/02bbfaae3cf22741dbd4de1db37631978ad7c147 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                  libssh-0.9.3 | 1 
                  monkey-1.6.9 | 1 
                    xen-4.11.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   xtensa    |          libssh-0.9.3          | NOK | http://autobuild.buildroot.net/results/5a9c07bfdfd2ee372a967798892008fdaa5d5592 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/c29c02120fa67d72051ca9520ed91b53d922a673 | ORPH
  aarch64    |           xen-4.11.2           | NOK | http://autobuild.buildroot.net/results/e55b0938a24c333383e5e62599c7f17ec248504d |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-grpc-1.23.0 | 2 
                  gmpc-11.8.16 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/d70bdb0820dcbd80b20c49e5c88e95ba877c3fc2 | ORPH
    i686     |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/46e0767c33eba12b47b62f9b5e32e9c0bac3f911 |     
   xtensa    |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/dc31c7af778c56493afae9b7d2642ce07d665e13 |     
    arm      | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/917992f41803aa5fec27ef4dd0b8c5d9c62dda91 | ORPH



-- 
http://autobuild.buildroot.net
