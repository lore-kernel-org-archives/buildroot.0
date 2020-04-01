From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 01 Apr 2020 06:26:03 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-03-31
Message-ID: <20200401062609.7FFAA89DCB@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-03-31
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 10  |  2  |  1  | 13  |
  2019.11.x  | 15  |  4  |  0  | 19  |
  2020.02.x  |  7  |  9  |  0  | 16  |
    master   | 77  | 54  |  2  | 133 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

psplash-fd33a9b3d68c89fa22f... | 7 
                   cegui-0-8-7 | 5 
               libglib2-2.64.1 | 5 
                libtirpc-1.2.5 | 5 
                   gupnp-1.2.2 | 3 
                 libuwsc-3.3.2 | 3 
                       unknown | 3 
                     vlc-3.0.8 | 3 
                     host-llvm | 2 
           host-nodejs-12.16.1 | 2 
               libupnpp-0.17.2 | 2 
         python-markdown-3.2.1 | 2 
               belle-sip-4.3.1 | 1 
                    brltty-6.0 | 1 
            gupnp-tools-0.8.15 | 1 
              host-grpc-1.25.0 | 1 
                 jbig2dec-0.16 | 1 
                   libnss-3.51 | 1 
              libostree-2020.3 | 1 
                   mpd-0.21.20 | 1 
                  pango-1.44.6 | 1 
piglit-ef761094be04d14e258a... | 1 
               protobuf-3.11.4 | 1 
          qt5multimedia-5.12.7 | 1 
                sysstat-12.2.1 | 1 
               wireshark-3.2.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   nios2     |        belle-sip-4.3.1         | NOK | http://autobuild.buildroot.net/results/cb15ec71a9b55bdb193c786b0f19aa6ac310160b |     
    arm      |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/f543cf3821e4686257819e3e8b28724da6415f3e |     
    arc      |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/ea04be78b31b3409801597fc0ebe04627742c0c8 |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/7de3a07c304e3939ec9fd164328d004a5a9bba6d |     
  powerpc    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/46c7aa679fb458067660aef803a359275a8e9958 |     
powerpc64le  |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/472b4e8438c9100e06e401296f0417a463e5fcf1 |     
    i686     |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/acac736fa0137c0f018e660c390eee9c848e6113 |     
  aarch64    |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/e8538d190336069f489ae930d4e21a60165e5b1c |     
    arm      |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/80461dd318c2f4b85c29a985c4fea061411fc5f8 |     
  riscv32    |          gupnp-1.2.2           | NOK | http://autobuild.buildroot.net/results/a75e007330cde430ec4d617057b3186a0d89c318 |     
  riscv32    |       gupnp-tools-0.8.15       | NOK | http://autobuild.buildroot.net/results/ccb93a645d939112537efa5e977a00ac419bb4d6 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/8970f5c003145de2d04d75cd579235c837d7fcef |     
    i586     |           host-llvm            | TIM | http://autobuild.buildroot.net/results/e7da8539a3328fb4e435f734979dd820f043225e |     
   x86_64    |           host-llvm            | TIM | http://autobuild.buildroot.net/results/247d760342b2f1496dc703dcaa9bbc22a275d3f5 |     
    i586     |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/28e1d73edceb896696689e48b7e415de12480931 |     
  aarch64    |      host-nodejs-12.16.1       | NOK | http://autobuild.buildroot.net/results/a581e06110407dfe67bef1c119eafb57b644e2e2 |     
    arm      |         jbig2dec-0.16          | NOK | http://autobuild.buildroot.net/results/5476385194b37571494d3bd6179b0ac978b2e644 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/fe10c633b7cb59411aec6d720142dc2b1fcf2841 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/7aace392f349b5f85b2c6d65463c7324be5b295d |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/62fca2b1a45e2b63cf552a23a822d5b1e0252816 |     
   x86_64    |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/1d777cf85d04a3e4bc301aa5e341ef56165e5784 |     
    arm      |        libglib2-2.64.1         | NOK | http://autobuild.buildroot.net/results/f4b693328c733b812de9de0ffcd725bbc731eb7a |     
    arm      |          libnss-3.51           | NOK | http://autobuild.buildroot.net/results/47372dd6e770ecb9334f64ba7d5fb81ba58e8d52 |     
  riscv32    |        libostree-2020.3        | NOK | http://autobuild.buildroot.net/results/6702979ef971b7df38b1c54c7c393d88079af28f |     
    arm      |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/4d14b540caa875607eb564133a5d2e120471ed23 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/369d680d5357d527700da21b769691572b040e24 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/c62ae4d93fb20cd0f529fbf79f4e184f5561fe54 |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/d5d2fe75ddeb767c0e24a6ac8e6284dde6efcbfb |     
  riscv64    |         libtirpc-1.2.5         | NOK | http://autobuild.buildroot.net/results/cc1a42412b64f86831797553def37051855e769a |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/f923838aa35e299e4a81ba3094e8175400f9eb77 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/271a8d76b533395173c9d3de34667d23ca1c77d7 |     
    i686     |         libuwsc-3.3.2          | NOK | http://autobuild.buildroot.net/results/eb7b73568ee4058f381c3e7c5634b1c5d92c3ca4 |     
    m68k     |         libuwsc-3.3.2          | NOK | http://autobuild.buildroot.net/results/535d77b281abf180a0a43e157707818f65d16cf2 |     
    arm      |         libuwsc-3.3.2          | NOK | http://autobuild.buildroot.net/results/431d53d41dd96def3baef476408ffe025a424fe5 |     
    arm      |          mpd-0.21.20           | NOK | http://autobuild.buildroot.net/results/52a4ab5858a860d4a12c47cdeac182821c39e019 |     
    arm      |          pango-1.44.6          | NOK | http://autobuild.buildroot.net/results/dc77fe1c8453d341b819bbda9d46a935246ea242 | ORPH
  aarch64    | piglit-ef761094be04d14e258a... | NOK | http://autobuild.buildroot.net/results/1a29435acde964a1eed53306f942f34c335ad019 |     
    or1k     |        protobuf-3.11.4         | NOK | http://autobuild.buildroot.net/results/ab570b7fa573c56afa2cb5c9ebd4f10e0718a047 |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/7333407c28984a6f4ecc0e5ab7fe4ea450fb2362 |     
  aarch64    | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/1604ca9a5a42074552fec933d0eb9b98686c6948 |     
