From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Aug 2013 08:30:04 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2013-08-04
Message-ID: <20130805063004.BAA0952C611@lolut.humanoidz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2013-08-04
===============================

        success : 104
       failures : 70 
       timeouts : 0  
          TOTAL : 174

Classification of failures by reason
====================================

              strongswan-5.0.4 | 6 
                 libffi-3.0.13 | 6 
                  ltrace-0.7.2 | 5 
                      qt-4.8.5 | 4 
               alsa-lib-1.0.26 | 3 
                  cppcms-1.0.3 | 3 
                 qt5base-5.0.2 | 2 
               libglib2-2.36.3 | 2 
                busybox-1.21.1 | 2 
                  zeromq-3.2.3 | 2 
                  boost-1.53.0 | 2 
               qt5webkit-5.0.2 | 2 
              e2fsprogs-1.42.8 | 1 
                  poco-1.4.6p1 | 1 
                   mdadm-3.2.6 | 1 
                  libusb-1.0.9 | 1 
                  ne10-88c18f0 | 1 
                  aespipe-2.4c | 1 
                  weston-1.1.0 | 1 
                 rt-tests-0.83 | 1 
               celt051-0.5.1.3 | 1 
               audiofile-0.3.6 | 1 
            host-mtools-4.0.18 | 1 
                    acl-2.2.52 | 1 
               binutils-2.21.1 | 1 
                      pv-1.4.6 | 1 
                 dropwatch-1.4 | 1 
           imagemagick-6.8.6-2 | 1 
                  webkit-1.9.6 | 1 
                   cups-1.3.11 | 1 
                poppler-0.22.3 | 1 
              ti-utils-06dbdb2 | 1 
             uclibc-0.9.33-arc | 1 
                     apr-1.4.6 | 1 
                   attr-2.4.47 | 1 
                  libxcb-1.8.1 | 1 
               ruby-1.9.3-p429 | 1 
          host-protobuf-c-0.15 | 1 
                      fbv-1.0b | 1 
             gdk-pixbuf-2.28.1 | 1 
               w_scan-20130331 | 1 
                      icu-51.2 | 1 
                directfb-1.6.3 | 1 

Detail of failures
===================

      bfin |                     acl-2.2.52 | NOK | http://autobuild.buildroot.net/results/038e0e944890283b713a029954985cc165f8c388/
       arm |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/72cbd14156760b4413a3d5012e73b276095c981f/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/4cafc3c67a3612263748975e4284839c0046925d/
    x86_64 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/5edc0b767d61f20166df5a8f5cbdf82007cb335e/
      bfin |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9039905f0373e072d432e72bbc2cfd3213ca8835/
       arm |                      apr-1.4.6 | NOK | http://autobuild.buildroot.net/results/773bd4ed060601d45afa7911a331153f0dc945a9/
       arm |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/d2926959f677c611c4a26a875a2072ffdaddc6d9/
    x86_64 |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/f10393cff566a35636b5db735dcd73fc2825facb/
    xtensa |                binutils-2.21.1 | NOK | http://autobuild.buildroot.net/results/063ef3ba354f14a9d264421a6fd19492d1c1f44d/
    x86_64 |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/0f6c2f99b05f57adb557c2ddd686b5072f5e9ecf/
      bfin |                   boost-1.53.0 | NOK | http://autobuild.buildroot.net/results/a359684624338cdfc51c86eecaa405e9fa79b4db/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/5eec1444830ed9778897ebf54004f637882c1073/
       arm |                 busybox-1.21.1 | NOK | http://autobuild.buildroot.net/results/66b4727585689b5b45e05b3875279b3e6d6f93b9/
  mips64el |                celt051-0.5.1.3 | NOK | http://autobuild.buildroot.net/results/76d8bcf4259163d8addfa64f944aa2ec5a8fc51c/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/5e426d9e372d0a9866706639b95a846dec86294d/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/d8caa942bad72f95ecc783dcd55235cda8db5627/
    x86_64 |                   cppcms-1.0.3 | NOK | http://autobuild.buildroot.net/results/43847c1495f4186d60e335abb11bf4c42e413754/
   aarch64 |                    cups-1.3.11 | NOK | http://autobuild.buildroot.net/results/8275d9f5175ce53b3566ad442131659354ad9b2c/
  mips64el |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/57fb0120b827b9ecacfae2c915010834cdc2dd7f/
  mips64el |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/17ec9610c50c4f18655d65e43617501cf52760c0/
      bfin |               e2fsprogs-1.42.8 | NOK | http://autobuild.buildroot.net/results/0693ead64c383817847268bbb8c5bfaa28f0235f/
      bfin |                       fbv-1.0b | NOK | http://autobuild.buildroot.net/results/c918046900045c34c73e16578026cce3e6bcccf8/
   aarch64 |              gdk-pixbuf-2.28.1 | NOK | http://autobuild.buildroot.net/results/0f88568531b3c7c67d44d829bb47364dad5cc49e/
       arm |             host-mtools-4.0.18 | NOK | http://autobuild.buildroot.net/results/047817aac2d52c3b280220c6d10e34f21900319e/
   powerpc |           host-protobuf-c-0.15 | NOK | http://autobuild.buildroot.net/results/7fd90040836e316ef169abfab7b755e465ad820a/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/81de008b1f2c778d9b8e7e7b47613f17e84b45d8/
   powerpc |            imagemagick-6.8.6-2 | NOK | http://autobuild.buildroot.net/results/cff6536469155ee09417588e0bf059dbff9f693f/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/d8a8dc48f8f880c87b81aa8530bd945c330eba5f/
      mips |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/21ab563c306003c13d1d826e8238e8472bfa9886/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/53ac4ee0c447664448dff8d2af0c5013ccffbf5e/
       arm |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/c9e4e95465b7b3b740f99d38c58275de0a169cea/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/36248d7e1581ab6f9771fe3a923d0f6ab72b7585/
  mips64el |                  libffi-3.0.13 | NOK | http://autobuild.buildroot.net/results/84a0ce8866e257588b0dd964e5d03a8c939a2fe8/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/3878861288e9df8f89d912b3270d62d9cbd3a09e/
