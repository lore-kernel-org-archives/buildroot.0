From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 24 Jun 2018 08:00:20 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-23
Message-ID: <20180624060020.55B692079C@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   1 |   0 |  22 |
   2018.05.x |  23 |   0 |   0 |  23 |
      master | 109 | 102 |   0 | 211 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5dd6687874c8b8bec1be1596564d2dda7b01f5af |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

        host-protobuf-c-v1.3.0 | 27
               iproute2-4.17.0 | 26
                   cmake-3.8.2 | 14
           host-protobuf-3.6.0 | 7 
                    host-rustc | 4 
                    mosh-1.3.2 | 4 
              host-erlang-21.0 | 3 
package/qt5/qt5base/qt5base... | 3 
                 gnutls-3.5.18 | 2 
                   erlang-21.0 | 1 
                libmpeg2-0.5.1 | 1 
                  mender-1.4.0 | 1 
               mono-5.12.0.226 | 1 
                 opencv3-3.3.0 | 1 
              python-pyqt5-5.7 | 1 
            qt5base-legal-info | 1 
                  samba4-4.8.2 | 1 
                 socat-1.7.3.2 | 1 
           uboot-tools-2018.05 | 1 
                 wiringpi-2.46 | 1 
                      x265-2.8 | 1 


Detail of failures
------------------

    mips64el |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/4ed8cb6a56082f6bca7cd855a5711105793185f8 |     
     powerpc |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/3fac7bfe53bfaa2ffed78bd9d195afae8dbcbbfa |     
        mips |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/1e922b47f2536eeb3e9ecefb855b3b45e76d4ea0 |     
      x86_64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/60f77ef2891dd1b2f63546fae50e6332540d17c1 |     
    mips64el |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/af9849390fe7e57324ce117671c84486bf90c979 |     
      x86_64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/68ef6bf64071ce962dea3cd5daf35868dc0cdf3f |     
    mips64el |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/3b457cfcb65d859c0b8266e68aea9d49a815607f |     
         arm |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/887d53000db41c7fc1052cd09b6f3f2682eedcdf |     
         arm |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/4227d319d9c1e3bcaaa72910afe633b7bf92cac3 |     
      x86_64 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/a769ee89f7b778c7f043ffa5c3a0911f58d70bdc |     
      mipsel |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/5b413ea9c571d0514848eca55d816f69d31660c1 |     
     powerpc |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/280bb7555777587128a391f16bd8d3f3aa276275 |     
        mips |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/5c7802d0f49db57142778560ad0b07f34f3df82c |     
        i586 |                    cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/86d67e5d30f7e3ba9a4932c06640a7924202d3f9 |     
         arm |                    erlang-21.0 | NOK | http://autobuild.buildroot.net/results/008b7af68bbaa33fa615a0f95c67d56453911b9d |     
