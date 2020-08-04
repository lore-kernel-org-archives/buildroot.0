From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 04 Aug 2020 07:51:52 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-08-03
Message-ID: <20200804075159.2D1AA86DAD@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-08-03
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 16  |  0  |  0  | 16  |
  2020.05.x  | 16  |  7  |  0  | 23  |
    master   | 79  | 75  |  0  | 154 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              keepalived-2.1.4 | 9 
               libglib2-2.64.4 | 7 
          fuse-overlayfs-1.1.2 | 6 
            host-setools-4.3.0 | 5 
        libabseil-cpp-20200225 | 5 
               domoticz-2020.1 | 4 
             kismet-2016-07-R1 | 3 
libcamera-96fab38e02792a109... | 3 
                       unknown | 3 
                  assimp-5.0.1 | 2 
                  boost-1.73.0 | 2 
               collectd-5.11.0 | 2 
            live555-2020.06.25 | 2 
                 openal-1.19.1 | 2 
                  zeromq-4.3.2 | 2 
                     avahi-0.8 | 1 
  binutils-arc-2020.03-release | 1 
              bitcoin-0.19.0.1 | 1 
                coreutils-8.32 | 1 
                   cvs-1.12.13 | 1 
  gobject-introspection-1.64.1 | 1 
          gstreamer1-mm-1.10.0 | 1 
    host-mender-artifact-3.4.0 | 1 
             host-pango-1.44.6 | 1 
              ibm-sw-tpm2-1563 | 1 
               libupnpp-0.19.2 | 1 
                  monkey-1.6.9 | 1 
                    mpv-0.29.1 | 1 
   openvmtools-10.3.5-10430147 | 1 
package/feh/feh.mk:47: feh-... | 1 
               qt5webkit-5.9.1 | 1 
                 ripgrep-0.8.1 | 1 
                rocksdb-6.10.1 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/ee950872b24b904916dc01c18e537e566862a04f |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/7195596f57c046a861562a8d04802badf41e4478 |     
  riscv64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/77c8e6762cf84a94d4fcf2dce321de04a98e3b79 | ORPH
    arc      |  binutils-arc-2020.03-release  | NOK | http://autobuild.buildroot.net/results/b52896e51c62bd6e147ec27dbc28dc5399ed41b1 |     
    arc      |        bitcoin-0.19.0.1        | NOK | http://autobuild.buildroot.net/results/e94d91f52b2820503fa145d2f22e46802150ef14 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/f1e4595f2e9eccf11ba20010c2c229409fc69e1d |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/8d633493c6a6e6e89598c0c7417273b573e547aa |     
    i586     |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/0e4cb60922492231fa653eca5fffa13af684d8e7 |     
    arm      |        collectd-5.11.0         | NOK | http://autobuild.buildroot.net/results/147a2e0244348967ca98fe658a88f27b40aa27c7 |     
    arm      |         coreutils-8.32         | NOK | http://autobuild.buildroot.net/results/ba72838ef1239bff3fc8f361be0b2c946cb98f63 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/0635f65c8029e6087c3c790a9ddcd503ac3533f5 | ORPH
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/a09367df9bf4f6a9f211f80a331ffbe1a3323b74 |     
    arc      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/2f4fd19072d82008f2006bf6c8ab3c46a0853cb4 |     
    arm      |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/30f092055d74dde02f1d01ac60af6547945d2fda |     
   x86_64    |        domoticz-2020.1         | NOK | http://autobuild.buildroot.net/results/5cb421043ac028a0bc41f6d16aa166a88ad59035 |     
    arc      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/95aac0d5db497199da28f3bdf0e710a323141def |     
  powerpc    |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/b12644be4f694b3ec80162030fca6d9a40e9fd04 |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/4dcfb538c1b5e3b3eefdc20ff319a8f23e1e7fce |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/6877310e8bb699fdc8a50a69d3b4ac38608e2c47 |     
    i686     |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/42657561ba380f3bceb36bf246b5e4c5cd55b1db |     
    arm      |      fuse-overlayfs-1.1.2      | NOK | http://autobuild.buildroot.net/results/304865299bbf226396d5748f8b5af94fdfaf4219 |     
  riscv32    |  gobject-introspection-1.64.1  | NOK | http://autobuild.buildroot.net/results/37060d439b474f47523d7e297f349765dab83627 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/02d1d7bd6ad58d107501d42cfbb6bb3b3c4ac82e |     
    arc      |   host-mender-artifact-3.4.0   | NOK | http://autobuild.buildroot.net/results/b1f1b9aa1150d86cb01cd27d38e90b3bfe4cce93 |     
    arc      |       host-pango-1.44.6        | NOK | http://autobuild.buildroot.net/results/e1f33fd45e7ab806fe3ac48f1bda1db7dff15a02 | ORPH
  riscv64    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/9c58f3b354befe2240d9dec45cc12d31e1e17798 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/bd31570835991d4398a462153488fe1e5f548136 |     
  aarch64    |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/c7ba94fc8b866b140a4a3e7c8c43c915862055d7 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/837731f4192d382514a898f9e63b13bd6d9e9f68 |     
    arm      |       host-setools-4.3.0       | NOK | http://autobuild.buildroot.net/results/c04e8ee5b6a571b4e94923eabd4eef55f4914698 |     
    arm      |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/44e67f1f92fd01da043c68c8b99adafdfc9d44e5 |     
   nios2     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/4500ff7f7fd8f781d9796f6422ceeddefd223671 |     
   x86_64    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/7ffff35651799e3e05ebbae1e00ed9524ab2cbb2 |     
   mipsel    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/454c37761e842a3b1dd90a8d1c3a3628ab46d25f |     
    i686     |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/f532aea6224878f0d7925a87b05d81f4095c53c5 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/cd18b07a7bf7942591d1f14dcc6179fa862d8a52 |     
  powerpc    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/cbf21b0ce2e78d62eb9957be2ec3ea7008f5207d |     
   xtensa    |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/ceedf320d9a8301baf74e7b00079ac4a62a29868 |     
    sh4      |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/d37ec8452f910bbed270a280927995ff88d2cd04 |     
