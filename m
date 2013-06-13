From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Jun 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-06-12
Message-ID: <20130613063004.E71CB52C0F3@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-06-12
===============================

        success : 97 
       failures : 92 
       timeouts : 1  
          TOTAL : 190

Classification of failures by reason
====================================

        host-dosfstools-3.0.18 | 12
            host-erlang-R15B01 | 11
                host-gmp-5.1.2 | 8 
                sqlite-3071700 | 7 
          host-protobuf-c-0.15 | 3 
               libglib2-2.36.1 | 3 
               qt5webkit-5.0.2 | 3 
                  imlib2-1.4.5 | 2 
               sconeserver-211 | 2 
                host-m4-1.4.16 | 2 
                   mplayer-1.1 | 2 
               alsa-lib-1.0.26 | 2 
                directfb-1.6.3 | 2 
                   expat-2.1.0 | 1 
                oprofile-0.9.8 | 1 
                openssl-1.0.1e | 1 
                       kmod-13 | 1 
                     gd-2.0.35 | 1 
              opus-tools-0.1.6 | 1 
       rm -rf /home/test/test/ | 1 
             gdk-pixbuf-2.28.1 | 1 
                 qt5base-5.0.2 | 1 
                  unionfs-0.26 | 1 
                  ne10-88c18f0 | 1 
                libcurl-7.28.1 | 1 
                libtirpc-0.2.2 | 1 
                  libv4l-0.8.9 | 1 
                 rt-tests-0.83 | 1 
media-ctl-ac40b79f002a2315f... | 1 
                      gpsd-3.9 | 1 
               libsigsegv-2.10 | 1 
        ltp-testsuite-20130109 | 1 
                 libnspr-4.9.6 | 1 
               pcsc-lite-1.8.6 | 1 
                   dbus-1.4.24 | 1 
                busybox-1.21.0 | 1 
             util-linux-2.22.2 | 1 
               aircrack-ng-1.1 | 1 
                      bash-4.2 | 1 
                  zeromq-3.2.3 | 1 
               libgtk2-2.24.18 | 1 
make[2]: Leaving directory ... | 1 
                  iozone-3_414 | 1 
                      qt-4.8.4 | 1 
                   cups-1.3.11 | 1 
    enlightenment-0.17.0-omega | 1 
           heirloom-mailx-12.5 | 1 