microblazeel | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/e7ad8eba469bc39509968b17034428ea0172e4ea |     
    arc      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/a64eb9c5b22e461e6154c4ce65231c2b1e7498bf |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/3688993cd2a2dca1ea31a368c241edb5803540a1 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/786ef861d6188807b6b8a7c98ae6111cb75cf715 |     
    arm      | psplash-fd33a9b3d68c89fa22f... | NOK | http://autobuild.buildroot.net/results/25d4a50428f63a3e491113615a8d586bfd7009ae |     
   x86_64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/a4884cb9935d1a1afc42919163d0b8142abed310 |     
  sparc64    |     python-markdown-3.2.1      | NOK | http://autobuild.buildroot.net/results/90d5307dd9c282d209df559c2ab9d573045d9eea |     
  riscv64    |      qt5multimedia-5.12.7      | NOK | http://autobuild.buildroot.net/results/42b33dfc60113efb4e722a712b96d68b484bf4b1 |     
   mipsel    |         sysstat-12.2.1         | NOK | http://autobuild.buildroot.net/results/7031a8ffe495d98272a8a0d0a2744057bb27e348 | ORPH
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/ffd3eef54c37e7b07e34352cb869b21fa55b07ea |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/3746845b0ba87d7e3eb711781ef4b917f1e7c0f4 |     
   xtensa    |            unknown             | NOK | http://autobuild.buildroot.net/results/349fb86a435a692a497e1b9ef169374419d4698e |     
    arc      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/5b16583838ebf5308a13c430143170d071375ef8 |     
    sh4      |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/debfe4934e481f40824ad5762ef7be0bed9a9dcb |     
   nios2     |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/e2a453390ad52b83cb8d7c3b68cb527cfdb84595 |     
  powerpc    |        wireshark-3.2.2         | NOK | http://autobuild.buildroot.net/results/c8484d5facf5fc742d7e746a804f01ff007d1e9a | ORPH


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

             host-grpc-v1.16.1 | 1 
          host-mono-5.14.0.177 | 1 
          libtorrent-rasterbar | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |       host-grpc-v1.16.1        | NOK | http://autobuild.buildroot.net/results/871a47d566e95efd8e277c3e31a217a97de675d5 |     
    arm      |      host-mono-5.14.0.177      | NOK | http://autobuild.buildroot.net/results/e55958ee75c6bf0301b055d4710f83baa9b2747d |     
microblazeel |      libtorrent-rasterbar      | TIM | http://autobuild.buildroot.net/results/9ca989e2160abf202fe4b6eaf90fe486fddb949b |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

                nodejs-12.16.1 | 2 
                 systemd-243.4 | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/5d3449980f9ceb4d27242e9afc94260acecb4808 |     
    i686     |         nodejs-12.16.1         | NOK | http://autobuild.buildroot.net/results/ab562faccfa399c390b4e84a03d2bfcd84cdf8e3 |     
    arm      |         systemd-243.4          | NOK | http://autobuild.buildroot.net/results/62608fb368773a51cb746f42c0bffac5d66eb891 |     
  mips64el   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/8876156b176c9f9f298d6cb70206bd013fb4d53b |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                oprofile-1.3.0 | 2 
                qt5base-5.12.7 | 2 
                     vlc-3.0.8 | 2 
              host-grpc-1.25.0 | 1 
                  ndisc6-1.0.4 | 1 
                 rocksdb-6.6.4 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/c6a27e71397178a8bd8ed96d6bceaa1ae3404918 |     
    arm      |          ndisc6-1.0.4          | NOK | http://autobuild.buildroot.net/results/874932dede81494af3d62d8bb0f72261b7f405f6 | ORPH
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/fc147a6fe2c4f194a38d79c9190e31602fff9f6b |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/1a5f3c5ae6e3bddb7499852b763db67ea187352c |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/5f8d758d5c2852eb08715e0625a3bcb5aa3c5fc2 |     
   xtensa    |         qt5base-5.12.7         | NOK | http://autobuild.buildroot.net/results/8473ac26425b349a40d38872915835a0e5121a9d |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/2c1fed8894b5deed8e925837f2b9146d08b4b797 |     
  aarch64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ff01e75a363f887eef85b0b1ea05aa77871a4cb6 |     
  riscv64    |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/06202660b93eaca632c38050bd0bacf52c7ff853 |     



-- 
http://autobuild.buildroot.net