microblazeel |        keepalived-2.1.4        | NOK | http://autobuild.buildroot.net/results/757d164cc8cb2a81d8f85469be7bb6037994ed0e |     
   xtensa    |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3313b2c584970c46593ef5191f7002afd22130de | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/c524fd13d22166528312c00e9e9db4538cf6bea5 | ORPH
    arc      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/1bf18b7202319f0b94af428b2b35b758d9878ccf | ORPH
  powerpc    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/5e74b82679a4955291b58ae86239876b048256e0 |     
   xtensa    |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/431872b0605ca837d508a1fd0a54c234a001caa2 |     
    m68k     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/3d65ffcc15a214e2a623cf526245d735b04c384d |     
   nios2     |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/8f2de049c4d047849ef16bfb316b87d3072f54ef |     
    arc      |     libabseil-cpp-20200225     | NOK | http://autobuild.buildroot.net/results/1394ff1ac84c38a1d2c822bcfe318f7fa9db429d |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/5c87951094988bd0aa89798676a35d4e5cd51cc7 |     
   nios2     | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/c98cdfa51aaec1d44da9134d8ca56bdcac72c415 |     
    sh4      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/51806bfd004d57a04cd63e6d8950b29700acfa63 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/80d1ee680f7f49ecb876ab26dfc61a5dc8c6cdc4 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/9fd4981cf4b4d89f7a55e59d40e4f193b982ddcf |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/c7bb23e5cbf66510153de33de0a155decc4dcf56 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/aeeb1e08ae663e0af266027a331a9ad399624bb5 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/189ad42b95b8dae3d08e77f44649e046736c57b2 |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/167a7924fbe9b804422a9b5707709a08331b0dfa |     
  riscv64    |        libglib2-2.64.4         | NOK | http://autobuild.buildroot.net/results/c51829c402e3f89d58ebf6377e97d87dc08df07a |     
    arc      |        libupnpp-0.19.2         | NOK | http://autobuild.buildroot.net/results/a49b642a3df0310e8f57ddc98906e4e57985cc44 |     
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/516eb2f20b3ee94c5c1dee5066cbfc271e9e6cc3 | ORPH
    m68k     |       live555-2020.06.25       | NOK | http://autobuild.buildroot.net/results/e2bd527c803cdd203e01774d0e4fd0eb38127e2f | ORPH
    m68k     |          monkey-1.6.9          | NOK | http://autobuild.buildroot.net/results/a657a033af439d97979b721ee3837e3802614e2d | ORPH
  riscv64    |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/2b8d92820d7e4eb351d2bfa2d9c75a2fdf7bf884 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/a9ccf8a794fc9f07950182188ec22684deab38d5 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/8c289588a70737794119f8dbb96f1633f51d7178 |     
    i586     |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/c35582c8d7c2992d99df8a578e6ae6fa1441ef66 |     
  mips64el   | package/feh/feh.mk:47: feh-... | NOK | http://autobuild.buildroot.net/results/32a8832dc916e91fce4b9f38e1c44697529746c5 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/dec3d749066434bb7d58100a39bdbd24379a6d6c |     
  aarch64    |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/c36c7c7d8de14b82dace9c3aa6473bedfbc49b27 |     
  powerpc    |         rocksdb-6.10.1         | NOK | http://autobuild.buildroot.net/results/99a0b0423fd262a0f5089fed4f23fbcb8ee4e52b |     
    i586     |            unknown             | NOK | http://autobuild.buildroot.net/results/81fb2143c70a0bed561b292dd2b42ad155e8e865 |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/832d91fddfdf51fa6dab5b470220b2ea6ead6ea5 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/66552e9eab6d347b2ea6c8a63a99a8c211ea8a52 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/a1635f8754b8440c88cf246c5acda354eacc190f |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/2c93023d504617b2c373c0d4f57a0b5b5696a249 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                     avahi-0.8 | 2 
             kismet-2016-07-R1 | 2 
               apcupsd-3.14.14 | 1 
                    mpv-0.29.1 | 1 
 xdriver_xf86-video-sis-0.12.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
   sparc     |        apcupsd-3.14.14         | NOK | http://autobuild.buildroot.net/results/f21f0e22e239c3fe127eaf367aa2067689eba20b |     
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/7ae7caec4c8303a3cdeeca74c34450566377c70f | ORPH
  aarch64    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/ec2666aed1ef90ee1bcbf966a59fd601ce1b96e0 | ORPH
    arm      |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/ea7188d60b99a46cfc200674c2c9a6084b27c1a0 | ORPH
    or1k     |       kismet-2016-07-R1        | NOK | http://autobuild.buildroot.net/results/3ee12e6d0ad91a26cea3240b48ea078a81ab7345 | ORPH
    arm      |           mpv-0.29.1           | NOK | http://autobuild.buildroot.net/results/d22a8d352f24db2f4d3bc507ff8a13a6489faec2 |     
  sparc64    | xdriver_xf86-video-sis-0.12.0  | NOK | http://autobuild.buildroot.net/results/10d841678e87d7e54606a602429c7ed384ed5036 |     



-- 
http://autobuild.buildroot.net