Detail of failures
===================

       arc |                aircrack-ng-1.1 | NOK | http://autobuild.buildroot.net/results/8c11bde8489ac92f91449b0383c934af5f96c9a0/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/8ad5d8fecaefdc4be9428f2a04dc5650cdb0c716/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/c88974bbcc2cbc871c105d150196bcdc0ba66caa/
      i586 |                       bash-4.2 | NOK | http://autobuild.buildroot.net/results/e800043c22fdd5b8d6f31e2bd4ebb612a1fc7aec/
       arc |                 busybox-1.21.0 | NOK | http://autobuild.buildroot.net/results/d1de26c1f724dab50481370897c311a592fe568f/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/ed3b8a014957ddbfeb568aedbc0a2db619e683c1/
    x86_64 |                    dbus-1.4.24 | NOK | http://autobuild.buildroot.net/results/3b7195306e1e0c4632674958859cad4aeb55d496/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/2e346578bffecf6e24d3a27e141e114cf0e09604/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/27d870f65a190722004bad277fd82c817944db3a/
   powerpc |     enlightenment-0.17.0-omega | NOK | http://autobuild.buildroot.net/results/ef2e8c115cd543e4c463b6f972cf3dc0528f1f0e/
      i586 |                    expat-2.1.0 | NOK | http://autobuild.buildroot.net/results/2f71cab965ef30304495d4f1ab856acc8ce8011e/
      i586 |                      gd-2.0.35 | NOK | http://autobuild.buildroot.net/results/b685918fd5eb70e9ded0227930a62d60e51e091c/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/ac4078255e05c78aab2a4c873e7a51c4e04e5cd7/
    x86_64 |                       gpsd-3.9 | NOK | http://autobuild.buildroot.net/results/c31acd25967b6e92053d42b127eeebcdd4b658eb/
   powerpc |            heirloom-mailx-12.5 | NOK | http://autobuild.buildroot.net/results/e2c636a27a9029f241ee33342909f8b0beb3b8fd/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/20b3c178e45cca02feabf23cde52532462a2335b/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/80b4c39663ef1e7f18f86b28d8b229c5887e2e57/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/250bc1bc8f8fd4d93c7a1b4f9c8d015901354445/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/8d3a032822f06a570bd42573a39f0ee3f7669b49/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/ae4a14128381eb52289149d441bdb4babbbdd821/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/9835967cf6c2c87ea6259fde4a3202abe85bdb79/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/8d43520f66b940943fa727573f8881b095c1cea7/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/a04cfceac895755984a5939f1c437ab27ffeada5/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/229fdbc2fd65f62dcb548bac6315dd629e4563a1/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/a60ab7b8945fc852aadbc1f8acfadf503755bc56/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/c7f7205641ce1ea7a63fba92d15e782c8440fc40/
      i586 |         host-dosfstools-3.0.18 | NOK | http://autobuild.buildroot.net/results/fe5e48f04f6ff03cd0d1aab4fd00a8904284360b/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/7b8cd9650391aaea524448f21c067d020fd7ba6f/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/520e60d45bdc4f786c89ab28ac0eee1cf4e4e89b/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/be3b8297a40ce1032305699484f689f0fb7b9bf5/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/95a605f35532728fd10e4016ce63814ccfcf87e4/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/56503ce7259737af6638dc56beab3668fd432445/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/391421151d8d014c8e8aba50b0ae7b0cae1182e9/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/e11278a636d29962aa5e183856a7cac94d4c4cf4/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/44c368fd8276fd6ff3f3ebef2f0ba980ff390a40/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/8b756f6481aca20e8c3263bd32cdc07fcda50f14/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/3984e115936856836f0cad4a82b549b29cb223e9/
      i586 |             host-erlang-R15B01 | NOK | http://autobuild.buildroot.net/results/ce963160b52a2c07185b16d760383b3f127ebae3/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/1691e13873ebca6b9bc56840df02ac1eddf1edc0/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/f09edf4e7e82a022e78e24f7b4145ab7dc0394a4/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/ade38ef7a30a9e34c226d743fb73a978e1fe6d7c/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/f283e16d8ead220a83f7deab666d16acb70ab91e/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/843f3a929165e0a69bdb016318b25269557fb57e/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/5b41ccfe5a87ce179b41fd8efee78ccab669698f/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/56578710b09b712be33b1e2c503be6c5a44a8fc4/
      i586 |                 host-gmp-5.1.2 | NOK | http://autobuild.buildroot.net/results/468aa887dd5e60193526edcf8cacba3b1a65b347/
      i586 |                 host-m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/a74a65075217613eab7a784a699dd3e8d4838a0c/
      i586 |                 host-m4-1.4.16 | NOK | http://autobuild.buildroot.net/results/48afc10107e2d22bb756957b1135104083c14029/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/b0958b9807590bd2fa563d66f7facaabb1d44f5d/
      mips |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/5b14768d82d59a81eff25fd8a6c88aa65c0489fe/
       arm |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/91ec1185c141a59e357ad7a10e471023b31aea79/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/324931eddf9e4f7f4cab61b6d8bdf4a9823f7d8b/
    x86_64 |                   imlib2-1.4.5 | NOK | http://autobuild.buildroot.net/results/212af4049b72daf8b9439cafb576c74cccc52379/
    x86_64 |                   iozone-3_414 | NOK | http://autobuild.buildroot.net/results/19f606f2978dc3c8039b1bccfcc562b4050083c7/
    xtensa |                        kmod-13 | NOK | http://autobuild.buildroot.net/results/b2894e2a7963e05d6db0f2a4c2dfd3c1ce398e02/
      i586 |                 libcurl-7.28.1 | NOK | http://autobuild.buildroot.net/results/2e2e87062d182b12a362b6b48b63ef70908b0be1/
      bfin |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/67fba6d5cfbe4970e6b559e1fbb63197a1ef7028/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/5f8165b1359795e8ae37cfa7036742660168cbd9/
       arm |                libglib2-2.36.1 | NOK | http://autobuild.buildroot.net/results/ce36d86ec55ef56078b73f8b5d97c38be1fa5d66/
       arm |                libgtk2-2.24.18 | NOK | http://autobuild.buildroot.net/results/d3f95a029356e013fc94f72006e0fb3bf691f8fc/
    xtensa |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/7d0119ac1e6a7f27cc0412e93d9bc526f7584e1f/
   aarch64 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/06cf43420ae968b6886110c5dfa81ce76a6b3cb2/
       arm |                 libtirpc-0.2.2 | NOK | http://autobuild.buildroot.net/results/414b7ce5e62dc3e9759b9c05b6d12cdc07d7586c/
   aarch64 |                   libv4l-0.8.9 | NOK | http://autobuild.buildroot.net/results/daf8d9a349e7814ce9d969023702adc7b590fa0d/
   aarch64 |         ltp-testsuite-20130109 | NOK | http://autobuild.buildroot.net/results/51dc8d8f454e4bc6c18331405f086995b272e87b/
       arm | make[2]: Leaving directory ... | NOK | http://autobuild.buildroot.net/results/8a7ead7e00ba9b15b445022ddd4cad285aa7a5db/
   powerpc | media-ctl-ac40b79f002a2315f... | NOK | http://autobuild.buildroot.net/results/b9099754c3e1d3b5ff17a6621e214a4b038145ad/
    x86_64 |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/022cb75f5e18d35c071ee727dcd92f7f6b07e3c1/
       arm |                    mplayer-1.1 | NOK | http://autobuild.buildroot.net/results/c0e8ea0d30e81dbaca490a78926eb6a6ff9d8f5f/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/4553c9cc52140bdd5628148006355d1d63a3cf50/
