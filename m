From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 14 Jul 2021 05:47:51 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2021-07-13
Message-ID: <20210714054756.2132C60A60@smtp3.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2021-07-13
===================================

      branch |  OK | NOK | TIM | TOT |
  2021.02.x  | 13  |  5  |  0  | 18  |
  2021.05.x  | 14  |  4  |  0  | 18  |
    master   | 32  | 65  |  0  | 97  |

Classification of failures by reason for master
-----------------------------------------------

         host-gcc-final-10.3.0 | 7 
                   seatd-0.5.0 | 7 
         host-gcc-final-11.1.0 | 6 
cegui-00b4e1fe174da53b7ed72... | 5 
                   eigen-3.3.7 | 3 
                  exiv2-0.27.4 | 3 
             libsndfile-1.0.31 | 3 
                    qemu-6.0.0 | 3 
              syslog-ng-3.32.1 | 3 
               capnproto-0.8.0 | 2 
               host-qemu-6.0.0 | 2 
              keepalived-2.1.4 | 2 
kvm-unit-tests-kvm-unit-tes... | 2 
                libsoup-2.72.0 | 2 
                qt5base-5.15.2 | 2 
                 dc3dd-7.2.641 | 1 
            erlang-jiffy-1.0.6 | 1 
                   gssdp-1.2.3 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  kexec-2.0.22 | 1 
                librsvg-2.50.5 | 1 
                 mesa3d-21.1.1 | 1 
                   sdl2-2.0.14 | 1 
tvheadend-dbaa0f850394af8ab... | 1 
                       unknown | 1 
                usbguard-1.0.0 | 1 
                xenomai-3.0.10 | 1 


Detail of failures for master
-----------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/7a439aed6a09490438a562ee4677c8ce5345239c |     
  riscv64    |        capnproto-0.8.0         | NOK | http://autobuild.buildroot.net/results/999728ec4bdef610cdff528a79c49443235f8f0d |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9e22de7bdd5fbe07251d82c3162c260cd8d71351 |     
   x86_64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/a598d5cb8ffe9a5ba10f5b97ea33e4e42c62e7df |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/050967936743b317f1d8d8e9e6a58585fb395ed2 |     
    arm      | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/9d1d4fa282929f4ce1a7fda607908be39c1bde7c |     
  riscv64    | cegui-00b4e1fe174da53b7ed72... | NOK | http://autobuild.buildroot.net/results/5c1d0712af006c73705f632bb5adeb9c2c63eff9 |     
    arc      |         dc3dd-7.2.641          | NOK | http://autobuild.buildroot.net/results/d87f43a123b34a54ad64c6b53f9ad868e2ff9c18 | ORPH
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/8f7a5d8d7ab4c3b6dc2192cbe7409d73a6281da3 |     
    arm      |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/82560796f6cba8e49e679f2b7a678b07fb03310c |     
  powerpc    |          eigen-3.3.7           | NOK | http://autobuild.buildroot.net/results/f5ed7c17adc6c42f61946b5a2028c76f110954b3 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/40ad8c2c173312fd111473eb6eddf9c93695c463 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/3e6355a994db7e0ae49eb4267c2296ecc4212ba9 |     
  riscv64    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/0d4af9259f98d5e4cb11354c167ff73300d183d3 |     
    arm      |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fdd264181d4870d637ae3fc26aefd5e58c2064a5 |     
  riscv32    |          gssdp-1.2.3           | NOK | http://autobuild.buildroot.net/results/4f01a3a336c027a4d0311246d5059f1b8c6a450e |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/2ad68d5672a8c94a70fea4c6b401cb65744f9ddb |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/458ef4e04a58d309d6306ee71d4d70efb415d32c |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/662138990c4e31eba1c750ea432c48ce385a7dbd |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/b1329d81fef9578a43ffd9c7f57a459c189f46b5 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/f9f40ecf03d55f134cb6fd67c902df243515cd74 |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/3bd76e87edd49c0492031523ca588bc38504168b |     
   s390x     |     host-gcc-final-10.3.0      | NOK | http://autobuild.buildroot.net/results/17ea472fc152134c7d44f37a089e88a0de13e050 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/6f75900f32172b55d2814d14131ec83f387192ce |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/75a2862ae4af1f2cc38c3f633f655ddb195bb692 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/4ec5decda8a38a168db8f6f4bb87d77d74fbf008 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/9d3f2d8a4fabf971cfe83d526125117d5ec22359 |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/71974e1eb12dec54f1474444562381146c0d7e4d |     
    arm      |     host-gcc-final-11.1.0      | NOK | http://autobuild.buildroot.net/results/990183ef9fbbf701aa19a4f699a335d77425c4a0 |     
  mips64el   |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/72f4e704eb448b841c85c9654eaf22863b170d77 | ORPH
    arm      |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/6177d04e6cfcb4b632d05c009e929b6424dd0bca |     
  riscv32    |        host-qemu-6.0.0         | NOK | http://autobuild.buildroot.net/results/f60a42c6a4ed79cdb3e04223ab877ec3424b497a |     
    m68k     |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/3c243443d6a7486f6c88c93b7443513c22ef4138 |     
  riscv64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/963838eb600e0bc424a0a97a7935a8574b56ec2b |     
    arm      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4d1cd4fed41d10880d57ec9049e826f9036f2131 |     
  powerpc    |          kexec-2.0.22          | NOK | http://autobuild.buildroot.net/results/b26b43500f72d7095cba88d41a9af03abadec223 | ORPH
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/10a3ab262669ea2693c20904d16862c1110fc92e |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/6d394347d8c4a4d97506e6e78ca434c6715636b3 |     
  aarch64    |         librsvg-2.50.5         | NOK | http://autobuild.buildroot.net/results/6d4568a3e34b28d4d6aba5c5455b26b5634bf73a |     
    arm      |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/f4f989ecb7ea9daf5b9f7e94e064b877a459f61a |     
