From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Jun 2020 06:25:54 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-06-25
Message-ID: <20200626062601.286578831E@hemlock.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-06-25
===============================

      branch |  OK | NOK | TIM | TOT |
  2020.02.x  | 12  |  5  |  0  | 17  |
  2020.05.x  | 20  |  5  |  0  | 25  |
    master   | 109 | 81  |  0  | 190 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 gnutls-3.6.14 | 21
          fuse-overlayfs-1.1.0 | 10
              host-grpc-1.25.0 | 4 
                 openal-1.19.1 | 4 
                       unknown | 4 
                   cvs-1.12.13 | 3 
                      ell-0.32 | 3 
             freeswitch-1.10.3 | 3 
                    mraa-2.1.0 | 3 
                  assimp-5.0.1 | 2 
                  boost-1.73.0 | 2 
              ibm-sw-tpm2-1563 | 2 
libcamera-96fab38e02792a109... | 2 
                qt5base-5.15.0 | 2 
                  rygel-0.38.3 | 2 
              tinydtls-0.9-rc1 | 2 
                 xvisor-0.2.11 | 2 
                     avahi-0.8 | 1 
              gr-osmosdr-0.2.0 | 1 
          gstreamer1-mm-1.10.0 | 1 
              keepalived-2.1.2 | 1 
                libcurl-7.71.0 | 1 
         qt5declarative-5.15.0 | 1 
                 qt5svg-5.15.0 | 1 
                 ripgrep-0.8.1 | 1 
                wayland-1.18.0 | 1 
                  zeromq-4.3.2 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/c740b7035eaf9815ce622f78169ab2fd4788ef17 |     
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/5861143b4594202fe95936e52a425ec600a53fca |     
   mipsel    |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/eda8823f5c037f011ff23b6d24f7cb90f98b3abc | ORPH
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/68acc4bd9817f109833c162b47c664aaee69b394 |     
   x86_64    |          boost-1.73.0          | NOK | http://autobuild.buildroot.net/results/cc13fc7a147c65085a1a19e243495b5c7486e7af |     
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/f33cf81b7767af0618cf579bf30e244257774769 | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/7b3a179a394f3d1f8ebfd3615dc89f37a7e9334e | ORPH
    arm      |          cvs-1.12.13           | NOK | http://autobuild.buildroot.net/results/c983013031ab21e4abcc1d1c19d056f9b3fc9a6b | ORPH
    arm      |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/ddc74c7042ce2c093c46b3dcb0d1910d1aa2ac63 |     
  aarch64    |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/076b91e96eb8014b028959a9ee4effb049ea129e |     
    arc      |            ell-0.32            | NOK | http://autobuild.buildroot.net/results/83d9fb79994c02157a5039e36730a7690b85b0e3 |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/8faa612f8f5389bf594075206eadb8fc0113336b |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/47374b8a09040881c51c4bc6168ee20f39cc767d |     
    arm      |       freeswitch-1.10.3        | NOK | http://autobuild.buildroot.net/results/967857697de875de71144649f1b87490490324f3 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/ac29b2bfa445ed11e2468fa22085419b96d6231e |     
microblazeel |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/50aad3bcb31a6651f811e207c5499863417f24fe |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/8be3d39a6e070d5b1a9d7386d37d6a73f906ffdb |     
    or1k     |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/c0b2fce50c8a983ac72af632ec104bc0c5362d54 |     