microblaze |                libglib2-2.36.3 | NOK | http://autobuild.buildroot.net/results/b1eb93dde514d3ed188baf6176b537c3c189a502/
      bfin |                   libusb-1.0.9 | NOK | http://autobuild.buildroot.net/results/06e7b728a87d14cee8fd86b7e8e18b87793d40ea/
  mips64el |                   libxcb-1.8.1 | NOK | http://autobuild.buildroot.net/results/66a7f747e727bf9a427dead3058c4a6952ecc866/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/4e86e4bf4dc83b4cc43ecce576967267b0292928/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/f49a2086d79b1e26c164c22888f358e36abe07d6/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/caed77638e64fa318a46a4f654eb7b448abddfa1/
       arm |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/04a368663284f38055c7c3eed73e5e9ee10211d2/
   powerpc |                   ltrace-0.7.2 | NOK | http://autobuild.buildroot.net/results/ce74216e6759a60350d80e1b05b694c11b436728/
       arc |                    mdadm-3.2.6 | NOK | http://autobuild.buildroot.net/results/91c01c7bd051cc44f13838ab19a6681083ee8271/
       arm |                   ne10-88c18f0 | NOK | http://autobuild.buildroot.net/results/d24189ca4e9452f7e3e1257c01dae084a906509c/
      sh4a |                   poco-1.4.6p1 | NOK | http://autobuild.buildroot.net/results/e013e6ec0bfcc3dbc4e21fe1979990b71c8863a6/
   aarch64 |                 poppler-0.22.3 | NOK | http://autobuild.buildroot.net/results/dc9bfcfc10521356f02c2bda13fcd7759815102e/
    x86_64 |                       pv-1.4.6 | NOK | http://autobuild.buildroot.net/results/544b81ae1c2e9790fe7dd1376c08d62f0ac9dceb/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/19d0ee4b33b8e8abaf9a571c3323d2a7f47b1543/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/721aa0636db3eebb57b9fc581f5e1b02781ea7a0/
   powerpc |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/f116e5995cbf553a3187b25769180af0a700639d/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/cf81cddfcbdccd3ef790d585993ed3865b7f4f87/
       arm |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c4f689e4efebd38a9605a60122ad51b9d3ebcee8/
    mipsel |                  qt5base-5.0.2 | NOK | http://autobuild.buildroot.net/results/c0aa318793918d86a88126da80fa71d17a908c30/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/106a334b69354e9d4b007a9ed363a6a750ecbe6c/
       arm |                qt5webkit-5.0.2 | NOK | http://autobuild.buildroot.net/results/4713b5c9b33b2da601d839c444e286b90e43d1dd/
    mipsel |                  rt-tests-0.83 | NOK | http://autobuild.buildroot.net/results/991c89fcd21f40ecbe88bfd8e0694ee64dec816a/
      sh4a |                ruby-1.9.3-p429 | NOK | http://autobuild.buildroot.net/results/158bf23d11120eccd0ec4b51a8f612b2c061c46b/
      i686 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/643f5b33973d5b12ffe6d84254bf3be9ed81d0ad/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/24bcdcb83119e416c92458fa9ff2f5269957a743/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/6401c03e7f680b8dbd7755f152d25261fee21273/
   powerpc |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/618ef0a99730e5176ac5fc55defc3bf4988621cd/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/1ab7affaae039ef1b601863b4a02f89760379031/
    x86_64 |               strongswan-5.0.4 | NOK | http://autobuild.buildroot.net/results/5e1f13f3d8695cc33f760dc2804559f6515e80e4/
       arc |               ti-utils-06dbdb2 | NOK | http://autobuild.buildroot.net/results/6fcd5321c9bf4ed70ac79b50362912bed69c3141/
       arc |              uclibc-0.9.33-arc | NOK | http://autobuild.buildroot.net/results/fe383d377137bb9670e701c7f828eca3754ff19b/
    mipsel |                   webkit-1.9.6 | NOK | http://autobuild.buildroot.net/results/71a42579b85c8f4503d36548a85abb094ad0a483/
       arm |                   weston-1.1.0 | NOK | http://autobuild.buildroot.net/results/9afd8f2d9dd5457b3f6caff390ce2ec2476148ba/
   powerpc |                w_scan-20130331 | NOK | http://autobuild.buildroot.net/results/a5ca9a5987852bb1737110e7f2cfdc32d993891b/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/51aa81e6aae7c33b96d3c3ad90d3bcff03959e73/
     avr32 |                   zeromq-3.2.3 | NOK | http://autobuild.buildroot.net/results/645b357d470b75baa9a93eb5be4f1dc5c8c337fa/


-- 
http://autobuild.buildroot.net
