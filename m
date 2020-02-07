From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Feb 2020 07:28:36 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-06
Message-ID: <20200207072841.EC07F87D33@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-06
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  1  |  0  | 16  |
  2019.11.x  | 18  |  5  |  0  | 23  |
    master   | 67  | 93  |  0  | 160 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              sdl_mixer-1.2.12 | 17
                    brltty-6.0 | 8 
                   erlang-22.2 | 6 
               libglib2-2.62.4 | 4 
                    parted-3.3 | 4 
host-sdbusplus-4212292bcf13... | 3 
                 mesa3d-19.3.3 | 3 
                   mimic-1.1.0 | 3 
                      bash-5.0 | 2 
              gnuradio-3.8.0.0 | 2 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.14.1 | 2 
             host-pango-1.44.6 | 2 
                 opencv3-3.4.9 | 2 
               php-geoip-1.1.1 | 2 
                 ripgrep-0.8.1 | 2 
                 rocksdb-6.6.4 | 2 
                apr-util-1.6.1 | 1 
              bitcoin-0.19.0.1 | 1 
                  cc-tool-0.26 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
            gst-ffmpeg-0.10.13 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-doxygen-1.8.17 | 1 
               host-llvm-9.0.1 | 1 
            host-mfgtools-0.02 | 1 
             libopenssl-1.1.1d | 1 
           libsamplerate-0.1.9 | 1 
               libsigsegv-2.12 | 1 
libsvgtiny-ea9d99fc8b231c22... | 1 
                    mpv-0.29.1 | 1 
                  ndisc6-1.0.4 | 1 
                   nload-0.7.4 | 1 
                oprofile-1.3.0 | 1 
                  pango-1.44.6 | 1 
                php-ssh2-1.1.2 | 1 
                 php-zmq-1.1.3 | 1 
             python-lxml-4.4.1 | 1 
       python-matplotlib-3.0.3 | 1 
                qt5base-5.12.7 | 1 