microblazeel |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/e5b8d8dd7ce27dfdc03f5caee9c37e7b17461c93 |     
microblazeel |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/1c353f542c49bbe5520266c0ebb6a58589032453 |     
         arm |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/f013dab3199bb80418a8ba3f6495ab779bcb5105 |     
         arm |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/f4774530daaed728d3466cf70061c04e297bbb35 |     
     powerpc |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/484a54b005764958073674bf07f6a760bfedb071 |     
         arm |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/a1d01a88e8a0e61126c045e6393af4b018fe6575 |     
     sparc64 |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/271aaea3382aa951e77fb752a407ee4b438ba344 |     
    mips64el |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/05a519b36d61b241bae02428294a6e66ab2dca5e |     
    mips64el |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/c30014cd9757afa1a290d4de8719e76bfbe1da00 |     
      xtensa |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/7c0ed21b6cfac9e1f4a3a1098286122c0460b480 |     
    mips64el |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/bb299008423edf4c65ade6c159e33c4216428bf1 |     
    mips64el |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/013fbdea5b7a3a566b43a5931bdebc130ea4a522 |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/a0cc2b81376367cc6d41577595daf55d47de7a6c |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/546bef11abe4976f50e5c124687ea160b9a63c35 |     
       nios2 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/101dbe0efcc64ae058db1070dd437c97c030cb23 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/e9cc4c22b0b95cfc7ece03cd89ff30e3f735ae77 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/d2a7025929edfca4b62f2f12984d47988bf8329f |     
        i586 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8ef914ca88bcae81cdbf01dac38d4f236433f55a |     
       nios2 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/b24a06ca66a5704584442b1cacd0fe78edbd83f5 |     
    mips64el |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8727d6b1cba7812cb7a3a7812ff6eb1ce658e56a |     
        or1k |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/def6bc2565a64317d67d1dfea7da6e0fa4051e33 |     
      xtensa |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/fe20b8174c308d7a42c1a01a2edf94be3ca4418a |     
    mips64el |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/badc507fceb97aaefdb44b082de146a6d03f8065 |     
        or1k |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/c8cd9c6a3d7a37fceae993f777f30ac20dba71c6 |     
       sparc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/b89321fa8c5369433487572838f5ea68b946e898 |     
     sparc64 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/368d63fe61615204c7607f1c7386931d350afa56 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/f37331ce701f93547eab0bc272e23d7898301c3d |     
     sparc64 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/30c368878d06b1b980181dc74d3e2b849631681b |     
        m68k |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/6910686719f38557fb5e9201c2d7bce13fb137ea |     
        i686 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/36b06fd07b9d6bf605ca2661171be3985d95ec18 |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/cb610cbc7f80d108ba0deb006d0d0583da342e9f |     
    mips64el |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/c119c5a62a77ccb4b13d4c5fa355b0864410d532 |     
     powerpc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/26b84f2614f75ac101078a59afeb63bc4c0d28b7 |     
        i586 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/d4e99482ef93f0a424319d1f09e9b529fa82c6e6 |     
         arm |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/2ab1e3e7080a28e73da679edc9c8faf2734c38ec |     
      xtensa |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/24254de175745b0ffefe28eb3bd2e286f1b9a208 |     
         arc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/614367518e39be94ea025b3e36ebfe60fba92e31 |     
     powerpc |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/0fe1218b321200b3a1e26a63d59970ef3148d6f7 |     
         sh4 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/4dbcbcd0ec560ce74f4413c529b6dc878693426d |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c0e1ebb8d897e5d8b2137cd2428e9a5fd785b77e |     
     powerpc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/2aefd1477726b5469dc71e00b29c4349647f9c4c |     
         arm |                     host-rustc | NOK | http://autobuild.buildroot.net/results/c7305245dc18ea53ea08319fa32907d328b726ff |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/4122c8add170b30cc6e9f237dfb8153eb7baac1d |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/28b04f0a4c8e8846047eba34a0bb8d5c7c98b5f3 |     
      xtensa |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/0e4854b42f32ecfc3a66bddd564e7fcf11212757 |     
        m68k |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/7d1f2018829d2bfe37771cb8e68595fed561695c |     
         arc |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/95cdd1780ef398d65695c6a3bda49ba704642975 |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/fb827ca281ec60d3662aa6e08c887234ee6027d6 |     
    mips64el |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/beb3a09e9da1aca6c81c116b65b433b07dd1f358 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/146670cb7a0ab4b4e5c3f0f15b015bbc7f62a153 |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/ce2e5ee0822bae8130b7f68534978919e196e743 |     
      xtensa |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/34b526f6cd8001d4e48a1481af1da001a2213bdc |     
      x86_64 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/117c37c4196003ac5b8c6fa992aaedd744ebdf37 |     
     powerpc |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/c043d4282ed04b001df4266d06fcf69a1c628949 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/85374a8fb52746460065135ac2d06dcff103104d |     
    mips64el |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/2e595d361c264bd3b592ba13e0a9f7f20d9284b1 |     
        i686 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/7ba9d7de64378c20839ef09e31a876a00e41a774 |     
         sh4 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/e8d857bd30f84c603f874b3f7759e5695d2438c5 |     
        i686 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/fe9c330658ba072d75fd6ac5998843542ddc1aec |     
        mips |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/9bc4d0471140e55476c46b51e824e254b9c0fdb9 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/2862f0a025023f042fef9abdc2ac983ab2745bd6 |     
    mips64el |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/dc7b0910d9232bc882348e38883c379a1918fadd |     
         arc |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/63229f485f58be32238916cd997cbe92ac3ca953 |     
       sparc |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/2e9b7f7ce930ad00a8b425c59087afecabe0e09f |     
        mips |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/5a29467ffa4848fd54227b9fbcd51ef1019cd2c7 |     
     powerpc |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/8197961e676cbd883743eb1fe50a754baff4fc18 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/d3b790e1cbc89795adcccf2f33573f120b16b3b3 |     
      mipsel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/1a81193035c56ed3dd94197941132151d0ac504b |     
        m68k |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/b1ce83b546ac8989c33af09984dc56fc0f79b5ef |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/06e09128ee9eecc618987e996d2a442ecdec84e3 | ORPH
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/6d866ef69045ce07495ae9d3ee8a7ef415902b8a |     
        mips |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/c5cc39f9b7376ad8e239b8017545201bc51a8c39 |     
        or1k |                     mosh-1.3.2 | NOK | http://autobuild.buildroot.net/results/e5c03bae0c2b22b8c09833a499d64d5a328da016 |     
    mips64el |                     mosh-1.3.2 | NOK | http://autobuild.buildroot.net/results/c2ee5e4886ac0ffd885ca49385a0299eaf4a2c65 |     
        or1k |                     mosh-1.3.2 | NOK | http://autobuild.buildroot.net/results/502415f642b276862eeab9e5860bf6d35d65bffd |     
        mips |                     mosh-1.3.2 | NOK | http://autobuild.buildroot.net/results/6e4550e080a9d558b441dcc735b6be14f39fb03f |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/79308446e0ed115e4b89d46847407fe924120f17 |     
   powerpc64 | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/055c4cb0026848d81a17d63a952fc11495570abb |     
      x86_64 | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/fd45f5a85d3d154181207543e1dd78eaf5b8f272 |     
    mips64el | package/qt5/qt5base/qt5base... | NOK | http://autobuild.buildroot.net/results/962888e2d5c73b860a9cae02ec511d4e938485a1 |     
         arm |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/ddceb7f48e10bc6a49c942ddd457957ab2ab52c1 |     
    mips64el |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/fb012783ca291cc7c1829fca1058c07bb54ff7fb |     
    mips64el |                   samba4-4.8.2 | NOK | http://autobuild.buildroot.net/results/5cb8399027611dce42a08f06863ffbafb3348e31 |     
       nios2 |                  socat-1.7.3.2 | NOK | http://autobuild.buildroot.net/results/306b4edcc32246a98ff8334984d0d4a4efeb8e5f |     
         arm |            uboot-tools-2018.05 | NOK | http://autobuild.buildroot.net/results/d098eeb28c5d69fe373b3ca24ae72ea5f9b15c71 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/a1ca953247475a5f31fe9283ade05c9cba26853b |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/79e6d02265c3d94d76571acee58617ebe4937520 |     


-- 
http://autobuild.buildroot.net
