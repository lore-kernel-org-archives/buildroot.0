From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 07:18:06 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-01-11
Message-ID: <20200112071812.5943F85205@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-01-11
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 15  |  0  |  0  | 15  |
  2019.11.x  | 13  |  4  |  1  | 18  |
    master   | 92  | 73  |  2  | 167 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             freeswitch-1.10.2 | 12
             libva-utils-2.6.0 | 10
              host-grpc-1.25.0 | 5 
               libsigrok-0.5.2 | 4 
                apr-util-1.6.1 | 3 
                   libnss-3.49 | 3 
                libgdiplus-5.6 | 2 
             libopenssl-1.1.1d | 2 
                     lxc-3.2.1 | 2 
               protobuf-3.11.0 | 2 
                  snort-2.9.15 | 2 
toolchain-external-codesour... | 2 
                 augeas-1.12.0 | 1 
                bitcoin-0.16.3 | 1 
                  cc-tool-0.26 | 1 
domoticz-0f411f781ae4fb4a82... | 1 
                  gmpc-11.8.16 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
           host-doxygen-1.8.17 | 1 
                     host-llvm | 1 
               host-llvm-9.0.1 | 1 
         host-scons-legal-info | 1 
              jpeg-turbo-2.0.3 | 1 
        matchbox-desktop-0.9.1 | 1 
                   mimic-1.1.0 | 1 
                    mpv-0.29.1 | 1 
           oracle-mysql-5.1.73 | 1 
package/scons/scons.mk:18: ... | 1 
           python-bcrypt-3.1.7 | 1 
            python-cffi-1.13.1 | 1 
                   python-lxml | 1 
                qt5base-5.12.5 | 1 
                   tor-0.4.2.5 | 1 
                       unknown | 1 
                    xen-4.12.1 | 1 