sdbusplus-4212292bcf136d04b... | 1 
                   sdl2-2.0.10 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  riscv32    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/9ce5049938d229ee43108745f6e78e63d0b90ba6 |     
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/c7ac9c265d25261c0089eb9e2ed347e462ab2d04 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/d2860798afc1527356ffd127ea46f8986e068165 | ORPH
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/019a21399beda15a059136b23eb770382c1a7281 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/3d8e8c385e96ddee9aee9fc4acf95475d5038103 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d9bb60b9666febd2c8182c75dfd49cfd95c3b767 |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/9cf780890ceb8509aae19a01b0e18a9c8df81a01 |     
   mipsel    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/b58db439e7918efc28e95f6f94fa5a351fe400e3 |     
    or1k     |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/e06f4f0492126f6d6a0e05d38b4acdf465f6ab33 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/389056fb62b11314d53a6e7c0dcd0653447adfef |     
  mips64el   |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/d6ab5815cbc47cbf88bdb45109dde253f35cb095 |     
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/86641bf9d150c5f10e7efb51bbdd6632ceb3a072 |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/4aecfaa4bae38d48ab3ace1dd5b1b9d6158dd93b |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/342e3e588c94b923c36dd3c945efa88bc5f9f2e4 |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e382c2493179ab454b8a5118d5a04bc3dbaf7887 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/4d7d775f6e793da5ed7246cc0dc57bbc1e101083 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/fccb4ec83fb19df1ea186e3fe1a76dd3e5d58aaf |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a9b861058640f0d311b6fa6afc54f610769c770c |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/94a51b4fba8151de64fbd9e2e90b6b41a9aa6b9a |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/7ef3c6e36335a7644afdb77f5bf907bad1203767 |     
   mipsel    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/14015f499e58fee530877ac052878bbe2f799942 |     
   xtensa    |        gnuradio-3.8.0.0        | NOK | http://autobuild.buildroot.net/results/53239f98dd5e03d4dc1bb4eb91ed765f77dbf0ec |     
 aarch64_be  |       gst-ffmpeg-0.10.13       | NOK | http://autobuild.buildroot.net/results/cf2d254bb103b9540b93a671c64b7571c9489a41 | ORPH
   x86_64    |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/f485e91ce80bbde00031101f0d0e04fd1c5a6603 |     
   nios2     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/31b432fa4c5e5acf3531c6f08ce65216bb8f059c |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/668c1182a2bf524fcbf95b36d53b6ada399a61d1 |     
   x86_64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6039e0cf3878a5e96d3bcd728fae4c1bdfb0c67e |     
  mips64el   |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/df190991d2a8cfe37fc56684dbe08fefb7fbe2f0 |     
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/4dd1ce2bacdf4e553fc73f3384e728df36646d11 |     
   mipsel    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/98b27ff25cf4056b61bf74b7e0f5bf61d10e1b57 |     
   x86_64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/e13e1f9a5b6c1debd9a22a2774534e43e7f07ae3 |     
    arm      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/1700878281e51cbb9d160d1975e563f6b29c3628 | ORPH
    sh4      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/df1e16114486e190d36c63bba7610dd4eff9c9fd | ORPH
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/7e984fdd773f165a960f30699e9c71109085f2b4 |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/74530f8bebfa01800a3b828f97c483a2b4ce3f2d |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/fc33b67f2730e4b3f7292ac3436d80a1dfac593f |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/80bd8e23b35ca84160b4eeaaeb00aa1969b4ce39 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/abf0953de82beb31c111c233e5f4bf874d9d3c44 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/ecf5fc6483296ff0ffb4edae97fe1cd3fc35b0ea |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/1431c0f3f2dc7d65a1f2339c3dd6ec563c5c28e4 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/3926b9da090358e294e0269457a1bb0a687d2cc4 |     
    m68k     |      libsamplerate-0.1.9       | NOK | http://autobuild.buildroot.net/results/e788a49b3df2ebae08923087a4cf2fd3485e1b5f | ORPH
  riscv64    |        libsigsegv-2.12         | NOK | http://autobuild.buildroot.net/results/2a3826119905a5d72b43b48b28b887b6989e9549 |     
   x86_64    | libsvgtiny-ea9d99fc8b231c22... | NOK | http://autobuild.buildroot.net/results/96cb855e0532262393ebd486bf560e2b82bd5380 | ORPH
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/3edfa13f5af92400bfadcdd41905fff2111d5f44 |     
    arc      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/66a908cefac91bc1d18d3a35dd6578078ab60538 |     
    arc      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/87fea36b2c3540f49fc4052ad159aac10aa66c22 |     
    m68k     |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/31a87b8538ebfa47d839fd1d389a5a59ba69f4a3 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/26464e2aee87809ee76b7272c2c209e191144964 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/e07690ab58cf2ca2d076320860f21edbce6f6990 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/c6ab2b45748ea73d3d89b63cf16d2b5d0620b1d5 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/ebd824c04b1cae786faeda79698288893e51f99f | ORPH
    m68k     |          nload-0.7.4           | NOK | http://autobuild.buildroot.net/results/096fd1c13fcfe801199741796e9b2a592932e534 | ORPH
  aarch64    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/c4acee0cc9c83dcce33bcdc19f4030a8dbbe8fab |     
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/ec397589fb35d00c6f9451f9446260c87847b7ca |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/e1c5944e73af452e8aa11f2e2adee456fcf84876 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/ac6ea1e69571bf56079b5854ad1e9307335c4ba9 | ORPH
   sparc     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/bb09735379ac59d3034f942ea7f2de33d31808c9 |     
   mipsel    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/2c7201fec7d3e52fc8ae749047d218c0f15e185e |     
    m68k     |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/838aa8e864d542cfc262b717a228deffe3682d5b |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/479d9829cb4fba4a01939264b412824dac5e1d31 |     
   nios2     |        php-geoip-1.1.1         | NOK | http://autobuild.buildroot.net/results/664fb755ca754441981f96d18961e246abdee009 | ORPH
 powerpc64   |        php-geoip-1.1.1         | NOK | http://autobuild.buildroot.net/results/ef76b43be1e31ddfea6dd9ba4dba3fbdbc439137 | ORPH
    arm      |         php-ssh2-1.1.2         | NOK | http://autobuild.buildroot.net/results/33f9136c9890a5a196545665312651a84874028e | ORPH
  riscv32    |         php-zmq-1.1.3          | NOK | http://autobuild.buildroot.net/results/578cdc65e7e86b52dfd2693c93c12f5f965da980 | ORPH
   mipsel    |       python-lxml-4.4.1        | NOK | http://autobuild.buildroot.net/results/79bc070f98d6d9d8ef78df12b248cdc7d0e405c3 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/2eb872b9cc76fe4f7d422cfb9331aa999bf0093d |     
 aarch64_be  |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/3ae862c96107ff5b34abb2606db988327f44c33e |     
    mips     |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/b5f63d3ebd3d36bb2fd784ebe60bbe428f89b215 |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/0d1448c026ff48242e8f6c7d89ce3c6f4075c231 |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b43076903a8e2c11454e7d5cdd2d792cab1e096a |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/824f59efb0729ada8a37071214425a17b443a1c9 |     
  riscv64    | sdbusplus-4212292bcf136d04b... | NOK | http://autobuild.buildroot.net/results/9d84c817c1331b297b2fd2a593045cd32da3819b |     
  powerpc    |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/7a572b7143e0ddcdd490e63e08d3f91b2d53f139 |     
    arc      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/000962969278783dbe52ca9e507950280399220a | ORPH
  riscv32    |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/65d700384ab737475cb02a1f8817eaa4f8734e99 | ORPH
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/31e924190448aa96152c24dfafaa737930da6a31 | ORPH
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/4a1dc42ad8965a7f26df67d8df01fcaf3840efd5 | ORPH
    i586     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/9fd6ce9e41d35305157c7d2315de38ed89d13329 | ORPH
