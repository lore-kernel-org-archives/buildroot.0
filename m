From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 12 Mar 2018 08:00:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-11
Message-ID: <20180312070012.10A78207ED@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-11
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  20 |   2 |   0 |  22 |
      master | 213 |  56 |   0 | 269 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

           cups-filters-1.17.9 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

       nios2 |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/53dfd4d214de00d947cf810c570e3830314b75fc |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/7c685a97b7ba57c6b1ce75d2422dc2d1d4c3f992 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    htop-2.1.0 | 9 
             libmpdclient-2.14 | 9 
             bluez5_utils-5.48 | 4 
                  host-go-1.10 | 4 
              keepalived-1.4.1 | 4 
                    liblo-0.29 | 4 
                  udftools-2.0 | 3 
           libfreeimage-3.17.0 | 2 
               upmpdcli-1.2.15 | 2 
                   ympd-v1.3.0 | 2 
               asterisk-14.7.6 | 1 
                  boost-1.66.0 | 1 
            mesa3d-demos-8.4.0 | 1 
                 mplayer-1.3.0 | 1 
                    ncmpc-0.27 | 1 
                pinentry-1.0.0 | 1 
                   qemu-2.10.2 | 1 
             qt5location-5.9.4 | 1 
                supertux-0.5.1 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                   trinity-1.8 | 1 
                      x265-2.7 | 1 
               xfsprogs-4.14.0 | 1 


Detail of failures
------------------

       nios2 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/2ec584e86872554e958421eeb40ec72bc776318a |     
     aarch64 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/8198aa9594be2c22eee8039bee9bd4b98f8afb88 |     
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/a96c05c339783264c6cdf854cb95ac0b9eec00b5 |     
         arm |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/317621ab393b1dd5cef1f9b8ce530e36ece0b610 |     
      xtensa |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/dc4d7eb5b1fb6f041df1bfc0f3627d1b1f92041b |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/4397f221ce8f9a817bc1d6c02276857862669ef3 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/4201ee5411332a5a242f513320e91955c43da814 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/3e3ab18b2e00d4bf9a665c4d97c1b140e537e1c0 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/6d3909860ed502dc58ce22a5b3562f66273ecd3b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/86d6409413af237411ae3ee4222692b83800aea4 | ORPH
       sparc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/cc817c18db158d5f895d8a3d9422ecf1288af43f | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/3edc127c9df8d3f8c59dcfdf5281c1a950e306d6 | ORPH
microblazeel |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/e7a07697a7b11ed1e9d786d8ecbb4a54e4d9fc0f | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/71a6ebd6a8218806e9a84f2ed777edf4d166fed3 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8ca6d294ed23e504ae1edb86027dbe85fb7fde42 | ORPH
    mips64el |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/59d534a7b1b2b04fe85851dd89e58a313c95889c | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/8599713e89d5474e9449796ef16b95a6f86713a1 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/70f2e8ac1a8176d9255cee6ce178703b49288ad5 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/f51f4de0d9746b158230b7de0a74eadb072a10db | ORPH
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f9c813f21bc16224e40d5474e6abaaf12f72abee |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/70ba292ad79f5e63918126f2ec67f053c310889e |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/2f92eeccdb66a0eec8db7a5e3e37de45ee1f3a12 |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/e1f8f867ab615ab7aefe71c7853756c6afc30c17 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/caef72f25ebaddd581a6d848eab9af4f2cda1cee |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/bb65dcb886d0e67b3b449af8e28e8eda24d70f96 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b5c93980a730b0e6a21e91705310a3718a8a0493 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/bcc47c19d42a2405541386b954e9bd5d678ce6d0 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/4ad00599f6c2f9d53b45039f5e657a069f5b118a | ORPH
      x86_64 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/b6750fbae46c8af33dbefbe71d591d65b833d85a | ORPH
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/45208e51814b777a5a133b0e345e800ee51d8a53 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/845451313367e880adaf697276a723ff3bc7b586 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/c668e48e9b4803ce8b99dc153b60a782dfbdd550 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/3b4d6d146ea0fe48697d5b5572d080890d51b6ca |     
        i686 |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/ac4f8a48039472d92c1a423772dc63dec01e2208 |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/15758a6a139425e04853f9070d7cf90afbfdb0cf |     
         arm |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/5222768a6735c5d87fb2bf95014ebe73691c1722 |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/377876eed610c1f3d36a737e45d1be7c20183cba |     
        m68k |              libmpdclient-2.14 | NOK | http://autobuild.buildroot.net/results/9be5fcc183f4c16965894e3f5ba3d21613648177 |     
         arm |             mesa3d-demos-8.4.0 | NOK | http://autobuild.buildroot.net/results/180e3e69d656de043d7d53578d954b56b45013a1 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/1013c3658ed685a028e5a8f22a43ac56cbf1df6f |     
         sh4 |                     ncmpc-0.27 | NOK | http://autobuild.buildroot.net/results/e8ee7f5456a13f777b700659e24d4bb74679538f | ORPH
       sparc |                 pinentry-1.0.0 | NOK | http://autobuild.buildroot.net/results/acc2536c4d5ef281da9e100d982e0b9f57d9787f |     
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/5a159a8b4a2f2c3843652febeefcbb43684056c3 |     
    mips64el |              qt5location-5.9.4 | NOK | http://autobuild.buildroot.net/results/42de0cade07f9feb38da88f675e664ed68e9844b |     
     powerpc |                 supertux-0.5.1 | NOK | http://autobuild.buildroot.net/results/b23467199a220a181094ee8be120e9a1d035daf7 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/2994623f694d77d77e6b75df3fb53a199296e2a4 |     
         arm |                    trinity-1.8 | NOK | http://autobuild.buildroot.net/results/f98f43657cbf519a626257af5a21c8c228423856 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/36b45f5761edcf5d1c28ff0b10da3631b3015dc2 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/5ba9a15d7bf5e7e521febd27b21dd6fdbd6bf59b |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/da2f2513157963f8836adaccd3ef45fe5c493995 |     
        mips |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/b8aa4e726d9a6770945a05da1a5f41b9dbda14b6 |     
     powerpc |                upmpdcli-1.2.15 | NOK | http://autobuild.buildroot.net/results/cc3d4789ebd81f09f59fe2ae891c645b8a8a70a4 |     
         arm |                       x265-2.7 | NOK | http://autobuild.buildroot.net/results/9dcbf8e9eeb11d6110b9166d972884f06fe17c2b |     
         arm |                xfsprogs-4.14.0 | NOK | http://autobuild.buildroot.net/results/bd7e1af33e6e937c75b44c7c9ab991d2b10f2931 | ORPH
        mips |                    ympd-v1.3.0 | NOK | http://autobuild.buildroot.net/results/6971f18e70a02337acd18344885ad15853966850 |     
         arm |                    ympd-v1.3.0 | NOK | http://autobuild.buildroot.net/results/d9b1375f5f8ecde8fef027344a5d5b288f7cee7c |     


-- 
http://autobuild.buildroot.net
