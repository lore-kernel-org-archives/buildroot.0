From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon,  6 Aug 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-05
Message-ID: <20180806060022.53A4D20794@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-05
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   0 |   0 |  30 |
   2018.05.x |  17 |   2 |   0 |  19 |
      master | 180 |  44 |   6 | 230 |
        next |  11 |   1 |   0 |  12 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 2 


Detail of failures
------------------

        i586 |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/6ae8a7ca3dd2d91d4988c947bfce8aba65287c0a |     
        or1k |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/79bcb547e1427959f97eaa78262f6dd79a64eca3 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.67.0 | 8 
             gnuradio-3.7.13.3 | 4 
                  polkit-0.105 | 4 
               azure-iot-sdk-c | 3 
                cgilua-5.2.1-1 | 3 
                    ncmpc-0.30 | 3 
                    brltty-5.5 | 2 
               domoticz-4.9700 | 2 
                libmpeg2-0.5.1 | 2 
                linux-firmware | 2 
linuxptp-303b08cbf55096aba5... | 2 
                  samba4-4.8.3 | 2 
                 wiringpi-2.46 | 2 
               aircrack-ng-1.3 | 1 
                cutelyst-2.5.1 | 1 
                    f2fs-tools | 1 
gstreamer1-editing-services... | 1 
         host-cryptsetup-2.0.3 | 1 
          host-waylandpp-0.2.3 | 1 
              mjpegtools-2.1.0 | 1 
               mono-5.12.0.226 | 1 
              python-pyqt5-5.7 | 1 
            qt5location-5.11.1 | 1 
           qt5serialbus-5.11.1 | 1 


Detail of failures
------------------

     powerpc |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/17d48f434c361a88f0599d1c6610db84d1f15308 |     
      mipsel |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/2f8e164fc1888ecc8e7e7b2781ffea7dd3e4d3a3 |     
        or1k |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/831d7b21cfab53b07c03ba194981a5c88fcba55b |     
         arm |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/e8760cc8ace1bc3f01654750f1d2928572e7d78b |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/24b1ca03e71511d2cbc05e3ed874e02faed69587 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5b98ede00337ae3ce717cc95a5a20fff0f9fc692 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/ee6fde59cbdad6c0467eb97378f189c6c0f8cb4c |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/a99d9262b45fb67eff670338931519de219ff78c |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/46c160c61415fa96554dcf6852ebbf6fc2a1798d |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7b9a30f216bcb18fec78a393571f5731049d852c |     
    mips64el |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/96b29f570661508b3a296624017182a60125f483 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/642cc7bdef322fd67647a0b296c04e5ce37dc36e |     
 powerpc64le |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/3bfa11c82afa7cb988dfe331764b780acb541c13 |     
 powerpc64le |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/7f150385d668dff82efcac06a90b424b1afd6784 |     
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/3cb34657904ad27bce728bfa1c9005ab8151902b | ORPH
         arm |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/21c74da4205c2be059dabb7c185627b04f80ce98 | ORPH
      x86_64 |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/d189dddf120c4d46db58cfeb7a2ddb9d29132724 | ORPH
         arc |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/fd78e54eca9e95ae5c7a27e6afa1891a0bf65994 |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/d0e9815c284ebe6fa9a1434dd7c43506cae53bf9 |     
    mips64el |                domoticz-4.9700 | NOK | http://autobuild.buildroot.net/results/eb372388f0c883b285c225b559226c37f076c14d |     
        i686 |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/ee5ae038dadc9baca040a9eae382c18128e3a261 |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/8c7ff6339c77f5bf6e8bc61e06b1846048c98ae0 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/73a895ac2b3b25e1ebb64f75130ba7f8af5bd410 |     
        or1k |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/23c94d325bc69c44f3f9b1d4f52847de0f4796c3 |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/69b03490d12aed4e88b42d97dc79c6d75cd25a3e |     
    mips64el | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/a24dd6b84916c21db5cc527a86e76484d9e222d6 |     
     powerpc |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/c48015f76b13fec38f650f66824e7b986eb28572 |     
         arc |           host-waylandpp-0.2.3 | NOK | http://autobuild.buildroot.net/results/4723b0e4856f0f053f1ceb7a2637dd2ac834fc61 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/116f9a95c19015d3c132dcda171d4618d442d9f6 | ORPH
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/f8c6196f91fb05012963cc0d7a6beebdc3910bfc | ORPH
     sparc64 |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/38f38d1c9436c31491bd761c90245600e2a4f6dd |     
     powerpc |                 linux-firmware | TIM | http://autobuild.buildroot.net/results/1eae3a0116be7b72abcef4162f013f0538656fe5 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/bed0418432ce332d44443bc339877c9312cd7426 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/bf400095a853f5beb28c77a50fcffefe52c3d769 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d0eab2e084570c85d64a4c6df7e2b363ae8a925e |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/a22773ca72c1d24c8ef2d7cfcea47b96213c418f |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/88efd22de44cc515b410331d30ec9a1b820357d1 |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/b0594e7bdedb33dd1a377e7aebd42c1034f6f020 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/0671eecab8f56b54fdba5d4155ce3a2589675bd4 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/4dce3d430be4f8999aef96e06b63c65ee40357c6 |     
microblazeel |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/ba5da960c70c765bee753a79b9ad2c10967d05d6 |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/d783e6db60b187aa591f4b0150c590ab3aa5252f |     
         arm |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/4a7f0cb2e3cb510da62ab94bff285e3cfbc3c481 |     
        i686 |               python-pyqt5-5.7 | NOK | http://autobuild.buildroot.net/results/1d79eaef2d6f246a591cfaa374a94dcdf19fa424 |     
      x86_64 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/089d03ab14a7c70e465cce891506a082049f2998 |     
         sh4 |            qt5serialbus-5.11.1 | NOK | http://autobuild.buildroot.net/results/fff8b961c53a6dc79a172dbfbcbd2415620b492f |     
     powerpc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/26ad25dda64a2ff148edcd80e304f4cb87e2450b |     
         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/4572e78c026c2db64b5ba2fcceff1b47881acffc |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/7d7271bcb14edfecd62e264d55ec6084a23b5047 |     
         arm |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/644b90fb8db2ea3f2057dc74876bc353f7a04416 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  samba4-4.8.3 | 1 


Detail of failures
------------------

         arc |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/cf3da652e0e9c981a5442bf84dca0e5ab9483584 |     


-- 
http://autobuild.buildroot.net