zxing-cpp-e0e40ddec63f38405... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/50b87d98b51bb5f8e934f609c5c97a2a0c7d8286 |     
    arm      |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/594867a8794061de2f721fa5d7ffa5dbb2b2383a |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/196d9c91900151aedeb86080410ed3e6455b72d9 |     
    m68k     |         augeas-1.12.0          | NOK | http://autobuild.buildroot.net/results/3f7fdb35bfe81442bd4c5fe7bb05e37f9ddb7cb5 |     
    arc      |         bitcoin-0.16.3         | NOK | http://autobuild.buildroot.net/results/12894e98ae5c260e1860b28089c46cf2d2b9834a |     
    m68k     |          cc-tool-0.26          | NOK | http://autobuild.buildroot.net/results/f0d5d402b6c70b5d124a3ef7126a09835812d23d |     
   xtensa    | domoticz-0f411f781ae4fb4a82... | NOK | http://autobuild.buildroot.net/results/324646d667aa5f3cc14f825b4af7b9ce7acf8907 |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/230566c110931c2eb13b4751e2aee9526a46c234 |     
    arc      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/9c40a8b55bed9229c68a381e2054a70eeb230b12 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/154c187c61194407521399fb1aeafa8017daa00a |     
  mips64el   |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/8becfdb032fd6d589759743fe9a9f556dd21dde4 |     
    i686     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/795e5bbeeb7092ac54b0dacbee0be915081e9b95 |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/66ee3f54fae128d84795d28e025f5676113bb00b |     
    arm      |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/cd7f246d9f9da55f3a8a6a7d64d973c1b8a4e1b4 |     
  powerpc    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e67654c2a739dfd186586ee0beaeb2a5e4966fd4 |     
    m68k     |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/e5869e711e593a4a4c45acf6f2dbc166d3c8f304 |     
   xtensa    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/45912c156c14eed7b9c113d247fea277e848ed13 |     
  riscv32    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/13ee4f65f13be64ca1274a0fa67f9d61392e132f |     
   mipsel    |       freeswitch-1.10.2        | NOK | http://autobuild.buildroot.net/results/0661fdf467d59144d5feab272851ef12b92b853a |     
    arm      |          gmpc-11.8.16          | NOK | http://autobuild.buildroot.net/results/ab94f6b374a4ca3c3bde517033d5b47281d3232e | ORPH
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/7006db2cb08f905146c7e389fcd5640b3b1dbfa7 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/03d2156645b6139c7aa171ca17789402f04af23a |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/512515f296d12873bd2f3120a01a9688d23a565b |     
    or1k     |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/387434c6a03a059dd6af5b55b7f6df68c932394e |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/9c7ab7f4506e49036ee05363e58efb1dcdc6eac3 |     
  powerpc    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/fe110fb8cd5d2b7172e665bb24ac544469e8b8ea |     
  riscv64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c456e3ce83c0ddb3848ecf966e131e90482d1791 |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/97efba6e544f4e0cdbbd16ad04d2f0020dab6ba5 |     
    arc      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/aaaa0bb4f5b7f6fc4e44096f5781e4540a19cabf |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/2d37d88695f8405bfeb35f3210465f453a9ecb25 |     
   mipsel    |        host-llvm-9.0.1         | NOK | http://autobuild.buildroot.net/results/00b478a89c62b1676fa6d631a513515352b36f19 |     
  mips64el   |     host-scons-legal-info      | NOK | http://autobuild.buildroot.net/results/cd21e91fa4be3a81bb3d626cde1853a056efb7f3 |     
 aarch64_be  |        jpeg-turbo-2.0.3        | NOK | http://autobuild.buildroot.net/results/0157f91b66caa176f818352145da001bbbbd03a9 |     
  aarch64    |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/cae72b0b00fa5853b73a8b7343da7ff84ef79104 |     
    mips     |         libgdiplus-5.6         | NOK | http://autobuild.buildroot.net/results/484c4050c17c89b37f70dc1f7f2c66b81fdee7c2 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/00ab33779c9caf46d9cf5fa0759449af22a27dcc |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/d608f3055a0b3ff74155d091dd0c7066d2015931 |     
    arm      |          libnss-3.49           | NOK | http://autobuild.buildroot.net/results/8854c879b9dce907c42a36ef98df5b214c629811 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/2c2b8585225bc8e044e5d8addaf63100abd15ba0 |     
    m68k     |       libopenssl-1.1.1d        | NOK | http://autobuild.buildroot.net/results/e00bc0928d0a6b60da73daff636727404a3ba029 |     
   x86_64    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/a671f1253134779b352c75b59cb5c1380aba8f62 |     