microblazeel |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/016325bed027c6f5f81c9063775ca3fb63c89f6e |     
    arc      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/c29b0cb6139319c6148bba6c2792f4b9800ed83c |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/1b252c311e34a9c6f1833b3af16def9ddb2cc1f2 |     
    arm      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/767e4d156aad573d3f2f4059599a5aa07bed63bc |     
    or1k     |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/b9f26db30b641b41099df8bfbbc7ac8a273bdbd3 |     
    arc      |      fuse-overlayfs-1.1.0      | NOK | http://autobuild.buildroot.net/results/d5997430277bf22450abd236c0f3c87e86c891af |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/add97d643cd0c56e8e4638e58818421bece8703a |     
    m68k     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/985aa8f72667ad8f04c9674da6877285c2aeb1d0 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8bd2861dfd2ba86e39ccd03b5fe39c4a2fd826a3 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e6b9fcf1fa8d054bb4adb7d2f0d3f1a0c3e41760 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/8b6e3de133a4b51a6e481a6418ed5a9c70169a56 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/e1bf1868b3a213bcdaed9e51c4d776a694104680 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/9ff8d0450df7f5176b51ede90333f1af2861e8cf |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/5ee4bda51c97874e9fa55fb627b2556efad8a16e |     
  mips64el   |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/99f882d462f04fde865b9373ba672392bba6675e |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b8e587ebf1e71b8dac0bb6166eec847693e56d8e |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/79f0c3ca313eeedd9b1e0ecac81551e2fb102892 |     
   sparc     |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/b4f85187ecffbb865e25501ed80516c0f895ae7e |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/aca5e6c393e66397eb95bde706af5cc7b10ce585 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/6eafa98bae42c0a9ccd25c003c1c56f86446d574 |     
    arm      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/d2a604aed377b89a0603995e19597d27d4c8c5db |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/4137d8dc244a4c4cb905c3f97186dc2f1ab0086b |     
   x86_64    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/642510225491fee03ae5fd90bcea8da01d764a50 |     
    arc      |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/2caabf1bdd1972b88552e058b27bae82985ed303 |     
   xtensa    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/0ba68327aa3d33b75d429b835135e1a14ee07004 |     
   mipsel    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/466550309952af1573561a961093315d847549b0 |     
  powerpc    |         gnutls-3.6.14          | NOK | http://autobuild.buildroot.net/results/867afc8548cd21abb127702d99c86eb9c2317c96 |     
   x86_64    |        gr-osmosdr-0.2.0        | NOK | http://autobuild.buildroot.net/results/0a973e31afdf2359c10b9e55ee827fc030fbf857 |     
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/cb19e7ab21b567ff155ad4a8320e657583aae8ab |     
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/581f5387efcf631f0c8c5063378e1ce81fcd52f8 |     
    mips     |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/da89b73ff9d25d0cce2636cdf89e51d1a3966c44 |     
    arm      |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/1322f3df04e9ec96a6dccf3141d917a10a40374f |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/71db525069123eb948fb0792bee7711403dc8e05 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/2ad6c5e487fc4fef98eff2df05c40f108a4a0655 |     
  riscv64    |        ibm-sw-tpm2-1563        | NOK | http://autobuild.buildroot.net/results/445e136ead495c54126cf2e66a4bdf5531726c33 |     
   nios2     |        keepalived-2.1.2        | NOK | http://autobuild.buildroot.net/results/db7f149f63e9180b22460caa74850673362aa17c |     
  riscv64    | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/e6a104b2b069b5476b7c7a855eaff3d6960ccc9a |     
    arc      | libcamera-96fab38e02792a109... | NOK | http://autobuild.buildroot.net/results/6752420ec2c8554c430191ccf50fc11a2c26bc16 |     
    m68k     |         libcurl-7.71.0         | NOK | http://autobuild.buildroot.net/results/f32b6ab927560839cacaa1b9e6b64ced92b9ffe3 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/6c7f19ea9757b483c3c7fe35d72ce9f9304f5919 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/1c2bbeda09a695af2e53b0f72a116e6abef94b23 |     
    arm      |           mraa-2.1.0           | NOK | http://autobuild.buildroot.net/results/7ea000298a4806040d9ec6140097eb3036440ee9 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/c882fd2cb523d61c68c72b2f4c416d4bcec8f8ef |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/0ac494a2800d645209bd7daab4c1fa34162ec0b3 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/c5eef32f3f9d22622ff1429e8b7bce3a03df6981 |     
    or1k     |         openal-1.19.1          | NOK | http://autobuild.buildroot.net/results/fda8e9c6c11cb21aa12cc2119285987c54500904 |     
  aarch64    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/1c28093c47a183e1bb59154e2224338d10826ed1 |     
  riscv32    |         qt5base-5.15.0         | NOK | http://autobuild.buildroot.net/results/22c5a3e7aa89b85c38b06015fddb50d7efaf12e2 |     
    arm      |     qt5declarative-5.15.0      | NOK | http://autobuild.buildroot.net/results/d0c43084edd4de1221d93dfdfa15dfdeae16ceeb |     
  aarch64    |         qt5svg-5.15.0          | NOK | http://autobuild.buildroot.net/results/b948843dcb17567318401e4fdddc3a1f48dc3f9f |     
    arm      |         ripgrep-0.8.1          | NOK | http://autobuild.buildroot.net/results/bf3b02c461ebc7f6bc9fa27ada19d0de5a6d2f76 |     
  mips64el   |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/d24a1b4ae584a45e50d2cf86e7b91f313ef043ea |     
  riscv64    |          rygel-0.38.3          | NOK | http://autobuild.buildroot.net/results/2ad2fc2203ebbbc4e92a9acacb97d9f66578be2b |     
  powerpc    |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/7e3d3ccc7d6d4a9f3e3b652c52367c9c98ec2d11 |     
 powerpc64   |        tinydtls-0.9-rc1        | NOK | http://autobuild.buildroot.net/results/84c67ace2abab3590441bcd6eea2070208f21c3b |     
    arm      |            unknown             | NOK | http://autobuild.buildroot.net/results/e23e902370dbd7b290f3e631e6500e7726b56b88 |     
  riscv64    |            unknown             | NOK | http://autobuild.buildroot.net/results/cc9d4c95cf25e9c347cf8fd1f54dd00ce778dbde |     
    or1k     |            unknown             | NOK | http://autobuild.buildroot.net/results/aef61b23c09e7852f231ee07162d746597391ce1 |     
   sparc     |            unknown             | NOK | http://autobuild.buildroot.net/results/0f65804ec0896b04b9bffd2a8cb2429d7e3ed370 |     
    arm      |         wayland-1.18.0         | NOK | http://autobuild.buildroot.net/results/4cca5e0278ed65392ce877681d7290b00454de1c |     
    arm      |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/1db623eddf565b6e886167b4551b22350a436b39 |     
  aarch64    |         xvisor-0.2.11          | NOK | http://autobuild.buildroot.net/results/2bb6382dc3034df66e7555db2a83cb1ef13192d9 |     
    or1k     |          zeromq-4.3.2          | NOK | http://autobuild.buildroot.net/results/1cda986d8559653d08e47951cbb130e8c439c194 |     




