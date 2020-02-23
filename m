From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Feb 2020 09:23:44 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-22
Message-ID: <20200223092349.E347086F8D@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-22
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  |  8  |  1  |  0  |  9  |
  2019.11.x  | 10  |  3  |  0  | 13  |
    master   | 81  | 36  |  0  | 117 |
     next    | 22  | 19  |  0  | 41  |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 mesa3d-19.3.4 | 4 
               libglib2-2.62.4 | 3 
                       unknown | 3 
                      bash-5.0 | 2 
                    mpv-0.29.1 | 2 
                 opencv3-3.4.9 | 2 
                    brltty-6.0 | 1 
               fail2ban-0.11.1 | 1 
               host-llvm-9.0.1 | 1 
              jpeg-turbo-2.0.4 | 1 
                libgdiplus-5.6 | 1 
             libopenssl-1.1.1d | 1 
                  luv-1.34.1-1 | 1 
make: *** wait: No child pr... | 1 
                   mimic-1.1.0 | 1 
                  monkey-1.6.9 | 1 
                oprofile-1.3.0 | 1 
                      pdbg-2.4 | 1 
                qt5base-5.12.7 | 1 
              qt5enginio-1.6.3 | 1 
             qt5location-5.6.3 | 1 
                 rocksdb-6.6.4 | 1 
              spandsp-20180108 | 1 
                      tio-1.32 | 1 
                    wampcc-1.6 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/85e4a5548f0d90c00c8e917b5e4c5a81b7365284 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/cb58044a6eb223be84af0bcb88aa783beeaeb9d7 | ORPH
    i686     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b26c65a0c7e1ab6921254cce2d81cf0a6df94072 |     
    arm      |        fail2ban-0.11.1         | NOK | http://autobuild.buildroot.net/results/1337f7b3cf4899f2a10341579ccfa41da09949a2 |     
  riscv32    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/af5a72c9a880d0c5851cf59caeecbb6eacc73dc1 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/e1f164cee16b037c0232fdda40fc16caf8f0c0af |     
 aarch64_be  |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/db096068ded97d24b08b6d19506dc82260ad8c6e |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/878ffcd032ae6c1f6f4521d332ae484468b26714 |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/17d3c146b4a53f49177c9578fc36960b7c0339cd |     
    arc      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/65c9a6e07ca74db9a468a710cb6c23900f9d59d5 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/9cb9113c5dd760e2e4d392ee3f2bae18bf44b3bc |     
    arm      |          luv-1.34.1-1          | NOK | http://autobuild.buildroot.net/results/83b34e606b128546da8a70836d039090e334a1ec |     
   sparc     | make: *** wait: No child pr... | NOK | http://autobuild.buildroot.net/results/59dd2f44225b75bf1121bbe78db81eba8933562e |     
    or1k     |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/45a9d34ed01d8039e3bb9f545673241313deca7d |     
  aarch64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/90094d1af743b61800291b34a5f39de101ba181f |     
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/62752c1f86b4f95a5d0bdc162f35e0ef2670854e |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/c883db69cd71149b7c495cd894d773f4ea9e657f |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/d937ae6564a5371aa3364eb6a81681dfb84da958 |     
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/9786b9d3b5c5e0d3fe3d82506d30d31e9ccc5308 | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/72f5e40b3de3cc668ff7e1bbf97c473687e92f3f |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/049afe68580f2bf73a0d3f4ecf6ac49036dc06c7 |     
  mips64el   |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/3445de0569bdec0c3e5c50e59a5671d971da1746 |     
 aarch64_be  |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/4c01cb5ff352eedf11edcf0d8bfd4e2517775ed6 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/da010e3d9ea097991dbfddbb71f80ad7ec734d83 |     
    m68k     |            pdbg-2.4            | NOK | http://autobuild.buildroot.net/results/9eaaa7beb73a32acb772c2c7cb0b802753627f62 |     
   x86_64    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/686dc7397d1acc0ee8a96ce31053d44f10db367f |     
  riscv64    |        qt5enginio-1.6.3        | NOK | http://autobuild.buildroot.net/results/c00ef80bc2996ab286bd7fcabc37dea3ad877386 |     
   nios2     |       qt5location-5.6.3        | NOK | http://autobuild.buildroot.net/results/4f3c5fd78ce0c72f84a83f29667a5e7509ff7c2e |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/c4bdf256af41a2cf9885161dca7e066cb026bc76 |     
    i686     |        spandsp-20180108        | NOK | http://autobuild.buildroot.net/results/310c1b32c638b318a71dde67739114b670decb16 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/cc3b4d7cedc76982cda485311901edd6e5425c56 |     
  mips64el   |            unknown             | NOK | http://autobuild.buildroot.net/results/d513efd16b48163230743584107edbe9b928bace |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/19ccbb7b9a5b310f0643afc0978589c79668d1ef |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/b1e5d111389bcd692c9c9943b366e34f0548d6cb |     
    arc      |           wampcc-1.6           | NOK | http://autobuild.buildroot.net/results/89ab3dd3b3dbdb50623e083331f90a593148ab92 | ORPH
    m68k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/95bbefc65bd495e09cec2d85392569bb263da83f |     


Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                    brltty-6.0 | 3 
                      bash-5.0 | 2 
                   erlang-22.2 | 2 
