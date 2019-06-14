From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Jun 2019 06:00:50 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-13
Message-ID: <20190614060058.A3C938785E@whitealder.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  21 |   1 |   0 |  22 |
   2019.05.x |  19 |   2 |   0 |  21 |
      master | 181 |  50 |   0 | 231 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

   host-xapp_mkfontscale-1.1.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

   powerpc64 |    host-xapp_mkfontscale-1.1.3 | NOK | http://autobuild.buildroot.net/results/a82f542329cab4bd546b5fdc6e2328b8d443d222 |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/d3ffdbf753f3bcc31623ed78a925e24f7c579285 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               libglib2-2.60.3 | 24
          modem-manager-1.10.0 | 11
                   cups-2.2.10 | 3 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
              domoticz-4.10717 | 1 
                    efl-1.22.2 | 1 
fs/tar/tar.mk:32: /home/mar... | 1 
                      gzip-1.9 | 1 
           host-mfgtools-v0.02 | 1 
           host-nodejs-10.15.3 | 1 
libcamera-ab0188fc8bbb6f397... | 1 
               libgtk3-3.22.30 | 1 
              qt5enginio-1.6.3 | 1 
               wireshark-3.0.2 | 1 


Detail of failures
------------------

    mips64el |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/8bcec1c7c4a6bb0dcca6f4e8b6df2d0e57f72091 |     
         arm |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/83b5ada17d8178788d53bf13060c19b8608204b1 |     
     riscv64 |                    cups-2.2.10 | NOK | http://autobuild.buildroot.net/results/84fde1ecd700360ac32945299152ddbaf7563549 |     
         sh4 |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/828c5a684f223036795f97b1524c19f1d26fd3d0 |     
         arm |                     efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/c19152ac2168803d93d9f58faea306ca8e59b074 |     
     riscv64 | fs/tar/tar.mk:32: /home/mar... | NOK | http://autobuild.buildroot.net/results/2e5a9dfc6907e9ddc6952d3482e7b09864b615f0 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/c3b0f45ceabfa52b4545b1543b2a03769261a358 | ORPH
         arm |            host-mfgtools-v0.02 | NOK | http://autobuild.buildroot.net/results/4cdcb418b251c192b4a0f84801c41ed35e3c1426 |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/52fd072a2bd7122e0d89ed80b82bf2e2f3303012 |     
      x86_64 | libcamera-ab0188fc8bbb6f397... | NOK | http://autobuild.buildroot.net/results/f6dd4c60c04892c8b1669e6000fce7edb2b6349e |     
         arc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/dbcad97764d6da31b918c43d50e78b2ff2bb05cf |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/af4e4703cf35229bd682ebe093c7a60b4b6d5357 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/e5445d76b8091bc334de530e2ecd5d4a63c01d00 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5db3458aeed95686a9ea795ffc4782118d3ce4e6 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d76290808f9a669d471be184ffc6580d2ec9d2e6 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/39aa3e5062e6364dab7b29e41871b815bbd27166 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/27c2fa27435982b0ff1ca6fac471544566e935ff |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/65d162d4b17d455c5ab0158bbf710f078779cb5c |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/34cff714968d56975de18d6e9d1d1eea03cd7acc |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/99008d03bf011699b7e0fab101891af810ba3c41 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/306c43f554bc539befe5b94c43721caae20a92d3 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/5a458774665a937792d9ab3642d275183d3358bf |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/58c36eaf9e86a699f03528e37a60d71b70da2867 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/308384ec5642de7b2fda4533983c0a6d0ae56ec0 |     
        i686 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/d55a09a1ff1543f6fd5d9f4023067983252d25ac |     
      x86_64 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/223f6f4751692acf0d2868c34d1f809fc086adc0 |     
       sparc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/c01e4f28422591180726ac355de7241211dec859 |     
         arm |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/f55a7b44903b71f445ace68f45fecf683c46681f |     
    mips64el |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/b63615c542c45fa66cc708afa7718319ddf774d1 |     
      mipsel |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/0767a709199cb1b3f8d426a89cbe11c913dacac8 |     
     powerpc |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/a2447419573c77423986e805c679838968bdca3f |     
        or1k |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/7ce2b96f4e6dbc4d16998d9b2f8244c7ed885ea8 |     
         sh4 |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/9fab8efaaaa054e139020c0016aff14bc88503b1 |     
      xtensa |                libglib2-2.60.3 | NOK | http://autobuild.buildroot.net/results/1f65c271cd3c8a237431a5080d8cf38bf4de29a4 |     
         arc |                libgtk3-3.22.30 | NOK | http://autobuild.buildroot.net/results/508f09e02232dbeb89bd88828dbe93ef70f310e0 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/57bda3f234b601e40cc0f34a7af2c40812a86721 |     
microblazeel |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/635676264c6d6c755d1726a0dea8f416d96d7a3d |     
      xtensa |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/7b6989839a122350770a6962f1291a8582c3330c |     
       nios2 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/e1aaf6fab1e4851362997737e8612a74e750c2fc |     
 powerpc64le |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/092096369172dc109cebcbbd3a1c92e52d80efb2 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/f8bd36fc9e509d4e400c39e84e6d6154d8d82d63 |     
         arm |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/33744247280d615c27ac2f1d376cabad0534c998 |     
       sparc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/6c8e3373f2f4031eb42d6a757a7f5bab40034d04 |     
     aarch64 |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/c0a33f4b692c1c158e950ae1587adf09376c213e |     
    mips64el |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/2c982ce92da80a52a7dd9383fae6290c04663c61 |     
         arc |           modem-manager-1.10.0 | NOK | http://autobuild.buildroot.net/results/01d7e0fff7c5c371240c4619e2f7a5e2ad58c1f4 |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/fdac041e9ae24422059e647d3fae2446e2196106 |     
     riscv32 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/4712c6931ca728ceffeac9ecc12279c3e415cb03 |     
     sparc64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c6ec11d10ae9a35221e7f9bf1f9b76b01f407c44 |     
         arm |                wireshark-3.0.2 | NOK | http://autobuild.buildroot.net/results/46465c5d23572db402e1b01877b500926457dfab | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/b7b941974dca8c02ec5e5dd561d81a7a87b2fd87 | ORPH


-- 
http://autobuild.buildroot.net
