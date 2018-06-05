From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue,  5 Jun 2018 08:00:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-04
Message-ID: <20180605060024.82A652079F@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  23 |   6 |   1 |  30 |
   2018.05.x |  29 |   1 |   0 |  30 |
      master | 189 |  55 |   0 | 244 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 2 
                   libnss-3.33 | 2 
                  cc-tool-0.26 | 1 
                   exim-4.89.1 | 1 
                    gst-ffmpeg | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5677a3fd96217cbb0966063de048401cf1ccf16b |     
    mips64el |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/6c2bcac197aab3354b4c5e8933538acc9b0c75ae |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/7dcd72a2c2225d3e52558472eea99c839765c72f |     
microblazeel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/4d34382dc7f1201c14c50afc0905f04430b5f863 | ORPH
         sh4 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/ffd260f4a53b803cb5cb9928fb9d6a94934ea818 | ORPH
   powerpc64 |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/cb7ba481865424513a92a274f2f0aa1c2650d849 |     
    mips64el |                    libnss-3.33 | NOK | http://autobuild.buildroot.net/results/3f5538bb058c02c067745ef63b4f3af0054084da |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                pinentry-1.0.0 | 1 


Detail of failures
------------------

       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/551fa24f57e700bbb10afddf3579bdae7a207529 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   libnss-3.37 | 27
               mono-legal-info | 9 
         python-websockets-5.0 | 6 
             host-dfu-util-0.9 | 3 
                   whois-5.3.0 | 3 
host-imx-usb-loader-7e77787... | 1 
         mono-gtksharp3-2.99.3 | 1 
                oprofile-1.2.0 | 1 
                protobuf-3.5.1 | 1 
                      qt-4.8.7 | 1 
                qt5base-5.10.1 | 1 
                      x265-2.7 | 1 


Detail of failures
------------------

    mips64el |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/320294b40c275401d9f6c09370be3a03a7a09781 | ORPH
      x86_64 |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/63879299bc8e9f9972e8c84d2cf1c3576f0eec8f | ORPH
      x86_64 |              host-dfu-util-0.9 | NOK | http://autobuild.buildroot.net/results/523304b548a6cf5c46f8d10ce838e3f7c1ba4392 | ORPH
         arm | host-imx-usb-loader-7e77787... | NOK | http://autobuild.buildroot.net/results/0a156449e5f38a6092ab9c88e3e3f5ea9abc0f03 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/20d13523c39ecf882ccef1b387c1117781782823 |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/11e9ba4f95e3ad51354eba9ada99d1d7c0f9e7f7 |     
        m68k |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/9f6ee3372771fb80b383993f7e86fc0e9268d67e |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/de4b03ee4ea2f501792ef368f0dfd6c9f01c73bb |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/fde9aa112b7e9d63af8a0431997feaf9f453e4c9 |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/5b8991adaa5572bd7dffb18aecd34b1b3b60c051 |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/80e1b3cea5e8dc346827a6f09ac00814311d14e9 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/378b656d785bedf28a66267e84371e9ed4200891 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/edd307b585a1b9a53cddf63e0ec7303cdd0aa92b |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/33ae4c607f87500e2d686c36621fc7e1c514e6bc |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/44c3b66e4d6f67aec399b9ce25a88191e79c298e |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/bb171ac5259e47c45f2ea8399e3e44e8354128e6 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/33faed811f07769a3bf52afe8b70c44f155ba15f |     
       sparc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/223853201db2928084c11bda66e437f36977ae34 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/093113829d7ce19d578a920e76caa10822774139 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/81715310624b383273a4342cc23f640942866d16 |     
    mips64el |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/85919a9d07eb29265c4440ff1a155a3387947922 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/a8cec3d5b989de3a0305f6940a70194ffd02999a |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/4538f77a086a9623d1d74af471330216bc0297cb |     
       nios2 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/6086f0a2b4e03a09b1efaac08f8c7ec3ba610f2f |     
microblazeel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/fd6b1e1a83c2e43ae970bd5c583933d54a5abee2 |     
        mips |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/45dc15612a5a76a8adf943129ba75b5efad8d301 |     
      mipsel |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/d45538528f14452e87d4e9def5c7c39d2bc602c4 |     
       sparc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/8dfa51c8f9c01444d6a0147d5829db4e403a6e71 |     
     powerpc |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/df4a23ad8625dea0fec25f44e784e85431ec1c7c |     
         sh4 |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/6abb9f7b1d40f74fab3e00975fbd458d746e0939 |     
         arm |                    libnss-3.37 | NOK | http://autobuild.buildroot.net/results/ef99000f400c3220fbc8b423bec7a914f589827e |     
        i686 |          mono-gtksharp3-2.99.3 | NOK | http://autobuild.buildroot.net/results/a0d2a7dcf3eb732a6918f3044d8553c8bc96e658 |     
      x86_64 |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/c69e55a3f7539ff65aaf57c96f52ebea7e456e48 |     
      x86_64 |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/94cca766ee102017eb4ab2ed4ab606e8824c9d07 |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/aec1f4b636c0dcba529938b231a6bd09d0274bce |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/041ac7beb578f070182bbac662994b3fa9131bf5 |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/62b31563570b0d14fc5dfa3583682871fe628844 |     
         arm |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/bae2521b3f23b5ed96d12e074d893f581003cd7b |     
      x86_64 |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/040cac4d0cf463fc973ba1d082d2183666b8d11f |     
        i686 |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/34b18f8860f3e92600b646ccee24d0d0f77351d9 |     
     powerpc |                mono-legal-info | NOK | http://autobuild.buildroot.net/results/9ebc9c1498f56d41365b5603554a995a097ffc8f |     
        i586 |                 oprofile-1.2.0 | NOK | http://autobuild.buildroot.net/results/06fbff267063e09f7bc06adb08c896f861ecdb1d |     
     sparc64 |                 protobuf-3.5.1 | NOK | http://autobuild.buildroot.net/results/e15080fa1993a9773efd6be724dca4234eca90c3 |     
       nios2 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/0b59939faaefc12cd7da4f26ab86659ac031b008 |     
   powerpc64 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/c0196693cfdbf10b429c5c03684d5308a68c8509 |     
         arm |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/ea99661671ddef2e3a4044324ff83a041abbad63 |     
        i686 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/80cb6a39d1b604a6cde2cdfe74c7d94534f512e9 |     
   powerpc64 |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/4b79b5cd8d5e916575b7582c6226bafb17ae809f |     
      xtensa |          python-websockets-5.0 | NOK | http://autobuild.buildroot.net/results/ec23c2b16ed38dc65c910edd83e185c68c52a46f |     
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c9b53164d104332e9d49443af3be118bb7d19d44 | ORPH
        or1k |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/fba9bd4c29026d8dabca8fcda6941de3508a352e |     
      xtensa |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/b1f84bebb183ee0656b23805291fe682063f3518 |     
         arm |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/e6fc759592adc2f3b8d5002d14b291d166c0654d |     
         arc |                    whois-5.3.0 | NOK | http://autobuild.buildroot.net/results/8a9bcc1db14b3cb047bf3cff67063341f92e5ecb |     
         arm |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/467592290eb7e60a53b24f570ff65ade6542316a |     


-- 
http://autobuild.buildroot.net