microblaze |                 openssl-1.0.1e | NOK | http://autobuild.buildroot.net/results/4d6098189ff87c85c62499df885946aac707a15c/
    xtensa |                 oprofile-0.9.8 | NOK | http://autobuild.buildroot.net/results/55e9f430606b8a7adbeabf2df1f2910c4f9b10fb/
      i586 |               opus-tools-0.1.6 | NOK | http://autobuild.buildroot.net/results/f26dcf36934ca4ded5ba2f9e5da7d17ab1cd0c53/
       arc |                pcsc-lite-1.8.6 | NOK | http://autobuild.buildroot.net/results/c10aaf4acc07c9a3efbd186361ea84bf06b2182a/
   powerpc |                       qt-4.8.4 | NOK | http://autobuild.buildroot.net/results/08701adb41f3df733845c83b0cf2a1a8da7e5d62/
   powerpc |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/efefe883ad5b58f75175a5c9866d9ea16155ae8a/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/925771659b21807a3dd996acb9ce55f3125faace/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/0a65f24120409f23c27f626d3b9b3ade39300703/
   powerpc |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/de8fc3c4f0f5a7db9f51804443e3c551d535bdd2/
      sh4a |        rm -rf /home/test/test/ | TIM | http://autobuild.buildroot.net/results/cc256aafd91c9956519ad02139258ddefc5a9724/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/99382e4a267e13420ea1c1649e2bfdb96eb7307a/
       arm |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/cd761e9bf01e4de65aa5ed9e0d79e96ada03af1a/
      i686 |                sconeserver-211 | NOK | http://autobuild.buildroot.net/results/448e182e234fbc396dd263a03d48bce62b6c584d/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/8dc28a048fe8b17d4d5f0788e6e306b88a9c01ab/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/528216a27667d3f3fc6c1c71b8bae5db9c680be0/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/d8d5de7fad8b43fbd98b9d19a304c40a4645a8c9/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/dcbd0f9fd0bbcb155f6543f8546708bad1da5fc8/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/5704a0f7a30c2c0294f9f9c6f832252173bfa263/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/b127257348b0a934bee8780d17f40856d167a61d/
      i586 |                 sqlite-3071700 | NOK | http://autobuild.buildroot.net/results/56acb7a588d1d81e00cd5257ab2dcd0789745e01/
       arc |                   unionfs-0.26 | NOK | http://autobuild.buildroot.net/results/7b859e98df9d209cf2a87e5f64d9e673db6bd5b8/
       arc |              util-linux-2.22.2 | NOK | http://autobuild.buildroot.net/results/1546ba7aafe2e3bc1bca3eb4fe38dcd5f2da61d7/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/d361eaf5277b3ab7751d118166c15b4ff223c17a/


-- 
http://autobuild.buildroot.net