microblazeel |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/1c57ba999e185ec3805e57a58b58e62f7a224fa1 |     
   xtensa    |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/942aa07547068c9b47ce50c6dc016ee633e1a1c8 |     
    m68k     |        libsigrok-0.5.2         | NOK | http://autobuild.buildroot.net/results/d5cd66bb2fb7be1d26f4d0cb30857340ba96a93d |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/50fd2e3ec5c40c9283a7a16aaae9fb52d5d1e5f8 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/dc48a6e1be3bbe5e802cfb2b146c7c3ba06cd149 |     
    mips     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/40fad522cae6b71f0e811d2de27efa0c8f85926a |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/9624449ea0a66d298d011d67af0e4f123fd5d031 |     
    arm      |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/791afe2a48e063aac7a379223dce63ed24b09c55 |     
 aarch64_be  |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/1a08269da04c4af8a43d53e9f0083761620bdb39 |     
   x86_64    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/52d83ae26a74a5b361935aa25bd043e684aa785f |     
   xtensa    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/73ed59d24d9b38fd1cec6a53d4519f3c9072f2a9 |     
    i586     |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/8f6166baa295e2764540a022da2f99e22fea9998 |     
  powerpc    |       libva-utils-2.6.0        | NOK | http://autobuild.buildroot.net/results/a7941244bca69e10e1586f1bbc5283b8455537f6 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/86b13b47cda8dc5314857d2f4cda2392f4eb6ee3 |     
  sparc64    |           lxc-3.2.1            | NOK | http://autobuild.buildroot.net/results/4f55a197e751875d2e8a5ff9e6b994015f1d9616 |     
  mips64el   |     matchbox-desktop-0.9.1     | NOK | http://autobuild.buildroot.net/results/7ca3e6c17d8ce5a53715d719ae9de2551ce2a669 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/cfcd0687f34a4ea455c365f7cdde021a941346f1 |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/78b7f845832e5dde891afcced2d67f2f90c600c0 |     
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/50b1d8bbe627fe8f93990d6d01429c60f071a2ee | ORPH
   x86_64    | package/scons/scons.mk:18: ... | NOK | http://autobuild.buildroot.net/results/43547a6015cbd0db7a9e8e7bbe7c60029db20511 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/ce80e9f72a4a1529a422d1a6f240763a240b0e92 |     
    or1k     |        protobuf-3.11.0         | NOK | http://autobuild.buildroot.net/results/725eb5ec680a46ffbd54a19207bb6693188995f9 |     
    i686     |      python-bcrypt-3.1.7       | NOK | http://autobuild.buildroot.net/results/870427cbf4f901851ddc502ed9de6aa2d63a2eff |     
  riscv64    |       python-cffi-1.13.1       | NOK | http://autobuild.buildroot.net/results/2b9ae6d7044e8b98d9823a306abd510ebcd4f83a |     
    m68k     |          python-lxml           | TIM | http://autobuild.buildroot.net/results/dd7d195f2466c9143b27e69705de22dc57dfcd8c |     
   x86_64    |         qt5base-5.12.5         | NOK | http://autobuild.buildroot.net/results/d77c41d8edf84552c1f1d1d955024c042bf8de9d |     
  riscv64    |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/5a748e1af699aab602192630cf1ad9c55a56a3a0 |     
powerpc64le  |          snort-2.9.15          | NOK | http://autobuild.buildroot.net/results/15e8c5be79dfc5f3132bf57b6de052256719bd30 |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/318b586cab49476308c6aaf82a8b05be3862a10f | ORPH
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/63e4e6c3c098461d4ec6a4d1c402321293258b98 | ORPH
   x86_64    |          tor-0.4.2.5           | NOK | http://autobuild.buildroot.net/results/be39727bd6c2919b8b29f0c5188632b3b103b95f |     
    arc      |            unknown             | NOK | http://autobuild.buildroot.net/results/c4e4e98bd912933158f933ff16ba5addf767e5dc |     
    arm      |           xen-4.12.1           | NOK | http://autobuild.buildroot.net/results/a0cb0a81bc2482724358725935f417c715486598 |     
    arc      | zxing-cpp-e0e40ddec63f38405... | NOK | http://autobuild.buildroot.net/results/52dd7cd2858ed5eb6bf4cd9fcef0ff834d49d777 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                   grpc-1.23.0 | 1 
              host-grpc-1.23.0 | 1 
                     host-llvm | 1 
                 mesa3d-19.2.6 | 1 
       python-matplotlib-3.0.3 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          grpc-1.23.0           | NOK | http://autobuild.buildroot.net/results/3d5e0b2b8c6670cf9a43ceac4b8173760e1f933c |     
    sh4      |        host-grpc-1.23.0        | NOK | http://autobuild.buildroot.net/results/85cf80234ff7a5202b129acd4551931ec3101fa3 |     
    arm      |           host-llvm            | TIM | http://autobuild.buildroot.net/results/9bb69c22069a1c1641f6370562b785724fa01b0f |     
    sh4      |         mesa3d-19.2.6          | NOK | http://autobuild.buildroot.net/results/c919d56c1f851b509a424cc2203cb0c247fa0582 |     
    arm      |    python-matplotlib-3.0.3     | NOK | http://autobuild.buildroot.net/results/efd0c1b483c2e76c837987b4603564398f9a5264 |     



-- 
http://autobuild.buildroot.net