host-sdbusplus-4212292bcf13... | 2 
               asterisk-16.6.2 | 1 
                  gensio-1.5.2 | 1 
              host-grpc-1.25.0 | 1 
           host-nodejs-12.16.0 | 1 
                linphone-3.6.1 | 1 
                 mesa3d-19.3.4 | 1 
                oprofile-1.3.0 | 1 
                  pango-1.44.6 | 1 
toolchain-external-codesour... | 1 
               wireshark-3.2.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   x86_64    |        asterisk-16.6.2         | NOK | http://autobuild.buildroot.net/results/8b9710af10b460d1e46f2e2f87d980fa9247f022 |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/2ae2eca969e6d1febcacb8b0423ced3aad7505a2 | ORPH
  powerpc    |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/6fd46ca242bccb52c4bee7df4ecd75185fa3e290 | ORPH
    sh4      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f078c5d4570e3852812944395b833a3e2b526c13 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/c30ed8a846e0d45c23b0a6af62c6eefb90e1aa57 |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/41731140fb33975d84b58f8c3cba9f2c8a07dce2 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8a7c1686b808f291b4e67c6b0f151a58009a1a69 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/8a9e1c06f2e4b670fd42da0b8627e2ba2f3740bc |     
  riscv64    |          gensio-1.5.2          | NOK | http://autobuild.buildroot.net/results/cfc49a503210c971299aa5db824b14b660d68375 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/37e6482776b94d4e4c4b7e55d5ee8040190b65f7 |     
  aarch64    |      host-nodejs-12.16.0       | NOK | http://autobuild.buildroot.net/results/85f9829333b00892d0d99aa6a2d79607fe1f673b |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/d769c7fed0cf25bd19914ebb6aeab08853a295a3 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/187e0d9fa4697af8101dfcdf554ad52d2a473274 |     
    mips     |         linphone-3.6.1         | NOK | http://autobuild.buildroot.net/results/a5d2311b6113b6ce88bbb04a1efd8e7b3cdf7ee5 | ORPH
   x86_64    |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/7cfd43b3b47a2d9075e177f66b20bfa316d13f1e |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/4eae9ba4dd0a9d2eb0d0399538b801952e5434f4 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/7f2d9bf73756720ba985f0f4bfe6c2b6d4c798cb | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/0099294280464903af6245a01c2b9f6ab13a2e9e | ORPH
  powerpc    |        wireshark-3.2.1         | NOK | http://autobuild.buildroot.net/results/4b5875956425a7aececf7b93fdeb5ef60d390389 | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

           host-libselinux-2.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   mipsel    |      host-libselinux-2.8       | NOK | http://autobuild.buildroot.net/results/fa689fbaa528f8e6c61258130f58b1ef4fd80374 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                oprofile-1.3.0 | 2 
               libupnpp-0.17.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/63029596331402eda145f3f4c3aafb878d298c31 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/365454fc7317c0815838c61742e70dab147cab26 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/ad0791a040027cef36d620ada7932f9f5f2fc8b0 |     



-- 
http://autobuild.buildroot.net
