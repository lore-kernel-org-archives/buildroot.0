From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  5 Aug 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-04
Message-ID: <20180805060022.2DF08207A8@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  19 |   2 |   2 |  23 |
   2018.05.x |  22 |   0 |   0 |  22 |
      master | 171 |  58 |   2 | 231 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                host-libsodium | 1 
                        libnss | 1 
                 mplayer-1.3.0 | 1 
                    owfs-3.2p1 | 1 


Detail of failures
------------------

      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/42501e7a3fe5b755bb1b2e3c18fd30facee30ba2 |     
microblazeel |                         libnss | TIM | http://autobuild.buildroot.net/results/f00cfedb0201fa8724332f0c0b9812409775367f |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2f2575f90bbd0e2e1389ec45d6e83260c79b1587 |     
     powerpc |                     owfs-3.2p1 | NOK | http://autobuild.buildroot.net/results/6290cff1cff560b6d184bd183f07b6a988e2c8a7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  polkit-0.105 | 10
             gnuradio-3.7.13.3 | 9 
                  boost-1.67.0 | 7 
               aircrack-ng-1.3 | 4 
                    ncmpc-0.30 | 4 
                 copas-2.0.2-1 | 3 
                qt5base-5.11.1 | 3 
                  samba4-4.8.3 | 3 
                  mender-1.4.0 | 2 
               mono-5.12.0.226 | 2 
               azure-iot-sdk-c | 1 
                cgilua-5.2.1-1 | 1 
                    f2fs-tools | 1 
         host-cryptsetup-2.0.3 | 1 
             host-guile-2.0.14 | 1 
                libmpeg2-0.5.1 | 1 
linuxptp-303b08cbf55096aba5... | 1 
                 opencv3-3.4.2 | 1 
          openpowerlink-V2.7.0 | 1 
                   qemu-2.10.2 | 1 
                 qt5base-5.6.3 | 1 
                 wiringpi-2.46 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/317bd7d3bba001ad4c8b548fb082e86b51c36a50 |     
        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/21a40f65dd8d2abd03467471a59c58ee86c2fcb3 |     
     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/018204e4dbfb7edcf587a4d15966e0bacdce795d |     
        i586 |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/446a2dacfc825a6309517b8d9973ff16a27a7e47 |     
         arm |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/037ad856a1d36be271ecead4113d4f0a1cd835d4 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/86fe918e85d8a11d6a94f0585da8fdca190e9889 |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/51da3b521a556aab73c76f3953791d1b811e6e1a |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/755620939897e9ae62a964dbb43c5840d3dd4dcb |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/9d17e46d489f4d8dd4602195edc549ec1111d9c1 |     
        m68k |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/3352b184c72049704e4030e65e2cadd78d693449 |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/76e376e303dd5b02105ccdbc98be51ef341fd7a2 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8d22ed8fc628628ce0537e08271f7dd13729d403 |     
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/2f9e0e232c39764eccd47713d12f9111c6f6ed57 | ORPH
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/bdef702f33a5c3ee068447cacfe4f87fd3658c33 | ORPH
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/e78954c879b9686045ae5d9528f0157a20d7c21b | ORPH
         arm |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/d1fcb57ddeb39204e01e8617427e3ecb3a047b3f | ORPH
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/b7f6342954a5de07e9857dde756073af518a3164 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4688034f7623b33350349483e9724d9f6ed8264d |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/4a2d3794cd0015604abf03ad1400424e86ff8448 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b17ce6b8009f1edbe8945a7104d904dd18a186a9 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/55f4216919ec6b9c0dd66b76947c4094e70a2b21 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/70a809e4ef9d91dd9b8f44e6a24a4af965da09f1 |     
      mipsel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/29d689943fb05d230434ab48562e2679ca8ebd69 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/02d8c00235a61ab796113350e69c9d4226950d54 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/90aa39f0c9d16acacd8a3fee715b4d052cfbe490 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8eb6cfb08af197d4d4b1a32fb5682f82a74752a3 |     
      mipsel |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/be621f71bf9da8719bf7fc943eccc9b4dc2cc43e |     
    mips64el |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/f24c346e655d05023779afc47ad889dc890e5f15 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/1b8a7af92b221ce32a1926c79823529b45127bda | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/cb6eb801b955b6663c70407d673d86157b5248e9 |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/5fd83100127328be380772054d46961916aaec4a |     
 powerpc64le |                   mender-1.4.0 | NOK | http://autobuild.buildroot.net/results/2b5904aba3a4dd37c7c53e8eea46f2a6abd1aa98 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/cbacb5bb0d5e6272931f8f7f66a40a09c523d754 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/b402af8cb7f00dc2e69c219926b474a8e0c8d372 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/ccd77e3a7c98450c468f83b6d0f2e7cfb49b6cce |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/ad13c6ba6923611238284589762c04c4a52f4d16 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/6f48ef00ce001e0c9a314f0eba978ea5f3b04960 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/7952b2e10163169b53c62761854531caea7f4435 |     
       nios2 |                  opencv3-3.4.2 | NOK | http://autobuild.buildroot.net/results/10cef6eb68274e5bd98093cca3b63870f98e86df |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/261aea7eee602335626bc8cbd9ec57f79b8cbbc8 |     
         arc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/62fc1d2aa9b4b38dd17f37d73f41bbb8b6e67485 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/181bc0f035b334e2fbe7ea221f7f32856b8fb53e |     
         arc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/e1a06f6144f1f985c4f7e68e4f50c78e42ceb6ec |     
         arc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/f3b63803635016e5b9887e05e7eb3fa143144079 |     
microblazeel |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/9671c1a0721d1c99804c4a8ad92f6928f7eb54e2 |     
         sh4 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/321d7f6e342e7e16bb82085fc2df4f19552eb39d |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/06b9724f5fad703ddeb71e493cab5b599c025625 |     
         sh4 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/7199676a2556f0a3733fe3597e7940b1ce52a5c9 |     
      x86_64 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/15ed30501915fb03a82980ca1cd3374f79c58254 |     
         arc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/3e2f602f8858aed294e4f1d48bf50f95a6410479 |     
     aarch64 |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/6134d6f6df8846d912cbde43a3e968753847ea7e |     
         arm |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/9f9e66a41f016d8c5b06f992f3f6438fbb67105e |     
        i686 |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/8c5426fb484e4e41d39cfe67cdfd0c36f1b0be3d |     
  aarch64_be |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/9649b4fba6c466916592aebade187a91e5ea62c3 |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/9892fcb66c193290b1f9ad62f9643743d38f1693 |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/9188530d80f7bb8edc1394f3e9ad60806279f698 |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/7235cd53dd2eae02b9c25724da8e0ef2c789af3c |     
    mips64el |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/8638d46e51333209c264fe3f21d9cf04602522f7 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/77dbc33ed88c43d40d61fe29253534046b310dc8 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/71fb1e60e2c676f37502921ee851bd2d8555a9e3 |     


-- 
http://autobuild.buildroot.net
