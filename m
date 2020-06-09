From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 09 Jun 2020 06:29:57 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-08
Message-ID: <20200609063004.19B0087C0D@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-08
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 10  |  3  |  0  | 13  |
  2020.05.x  | 19  |  9  |  0  | 28  |
    master   | 127 | 51  |  0  | 178 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

           host-wayland-1.18.0 | 9 
                qt5base-5.15.0 | 5 
                       unknown | 4 
             freeswitch-1.10.3 | 2 
                 gnutls-3.6.13 | 2 
              host-grpc-1.25.0 | 2 
           host-nodejs-12.18.0 | 2 
             kismet-2016-07-R1 | 2 
                 openal-1.19.1 | 2 
                 rocksdb-6.6.4 | 2 
                  rygel-0.38.3 | 2 
                      tio-1.32 | 2 
              bitcoin-0.19.0.1 | 1 
             c-periphery-2.2.1 | 1 
                   cegui-0-8-7 | 1 
                coreutils-8.32 | 1 
glmark2-9e01aef1a786b28aca7... | 1 
      gst1-plugins-base-1.16.2 | 1 
              ibm-sw-tpm2-1563 | 1 
               libupnpp-0.17.2 | 1 
                 mesa3d-20.1.0 | 1 
                    mpv-0.29.1 | 1 
                nftables-0.9.4 | 1 
               protobuf-3.12.2 | 1 
            qt5location-5.15.0 | 1 
                     qwt-6.1.4 | 1 
                    vlc-3.0.10 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/c7bf7613bd04190095f7d02fdf3c5397c03b90cc |     
    arm      |       c-periphery-2.2.1        | NOK | http://autobuild.buildroot.net/results/8a9afcec62eb4e54a95b1ef6c6f0ff06ec0ad444 |     
  aarch64    |          cegui-0-8-7           | NOK | http://autobuild.buildroot.net/results/464bad3f1ae9cebf39bebdc6f32106b892ff98b9 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/a761ece869618da66382256aacff868ec466ed50 | ORPH
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/04f36d541ee6754cd59a9db8605de9de4e1af7f9 |     
  powerpc    |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/6d1e26135db01b2cff9aea4f11d10bae16d4a9ad |     
  aarch64    | glmark2-9e01aef1a786b28aca7... | NOK | http://autobuild.buildroot.net/results/15404cb3050450610281cdd81566306d74df62ce |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/1aef19ce08204544ca2a9da0f2d5200ce9e813fb |     
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/c28c0ee8402454a3e85c58b1bd2adf680f58829e |     
    arc      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/36510c4acdfbdb11232a35122b9b6844593e228b |     
 aarch64_be  |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/6d8bf4d02a47256a5700d9f100e7c864f8cb7704 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/af29890d91749f1e9daf31ecc731b912e220e49e |     
    i586     |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/a44e38fd339a99538db68b69309a5fb4a7d669ee |     
  aarch64    |      host-nodejs-12.18.0       | NOK | http://autobuild.buildroot.net/results/444502345eb97cd4ce964459e469a1c7b2366228 |     
   mipsel    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/fd8b7881777e5f6c1d83a0a55e693b4b90d5ff61 |     
  aarch64    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/002fe0b8cfb045d136a6f1c905a74e102a7eb26e |     
   xtensa    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/7e961ee25baf910218ad070c96a229018261827d |     
   xtensa    |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/4e80afc5cd10f6274f148f1362737a538b94cd68 |     
    arm      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/f3092df9031eeb118a4d9d14885d0ae9074870e1 |     
  mips64el   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/585f581811994e2bd983bd13624ea45f9ba8a8d9 |     
    arm      |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/bf57df42008a1589786b42b8b9833e0ba874dffc |     
  mips64el   |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/15ad2ab51f5ba5109636d5a9e0f4771a3cfc3d0d |     
    mips     |      host-wayland-1.18.0       | NOK | http://autobuild.buildroot.net/results/c1227e81316a823fa23706300e0201ad15c0303a |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/b6a369ad0fcde4ce20001ce4a2e1ab94ac4a5f8e |     
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/b63874eedd6fca6ddea8b999aa35926350f4c699 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/06fe07630964c28e276d76c1143d2f0a95039846 | ORPH
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/7edf43b0aa9d541ad698146e0d1f36832a32796a |     
    arm      |         mesa3d-20.1.0          | NOK | http://autobuild.buildroot.net/results/8eb48d9e4d47a7c202e97f97518c0f3928c1e6cc |     
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/26b3fd6bb8c4738296588309f3a33f47fcbb31e2 |     
    arm      |         nftables-0.9.4         | NOK | http://autobuild.buildroot.net/results/94fc335762b6bda66ce0dfea3c5093b3fe941832 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/580fcc73b8278b06129d673630cf3b23de313dc6 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/72743d9e85e1bf97e5537a0aab0be53924bde588 |     
  riscv64    |        protobuf-3.12.2         | NOK | http://autobuild.buildroot.net/results/f7cb48d563f4de48cc6abaf0ca68e11828818f30 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/582913f2b21ec08cd4ca8f3991abb510ff9c42cf |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f3e0eb67c78a710bc6f2345fb12a0b51015af9dc |     
    arm      |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/aca2a1c3aec09ebf16e4db564d399521d3cba88d |     
   x86_64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/f3a587f462cea13020231fd66e2c85b10f912cc7 |     
   sparc     |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/ce95fb624aecc6935600b5936a003ecafc37ccc2 |     
   mipsel    |       qt5location-5.15.0       | NOK | http://autobuild.buildroot.net/results/8eaaccfdea3ba9d8937f06b9b0cc45c3b2dbb144 |     
    i686     |           qwt-6.1.4            | NOK | http://autobuild.buildroot.net/results/9693ad79e4c23c9c0324df02a4d57c662b82fbce | ORPH
  powerpc    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/1aaf0f99460b734b6144ad5f5ed8b4daa0b4d618 |     
    arm      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/bfb820b1ce7f60a29d30730a6d77f87c8225f988 |     
    arm      |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/b8ed956c97741f8c8aecf7ac3d75f83ab31e7d5c |     
    or1k     |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/284468056c5c014841c429fb8871664f59cf4f26 |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/42273899f4b2c1423487539c8ce471d56e7c6b60 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/09ef1b6c573c509b4256f3409c63d3062ade90d9 |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/fd7f621351b3b745bbf81705cc2468764a3232f7 |     
    sh4      |            unknown             | NOK | http://autobuild.buildroot.net/results/aeb6137097076296851e281f766c734cefbf2517 |     
  powerpc    |            unknown             | NOK | http://autobuild.buildroot.net/results/19e935ca44371ff0fab11041dba5c53fb81d6b6e |     
    i686     |            unknown             | NOK | http://autobuild.buildroot.net/results/1cc24bd5d1fac3cc3373c4a33f5a47c789293ec4 |     
    sh4      |           vlc-3.0.10           | NOK | http://autobuild.buildroot.net/results/bf9b32a19d8bfe583ebd6d2d0b0b5b60cabeaabe |     


Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                      tio-1.32 | 2 
           oracle-mysql-5.1.73 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    i586     |      oracle-mysql-5.1.73       | NOK | http://autobuild.buildroot.net/results/2de036b461e6ecedf1c72022c70a3a19a60f803a | ORPH
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/7e56aa4f1e678f7f37b0412c59129c8a3a30a05c |     
   sparc     |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/fa3c53d234c1ca5ff6310d110fa81e384f56abb6 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.14.2 | 3 
                 xvisor-0.2.11 | 2 
                   cvs-1.12.13 | 1 
                 gnutls-3.6.13 | 1 
                 mesa3d-20.0.7 | 1 
                 systemd-245.5 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/f92aa10f8247de706d3c370e496ff2e3dd414fcd | ORPH
    or1k     |         gnutls-3.6.13          | NOK | http://autobuild.buildroot.net/results/4f5b08e8cfc81806eeba5fe0f53759d0961f522f |     
  mips64el   |         mesa3d-20.0.7          | NOK | http://autobuild.buildroot.net/results/3dec4eb8074ae3c6e341281a0bafc47b4ef2b420 |     
   mipsel    |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/b63fa2d7d5e791324f1afe33574e609e4e37da12 |     
powerpc64le  |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/2efe7c56b84a61429fdb44c915b977d9d380d027 |     
    i586     |         qt5base-5.14.2         | NOK | http://autobuild.buildroot.net/results/828851b2df8f2b667378353aebafb4e2b22b72e7 |     
  aarch64    |         systemd-245.5          | NOK | http://autobuild.buildroot.net/results/00f1aeba7af1688de59f74c95ab5303a138d0e23 |     
   x86_64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/f8ff2e450cd079b0cd7588b6e2c830177cb0c5e0 |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/3229c1203121935addc04fb23dfb23853c8d37eb |     



-- 
http://autobuild.buildroot.net