microblazeel |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/369e9745e446c16a3cc39d31f8a23639ceaa6f55 |     
  powerpc    |       libsndfile-1.0.31        | NOK | http://autobuild.buildroot.net/results/8641b115c4d76a59645d7c3dc05aad2ccddda3c4 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/eebde02bf40c12af5db005c85b04c0bb27e9e967 |     
    arm      |         libsoup-2.72.0         | NOK | http://autobuild.buildroot.net/results/4280a632a2e303d72ba5e41240843cdae171c312 |     
   mipsel    |         mesa3d-21.1.1          | NOK | http://autobuild.buildroot.net/results/3b35dc15c3e69eb2c68c861dc12891cbbf0155ff |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/356202fc3c46aa2e831cf536d2a37801de60173b |     
    arm      |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/980bd421afb0787305a358e91a37857206bbe1f1 |     
    i586     |           qemu-6.0.0           | NOK | http://autobuild.buildroot.net/results/d051dfb9b1c04db990b01c5f858c4b07a9390a58 |     
    arm      |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/265ebe145b699d27320fb61124593f5f51f7d942 |     
  powerpc    |         qt5base-5.15.2         | NOK | http://autobuild.buildroot.net/results/a4f36a0dc4bad8b9d36c213c8d1a5c8be5e00afe |     
   nios2     |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/15724c2940365e69e645779bd026df9da7473582 |     
 aarch64_be  |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/3e5d01238d1899a4443e51e9573621bf73b660a6 |     
   xtensa    |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/65c42f4432a6ed680c15946d9760104a5d290754 |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/4188b483711bcf21bd3a267d675c0ea1d63a04fe |     
    or1k     |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/1ebbb7a0143ea654fca80f14d2070242f2bf6337 |     
  mips64el   |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/0094484131619e13fa4435b0d0d283b1c024c32d |     
    arm      |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/572580348369ae050819eba3d1914eaef1b277dd |     
microblazeel |          seatd-0.5.0           | NOK | http://autobuild.buildroot.net/results/931bac033e3b4955122a68d9bc3ef8bdc597b25d |     
  aarch64    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/59e8dc02764f0359d0ae5882b7c8e43a9607668d |     
microblazeel |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/2b70e366bdccc21f2728af5f6e471acc039c11e1 |     
  powerpc    |        syslog-ng-3.32.1        | NOK | http://autobuild.buildroot.net/results/13318d77686fefcb55e40285d37aa52f072047ca |     
  mips64el   | tvheadend-dbaa0f850394af8ab... | NOK | http://autobuild.buildroot.net/results/d8388c030423d6f4c11fd9376f8f3b9c00fc7205 |     
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/b6137b28799ef83839d88be241bdc8d964650ee7 |     
  riscv64    |         usbguard-1.0.0         | NOK | http://autobuild.buildroot.net/results/8c2ad823cd0c1728524a2421418da00052cae633 |     
    arc      |         xenomai-3.0.10         | NOK | http://autobuild.buildroot.net/results/bde216803604762f808292ed9d5cdcb4f27405b5 |     


Classification of failures by reason for 2021.02.x
--------------------------------------------------

               cutelyst-2.11.0 | 1 
            erlang-jiffy-1.0.6 | 1 
monkey-f54856ce250c4e257354... | 1 
                   sdl2-2.0.14 | 1 
                       unknown | 1 


Detail of failures for 2021.02.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |        cutelyst-2.11.0         | NOK | http://autobuild.buildroot.net/results/7a9f890ed2cfb271c03a34e70d59c3ef22ddffd1 |     
  aarch64    |       erlang-jiffy-1.0.6       | NOK | http://autobuild.buildroot.net/results/e083bbe397f7a10603ce94234ca473b95073d57e |     
 powerpc64   | monkey-f54856ce250c4e257354... | NOK | http://autobuild.buildroot.net/results/9f85d8080911603c15f59fc55afb3279354a0605 |     
  mips64el   |          sdl2-2.0.14           | NOK | http://autobuild.buildroot.net/results/712f6745174e2d7fedbe27c31ba180fe8b217c2d |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/d8c6f9579f3e7fdeb8a953672961603f9d209540 |     


Classification of failures by reason for 2021.05.x
--------------------------------------------------

                  exiv2-0.27.4 | 1 
                host-odb-2.4.0 | 1 
        host-sentry-cli-1.57.0 | 1 
                  zeromq-4.3.4 | 1 


Detail of failures for 2021.05.x
--------------------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |          exiv2-0.27.4          | NOK | http://autobuild.buildroot.net/results/fa9a848db69db9ad9de4876797d25fdf1427deb3 |     
    i586     |         host-odb-2.4.0         | NOK | http://autobuild.buildroot.net/results/d38657c15b5946781d62de07970ccecb91a5e194 | ORPH
  mips64el   |     host-sentry-cli-1.57.0     | NOK | http://autobuild.buildroot.net/results/61a5f9468849be3f90a7567aabfc930ee02f5fa7 |     
    i686     |          zeromq-4.3.4          | NOK | http://autobuild.buildroot.net/results/15bc11cc63473a63007f19bfcc715494410a253e |     


Gitlab CI results for 2021-07-13
================================


-- 
http://autobuild.buildroot.net