microblazeel |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/94dc3bcdb08f6db871a29248be43514176eb5a59 | ORPH
  aarch64    |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/63ae0bddb3c4436efe967c318e299047f496c5a5 | ORPH
   x86_64    |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/6c7cbc2b3a525631164c304683f4f77fedc39438 | ORPH
   nios2     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/4c614f0a5d1982b7f0ad9966f0aa6cdb1ec82036 | ORPH
    mips     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/df18cbbb9c63576a3052d7a63ac42e84f3a98491 | ORPH
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/b00385e67e8781ba9f055b14c45fb773ab880d95 | ORPH
    i586     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/5e971c4e9269a073ca8ab8af10f6dccf45fc066b | ORPH
  mips64el   |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/b802914b8101144d3e7f492f7128b3c1ed1af690 | ORPH
    arm      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/291c50ef0f7230c9d01127300b8805fb5928b69d | ORPH
    mips     |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/37872fc6985c14c0458dd52daa49e1166af15741 | ORPH
    sh4      |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/962d27cbda6f7833af06c2348a9fb6b15eacc5df | ORPH
  mips64el   |        sdl_mixer-1.2.12        | NOK | http://autobuild.buildroot.net/results/a6797bc079a627e140c9c5eaad98b6d7493611dc | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/24378a22565684e98910db41eef71d63d09ad21b |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/b1507064461e180fb5b5fc650033503e216cb90c | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

              webkitgtk-2.26.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |        webkitgtk-2.26.2        | NOK | http://autobuild.buildroot.net/results/634087c9aee94032adc4deb9cb21a422cdf2e361 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

           libwebsockets-3.2.0 | 1 
               log4cplus-2.0.4 | 1 
                    mpv-0.29.1 | 1 
                qt5base-5.12.5 | 1 
                 xvisor-0.2.11 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/3ad88161ae3f09aaaa85f0a1b63d2953faf538ae |     
    arc      |        log4cplus-2.0.4         | NOK | http://autobuild.buildroot.net/results/b6c57c73d24482e077df50e4c2dcc0a4b436492a |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/9ecdf10cc44a6a1b9a4160b849a2a35ab24839c0 |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/4fd7cd6712cbfa5ca42a3ff1e8bfe86b2f25822b |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3a2748a190280aa1ced6f9613975ce2bc722fcfb |     



-- 
http://autobuild.buildroot.net