Results for branch '2020.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mesa3d-19.3.4 | 2 
               libupnpp-0.17.2 | 1 
                qt5base-5.12.8 | 1 
                 qt5svg-5.12.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/2191db4e7ee8e8e4c2e05aeb35434b15b977f8ab |     
    arm      |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/d3987fd4e08820b09e01cf78a68660dddfa5ad7d |     
  mips64el   |         mesa3d-19.3.4          | NOK | http://autobuild.buildroot.net/results/9fef91a26dd549b5fc2732525a4bde4b39936a84 |     
   xtensa    |         qt5base-5.12.8         | NOK | http://autobuild.buildroot.net/results/d7fe4862bb7ac07da0570912ae3d3fd6d1d35175 |     
    sh4      |         qt5svg-5.12.8          | NOK | http://autobuild.buildroot.net/results/ad2ce62da951b0be2db55020825f4b09a19352e0 |     


Results for branch '2020.05.x'
==============================

Classification of failures by reason
------------------------------------

                     avahi-0.8 | 2 
                  assimp-5.0.1 | 1 
              host-grpc-1.25.0 | 1 
                   mimic-1.1.0 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  mips64el   |          assimp-5.0.1          | NOK | http://autobuild.buildroot.net/results/9d2f07b85cb581ad85e6a337662f6ffae3e43068 |     
   nios2     |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/edc65fa867060419b2341b786e936df4014f704d | ORPH
 powerpc64   |           avahi-0.8            | NOK | http://autobuild.buildroot.net/results/922c4fb37a2e60594b37a5e8d6795407e033b95f | ORPH
  aarch64    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/3da153cc9781ebebe48bb6ec86f9f773d92dbc42 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/80cdbeca9929965ec22210dbc3c65a058b93586e |     



-- 
http://autobuild.buildroot.net
