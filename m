From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 27 May 2018 08:00:12 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-26
Message-ID: <20180527060012.C01472073D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   2 |   0 |  13 |
      master | 203 |  29 |   3 | 235 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-cmake-3.8.2 | 1 
                   libnss-3.33 | 1 


Detail of failures
------------------

      mipsel |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/62b7fade1f9521c717b817ff921e0f9e75fa69c8 |     
        i686 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/6686559d959595691c11c7a3d138675d954e1073 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    quota-4.01 | 7 
                  autofs-5.1.4 | 5 
                  samba4-4.8.1 | 4 
                     php-7.2.5 | 2 
qt-webkit-kiosk-34efddb0bf0... | 2 
                       unknown | 2 
                host-libsodium | 1 
           host-protobuf-3.4.1 | 1 
                    links-2.14 | 1 
               log4cplus-2.0.0 | 1 
openvmtools-5a9033ddfa95786... | 1 
                   qt53d-5.6.3 | 1 
             qt5location-5.6.3 | 1 
             qt5wayland-5.10.1 | 1 
          usb_modeswitch-2.5.2 | 1 
                      x265-2.7 | 1 


Detail of failures
------------------

microblazeel |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/899670d0075b6c27b21f468dffd7297b315f2bca |     
     aarch64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/6e4edd5d26b0844b141f5b86b63e0204ef103e1b |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/37cc487fbf7b910337402ac905b582545359df58 |     
    mips64el |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/7c92df6a81b74d0a62e8be5011dc84ba6dc950cb |     
         arm |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/5c976a47a44bb8bc7ccedee409cfc3278a2d8a8e |     
        i686 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/706786c6b8d6b0e26998e09cc414eac6ada948ce |     
         arm |            host-protobuf-3.4.1 | NOK | http://autobuild.buildroot.net/results/a69e0d63b40133d109d46904f8f6b4288c381e27 |     
     powerpc |                     links-2.14 | NOK | http://autobuild.buildroot.net/results/034d98fa2823c15739662eae7c90bc056c9c2cd2 | ORPH
     powerpc |                log4cplus-2.0.0 | NOK | http://autobuild.buildroot.net/results/46b56d7b082335c1473dc094e0e0bd812b8d42bf |     
      x86_64 | openvmtools-5a9033ddfa95786... | NOK | http://autobuild.buildroot.net/results/7f42bf59aa942487919671abdd6f9b87e7e0b063 |     
         arc |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/24e6ecf763b252fcc1f3ea2d65fd03c4218355c1 | ORPH
         arm |                      php-7.2.5 | NOK | http://autobuild.buildroot.net/results/024539c2076ac5c93896c19a311e3fe0deaa33b2 | ORPH
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/e34b7d4e5f03b1d1a3fcff08e8ee718c6c61991d |     
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/7f65d9898d4c1ae438b124a787cdda19e2019ad0 |     
         arm |                    qt53d-5.6.3 | NOK | http://autobuild.buildroot.net/results/0ff5eaf91da16ad06c1542fb6a0f20847d4684f5 |     
     powerpc |              qt5location-5.6.3 | NOK | http://autobuild.buildroot.net/results/b17dd6921c5b1f3560d065d3baac4d651d9aea54 |     
         arm |              qt5wayland-5.10.1 | NOK | http://autobuild.buildroot.net/results/1b0e51d1b38c6ce6c6eb287fdd463288baad2465 |     
      mipsel |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/c93d8edacd8e3f80acb52c7cf43bdad59493d4e9 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/8d8800b3deb7e304fdd5103b4fad38ba0c44c931 |     
         arm |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/7467fc501de7951f167aa05ec476b6967c47de28 |     
         arc |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/2f2f84476433299d295eb2473cdb85dd1d494dcf |     
        mips |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/0f9b172d52a0c873acb52e649df32e5260b324e8 |     
 powerpc64le |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/d0303af0a3fa404ad68b579a984ec9dfdbfd486d |     
 powerpc64le |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/ec52e9826b14c8f1d41900a38e9fcdb83abf812b |     
      x86_64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/f734f40275db6757a213bbba1d47c1e928d0b09e |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/e565df39307f64efe2e72921b1deab5ccd9b3b31 |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/fa6939cb6e07cafa8d7512a1d0afcd43ce623141 |     
        mips |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/4c33ab6c292107fc49ed9376ba09b94f0d94bd03 |     
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/5bb3c1a0be4836d99fcc533b115eb921ef700ff2 |     
      x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/23d1034b33d0354de15de2ec4a8ccd0603e8db78 |     
microblazeel |           usb_modeswitch-2.5.2 | NOK | http://autobuild.buildroot.net/results/d264530ba27808a237a901ce2feb863a16e3e410 | ORPH
         arm |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/f02703c41c00bae376df55c16292b14cbc29ac07 |     


-- 
http://autobuild.buildroot.net
