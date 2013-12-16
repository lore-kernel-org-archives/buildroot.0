From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 16 Dec 2013 08:30:08 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-12-15
Message-ID: <20131216073008.B1844101581@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-12-15
===============================

        success : 93 
       failures : 47 
       timeouts : 1  
          TOTAL : 141

Classification of failures by reason
====================================

           python-pycrypto-2.6 | 6 
                 pixman-0.30.0 | 5 
                     m4-1.4.17 | 3 
                  thrift-0.9.1 | 3 
              gstreamer1-1.2.1 | 2 
                 ffmpeg-0.8.15 | 2 
         dvb-apps-be76da69f250 | 2 
                    ola-0.8.32 | 2 
                    fbgrab-1.2 | 1 
               ruby-1.9.3-p484 | 1 
             bluez_utils-4.101 | 1 
              python-pyasn-1.2 | 1 
            python-crc16-0.1.1 | 1 
                  iozone-3_414 | 1 
                  libeet-1.7.7 | 1 
                libsigc-2.2.11 | 1 
                oprofile-0.9.8 | 1 
             alsa-utils-1.0.26 | 1 
             util-linux-2.23.2 | 1 
             dmraid-1.0.0.rc15 | 1 
           imagemagick-6.8.7-9 | 1 
                 netsnmp-5.7.2 | 1 
          qt5declarative-5.1.1 | 1 
                  zeromq-3.2.4 | 1 
                  libv4l-0.8.9 | 1 
                  ramsmp-3.5.0 | 1 
                       unknown | 1 
               blackbox-0.70.1 | 1 
                     lxc-0.9.0 | 1 
                 libevas-1.7.7 | 1 
                      icu-51.2 | 1 

Detail of failures
===================

      bfin |              alsa-utils-1.0.26 | NOK | http://autobuild.buildroot.net/results/4cca25e28f99e9b6d91c36912bb357f399fe3c61/
      mips |                blackbox-0.70.1 | NOK | http://autobuild.buildroot.net/results/a979cc079706be2012fb4b6c72894aca636adfb6/
   powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/dbc136eb391fc26c142e02caf8e730d7d04cb182/
       arc |              dmraid-1.0.0.rc15 | NOK | http://autobuild.buildroot.net/results/2bad0f18ed97c8c77c470d971467ae96c56023fb/
       arm |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/380f98146309d29f0595f5a8ccd793794d8b3ecf/
   powerpc |          dvb-apps-be76da69f250 | NOK | http://autobuild.buildroot.net/results/264b236f1bb35b2653e607417d0873a4d90efbe8/
      bfin |                     fbgrab-1.2 | NOK | http://autobuild.buildroot.net/results/329f5f00b1fe86a450340811443f6d52cdf3e6a2/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/aff2c3fe58e162591aa2eceb767cee7b50b43642/
    xtensa |                  ffmpeg-0.8.15 | NOK | http://autobuild.buildroot.net/results/be5edae5ea059c6a6f1f0d4cd73947315378535e/
microblaze |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/de546b0483a4f1dd8dd20dbcbfc6df896fd9166c/
microblaze |               gstreamer1-1.2.1 | NOK | http://autobuild.buildroot.net/results/d75ab42dcdaee85d2927f82699cc0676b247784c/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/d2164be441a211e07eaa84837aa77492352ededb/
      i686 |            imagemagick-6.8.7-9 | NOK | http://autobuild.buildroot.net/results/ffb851d84602282619457b5728aa216a7f75bdd1/
    xtensa |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/410885c4e8d8a1315776b555ade6d25b339e7724/
      bfin |                   libeet-1.7.7 | NOK | http://autobuild.buildroot.net/results/9e3233f531b5c4a35f15ead4aa796ea61833d02d/
      bfin |                  libevas-1.7.7 | NOK | http://autobuild.buildroot.net/results/b1be5b79fb465e6dbc3203be1fe535c0ee692e27/
    x86_64 |                 libsigc-2.2.11 | NOK | http://autobuild.buildroot.net/results/78b118311a720231932bba5a2f6fb6492a7b0c30/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/a85dc525ba602bc0aa677c9ede9e4630538743ab/
     nios2 |                      lxc-0.9.0 | NOK | http://autobuild.buildroot.net/results/811e5ecc5dffdd7b94fde3a0eedb0e315dc51190/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/64eff15eddaf470f813938f81942e07352b1adb9/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/12e491c444bf236633fe37c0ac1a3866ab42f75b/
    xtensa |                      m4-1.4.17 | NOK | http://autobuild.buildroot.net/results/e9b2e62867e9e9d3d5c4f581846cd3f1023717aa/
       arc |                  netsnmp-5.7.2 | NOK | http://autobuild.buildroot.net/results/28379567213bfc7df9f6d2c8792bf0df17e225ff/
      i686 |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/42182fc193ba9f8678a0b643acf7ba8915bbf0bf/
   powerpc |                     ola-0.8.32 | NOK | http://autobuild.buildroot.net/results/da8b9c79e9a9ca02e89693b0541d7ec2a251f6d0/
     avr32 |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/492659bc252395a62e62e6005ed0e86e582dcada/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/9d7e8ed902ea81a442e66eefad250c7d94531df0/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/f48f66b6e544e51f06a720fe6cccd540c073a5c0/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/7d5a1920fccf62152d53aba7fd60acfe6e190ca8/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/b671f57bbfe3609d59d30281c7ee931b5ebf3df1/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/79e4e0c94b833c247457d4839a46ff92a524f0bb/
       sh4 |             python-crc16-0.1.1 | NOK | http://autobuild.buildroot.net/results/50d984ed4dcaf36e4cb915bed01b54a3397344ff/
       arm |               python-pyasn-1.2 | NOK | http://autobuild.buildroot.net/results/ad30952c10a71b475bf8329ee3cd6ceba73ace90/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/6275802073dff715ed851408ca4d23bf5d723786/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/e994fc9d29801c79473193f551aca6195c60ae78/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/c4908f20082e5b0e9d050db38119ac6318c1d0fa/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/fea9645889d159ec718be55c9a065c7f7cb35804/
   powerpc |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/a88cf872152028dc8f0fd3f4a104505d072e3d05/
      i686 |            python-pycrypto-2.6 | NOK | http://autobuild.buildroot.net/results/7772619530923c8f33b565e7f41933884b33a0fe/
       arm |           qt5declarative-5.1.1 | NOK | http://autobuild.buildroot.net/results/ad4f1ab3bdee1ace47b1ce578cc45e0872655972/
      bfin |                   ramsmp-3.5.0 | NOK | http://autobuild.buildroot.net/results/bed2a5f65c582d30e3b273845206e8722f8c97b6/
       arc |                ruby-1.9.3-p484 | NOK | http://autobuild.buildroot.net/results/8c8d0e537920c48429c4026c2670418b23f529ac/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/35347576461d3f91b5d4ce5efdb8b44b0ce47695/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/f8c28bb408fb36a75de0a918a14698ff1682bc61/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6ac2a66c06ea526f21f1f4792e6b56fcdf7e6c26/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/62efff9b7f497887252323eef4e7e54c0ff1a077/
   powerpc |              util-linux-2.23.2 | NOK | http://autobuild.buildroot.net/results/3004e7b841a11d6f69c0bc7d52e894dc98ae3a2d/
    xtensa |                   zeromq-3.2.4 | NOK | http://autobuild.buildroot.net/results/e48511513257c40509dc1759321e6238ac1147fe/


-- 
http://autobuild.buildroot.net
