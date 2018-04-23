From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 23 Apr 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-22
Message-ID: <20180423060018.3C313207CE@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  38 |   1 |   0 |  39 |
      master | 288 |  93 |   1 | 382 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                   flann-1.9.1 | 1 


Detail of failures
------------------

         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/188c391023a323f4938f23b067dd4b8581884c97 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 14
           libfreeimage-3.17.0 | 13
      gst1-plugins-ugly-1.12.4 | 10
               libglib2-2.56.1 | 9 
                   flann-1.9.1 | 6 
                  zeromq-4.2.5 | 5 
                  host-go-1.10 | 3 
               libupnpp-0.16.1 | 3 
              openblas-v0.2.20 | 3 
qt-webkit-kiosk-34efddb0bf0... | 3 
                     vlc-2.2.8 | 3 
                  check-0.11.0 | 2 
             expect-2014-05-02 | 2 
                  libkrb5-1.16 | 2 
                   libnl-3.4.0 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                   attr-2.4.47 | 1 
                cifs-utils-6.7 | 1 
                clamav-0.100.0 | 1 
           cups-filters-1.20.1 | 1 
             expect-legal-info | 1 
gst1-interpipe-10dba89eecc2... | 1 
                host-libsodium | 1 
            mesa3d-demos-8.4.0 | 1 
                 mplayer-1.3.0 | 1 
                   strace-4.21 | 1 
                  udftools-2.0 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/e8f3cf4840001144bdae42301d3b29630755dd76 |     
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/73d2144942d9c5302e2781bb380b63267bc7f070 | ORPH
         arc |                   check-0.11.0 | NOK | http://autobuild.buildroot.net/results/455d755e295c6c41f5be382eb02f611def4d9490 | ORPH
       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/da58dc7e7e3373cb6099a2057c806461bd9f093a |     
         arm |                 clamav-0.100.0 | NOK | http://autobuild.buildroot.net/results/4c464d26db66ccc9e481ae6a74a97a6ddb1a2c48 |     
     sparc64 |            cups-filters-1.20.1 | NOK | http://autobuild.buildroot.net/results/77d43b2b9faff6b13d8defb5b1f571a9e9f3bfa6 |     
     powerpc |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/6a058a8ccb31394ed7e21d73c916c9c8b40b8141 | ORPH
      mipsel |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/9b7a10e965791c427bda8c1b11c10f52e45657a2 | ORPH
      mipsel |              expect-legal-info | NOK | http://autobuild.buildroot.net/results/0efca7320db6fbbc7449bfc2442f265d860553f4 | ORPH
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ca58c4786fe987b4e66d8adfc4b2ad514e1e4415 |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/ac558a25c7d5b979664c923b440cd91218a751b1 |     
         arm |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/3b254539bdba4e3e621877d59e70fca8ec5545eb |     
         arc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1ec2c9fbdeaacf701ba56a559780414232c78f15 |     
      mipsel |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/0ca7042bffed92b01464d74d1e245cae3334ceda |     
     powerpc |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/1e4b544413ead36316742ba37dc3e5d562d4b74a |     
         sh4 | gst1-interpipe-10dba89eecc2... | NOK | http://autobuild.buildroot.net/results/931e7d28eac60eb7cdb72d1078f5d5c0a3d410ff |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/89b8f2d8a958f5901d4500c4c72527121010339c |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/c838e8eeb6c3490dedcc3fff1ac86a987d4d931c |     
    mips64el |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/931c5bbf3a143c86aff7509b96099ad7175984fd |     
   powerpc64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/f5e86e832d215f7b4439353b65a05a0d00db3c1d |     
        i586 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/87f2443eed484ebe7fdf2db7b0e1b30c2b71607c |     
       nios2 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/baff3dd86de9321ada8e64258d4f1971eb54af23 |     
         arc |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/36037acdfa2e9b6e48ef2220ac600c5070e38113 |     
   powerpc64 |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/6ea02fb1768004f5dc07b390ca47c2ff985c6421 |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/a638b289a9a21454d0b94e687510a538e79af40d |     
         arm |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/22a95baddc097542bd9800850fc560e780261f13 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/1534b4bd42673c07638b5a8065f71f8d60771f2b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/4b7d8114855f3afca388be345ead728e940a25b0 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5ca290ef83ead44d2822249b01e1ca544f546b96 | ORPH
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/fe2b3762b13a774ee53640596830e33ece0d39b6 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/3690afd8cb412cef83401b5a0b3abe1d52ff1649 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/08e2871469eb449b3d19bba735a999683a5809df |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f8535578322343fb8fdd125c37bf8dcb1917b507 |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/41ae2f2cd6122e98bdcc0e5db382018ea72c657f |     
   powerpc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/cad7ecaed3e693d94b0690029741cfa0cf86b924 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/eb96e34b233e0d108b0b95e4d9de95f6abfad428 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/adc646100de64049c4196097d3beecd034bcc3c9 |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6815abd68c9c938466cd035afbb9df191c5ff20d |     
 powerpc64le |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6a81cf331948e955d9af4dc1dd04d8214be1d8da |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/6a42d2b1c46e1e4cae08070428dd805e0ec56f00 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/231147c1f3a1486060b5679551214b723d078afb |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/7ecf5a6e365a4e7f73871e80efc698aef1ffb1b8 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/fc4d3177909b072afa7d81c03071aadc10c02864 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/279277eab9db866850bae86ac79ab35e49cc03df |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/3809e7cbb194426a5feabfd87e52acc8a6d56198 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/bacded990c7f64cc162eca6ffc471dc7780108d2 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/0433c23ad3b1c074247b24c7bc2ed78092175f62 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/b9bea07f3c76010a1871ce3fed6f547548d13fe0 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/cd11abbd96a6f69f83f9542ada7a36fed0deec56 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/664e7ee968e46b7ac0054ce4d5d4f9a82201550e |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/a8e7a728599689101adff22c8701a52ccec9e5d5 |     
        or1k |                libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/43c425b48bc7e17ef3411b7768855a633ecc0fe2 |     
     powerpc |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/78b9c6890bf6a7275b5e9de4df037ff0103f8d89 |     
        i686 |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/432d5d0295f77cd34b78e70e8b4b7d77ef19ae3c |     
         arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/0a72c04787f2bff45d6bb16f943244bf3e8f601d | ORPH
         arc |                    libnl-3.4.0 | NOK | http://autobuild.buildroot.net/results/b2562b05d397d4e1ffe0f8d2f4ce4c84ab6feae1 | ORPH
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/c97902cf3050e0e7e0fe534fdbba9b1dc81bb24e |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/fa7c397b9247c1621dff8ceffc4525fb451accf6 |     
         arm |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/2095d520ab8f1dc772900c03089d24ae3a675316 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1ea1e4d365fbbca7f472955466248aae77f54462 |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/24c924a5f371bcd79be553187778c3f1a758dba7 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cd746f6a6714df09f3bf5d32badcf6e835611195 |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3f95aa0ebd00ada840b8bced99715985ca9f14ef |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/b592c71e8862c4cac5cb741c824ab10a84127a4f |     
 powerpc64le |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/03ee95d16658183bed5a3c6064e1b4bd462b094b |     
         arc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5c9f17441e7ff28c3f76ebc5e33432fa69d543a6 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5bbe75a540c1baddd2bc596d1ced52b860e8d792 |     
      mipsel |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/262366901d54c2d1c950c87ad6c28ef88d4b02bc |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7a0503971771c378b5dc346e815c0dda4f4a8419 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7a8e0cf8ac1eb29c7b779d119a1d41705c50b7d9 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/1c6f87aee7145cb8f22759a9f30ad05b211b2843 |     
     aarch64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/dbff14316915cf52099cbfd57e7c26a926baa9c3 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2aac98615f215df6a15d3927b29686e415bd9e17 |     
         arm |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/adc31fdb6019e1bf9fb6f298af666834124f6e72 |     
         arc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/789c0da068b79ee8efefe0cf7c987f0b51f636fc |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/2f2c5e617f5e044717a60cac5d48a3076efa09a5 |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/bfdc5dad6c4351a183d75e6fdfa8d4d6927c8b24 |     
      x86_64 |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/c02bb15ca7450cf17eeaf729bd2ee74bfbbb4143 |     
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/d342706d411e9faeabd1059d0511cf97164e159a |     
      x86_64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/7d5749fd3cc2935a5acfcd311a6a87129add6ccb |     
         arm | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/2b2377b2ae3618931a1b4254f62fadcad9805dae |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/b1d48995c820a36eba1d6228277de7e9839bda0c |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/57cf0062495c22a54d37e3b4244853af20929532 |     
        m68k |                    strace-4.21 | NOK | http://autobuild.buildroot.net/results/befdcb3f87c0490cd623520403b9467ec7359950 |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/e77a96bd2a73c8255fd078022b11e8c47a4c712e |     
      xtensa |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/cb477f83693cca2abc96eff948ba4f14927e610c |     
         arm |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/909d4c1b4bf8b3135607025e12363db1b2196011 |     
    mips64el |                      vlc-2.2.8 | NOK | http://autobuild.buildroot.net/results/e0893a5f90cc53cb9f632771b4504e60e0df8a38 |     
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/537c11e7ee3af65d26f77eb29baff2ec0aeff95e |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/551d7b8ac3bf9b6653e46216ecc2b569e2e31ca8 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/9e613a03ebd098fdea83a0bc727d3c889116d475 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/b2c4a69fdfbe4b30b6485c6a8d86cbfcc431851f |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/c1a66b1f3c895938ca0f596dd4cfecb352827a4e |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/11e02ebf0585e146516f592f6ab22ddb0cd2e2e4 |     


-- 
http://autobuild.buildroot.net
