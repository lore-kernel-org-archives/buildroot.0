From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  4 May 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-03
Message-ID: <20180504060019.793A12076B@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   3 |   0 |  27 |
      master | 131 |  55 |   2 | 188 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              host-cmake-3.8.2 | 1 
            host-python-2.7.14 | 1 
                  libffi-3.2.1 | 1 


Detail of failures
------------------

    mips64el |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/b8d0e3d804bab5ce05198d02ed0b293f5c58900b |     
    mips64el |             host-python-2.7.14 | NOK | http://autobuild.buildroot.net/results/461e325a04df031f90b958a68616472a4e5da14f |     
     sparc64 |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/1a6e948cc1c33fb92040bae9f469afb6a446ad47 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 13
           libfreeimage-3.17.0 | 5 
      gst1-plugins-ugly-1.12.4 | 3 
                  host-go-1.10 | 3 
             alljoyn-16.04.00a | 2 
                 host-rauc-0.4 | 2 
               libupnpp-0.16.1 | 2 
               log4cplus-1.1.2 | 2 
                  zeromq-4.2.5 | 2 
                 agentpp-4.0.7 | 1 
               asterisk-14.7.6 | 1 
             berkeleydb-5.3.28 | 1 
             bluez_utils-4.101 | 1 
                         boost | 1 
                  boost-1.66.0 | 1 
               gnuradio-3.7.11 | 1 
                 gnutls-3.5.18 | 1 
              host-cmake-3.8.2 | 1 
        host-gcc-initial-6.4.0 | 1 
         host-gettext-0.19.8.1 | 1 
                host-libsodium | 1 
                  libkrb5-1.16 | 1 
             libopenssl-1.0.2o | 1 
                 libxml2-2.9.7 | 1 
          linux-headers-4.16.7 | 1 
                 mplayer-1.3.0 | 1 
                   ncurses-6.1 | 1 
                 opencv3-3.3.0 | 1 
                 pixman-0.34.0 | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
           uboot-tools-2018.03 | 1 
                  udftools-2.0 | 1 


Detail of failures
------------------

       nios2 |                  agentpp-4.0.7 | NOK | http://autobuild.buildroot.net/results/86597f91af17123ce20e3f854b585d72e30d0d40 |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/ed1ef6c9e2d76387e817761066ca77600c35428e |     
         arm |              alljoyn-16.04.00a | NOK | http://autobuild.buildroot.net/results/d6c67693110f3db2b97dc43fb4d44e76d0ea02e3 |     
     aarch64 |                asterisk-14.7.6 | NOK | http://autobuild.buildroot.net/results/689be71f3eff8235a27af909100e8ed4379ba370 |     
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/9b789417dbce9599dd941b474898a2cbdc6f11fe | ORPH
     powerpc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/19f27ababfc9b15b290388ae7da7d4b59bd9703a |     
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/1cccd8f1eff328a9b422650cf334f3390a1c86ae |     
       nios2 |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/b598c42b5fbb3957429a8840b0018065f8922bee |     
      x86_64 |                gnuradio-3.7.11 | NOK | http://autobuild.buildroot.net/results/9e0b913d23344bd0f1a2d96327fced45456a201d |     
     sparc64 |                  gnutls-3.5.18 | NOK | http://autobuild.buildroot.net/results/9d33961be876c5c77cc590861e4dc5c8cab43e52 |     
        or1k |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/9068bdae729141ad511b6ffb6225e1c508558a11 |     
      xtensa |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/0deaddb65af004a1040ae93947779812bc9c0b99 |     
        m68k |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/938f2b20c60c5e2b74a9d06d30e8c8acf61e2020 |     
         arm |               host-cmake-3.8.2 | NOK | http://autobuild.buildroot.net/results/548c4b33bf1a4298df01f84eed857743e8bc16fc |     
     powerpc |         host-gcc-initial-6.4.0 | NOK | http://autobuild.buildroot.net/results/92a3069303458fd61b3f5579c1d1dc6b3912ded3 |     
     powerpc |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/30ff715aab164328dda60fa5874b37723d6ac117 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/f280801140cec0338d44f9f0ea7bccfc61103b58 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c5e85d923717f4dea3336cac6182aff2efda100a | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/48f493772a2b6b4a361a78dfb350be7d4c331007 | ORPH
      mipsel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/ba841ff6d9a2bd7c52a25e32668de09194fb20ad |     
        or1k |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/1ab7c9954a953e0470bed846e44478bfb328f8a4 |     
         arm |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/6b804baff56399ab3db1a10c394a8c410e36a243 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/92741bd2085d20c59e110080fa2f95ffc5b1edf9 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/d62fe35a0dc248ef16069be181ea785aa06ed9a0 |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/c4e6970dd73389ebc0387e45c6b853b649d905d6 |     
    mips64el |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/f3826b2c05087017a1e339487ebcc023783ac85a |     
     aarch64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9b1e6d63db9eae46a92487713b0d72bd039deaba |     
        i686 |                   libkrb5-1.16 | NOK | http://autobuild.buildroot.net/results/049f5147288b418402b6e5a4181eff4d426c8d7a |     
       nios2 |              libopenssl-1.0.2o | NOK | http://autobuild.buildroot.net/results/9e3be51cee7c5f04e4654d190ab0613b4446d911 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/33c257a7c488906a1f80f88bb3d2decfc4e383c0 |     
        m68k |                libupnpp-0.16.1 | NOK | http://autobuild.buildroot.net/results/2f6f464f6360ed9ea4c238f503d2c3b8ab3cbd86 |     
     sparc64 |                  libxml2-2.9.7 | NOK | http://autobuild.buildroot.net/results/577d17cfa8640692405679a3956f66b21445dec9 | ORPH
     powerpc |           linux-headers-4.16.7 | NOK | http://autobuild.buildroot.net/results/61526386019204c45e8d3d94c5a37c8afa87cac2 | ORPH
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/4b303a7b1a20e8f16fd8fb5dac6445d618cd52c0 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/90097b6a70ed4eb8e2f896839bd52182ab40e888 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/112840e2247c6e11c98eceb9cf425a916bac3c56 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/354fbf7a9ebcf43b7e755d661c5e8ebbcaa57360 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7de0a6c0c532e8c241730b7c1448b6ab09a42700 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/06b22c3a60147c6a666bad5799417e7977e7f165 |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/7f4fbcedb02b98caf00607bcba96e450f3d706ea |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/dbfef993ab050ebfd51cb0f7087b51abfca39277 |     
        mips |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/f2ea18d3b56ee308a6404b80aad96d47c4bcad0c |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/90ee6a4962f7da2158d91e177280973fbec4f2bc |     
        i586 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/734fd891ea744f2964a6c0774e9fc1a118a34683 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d33ac0dcf32ec8db6bf6f6e7064a57bbeb39ddb0 |     
        i686 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/446000e9318036551ea685c6430e2431801c4a47 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/292c45a588e8f14d7ebe1326c940124889090043 |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/d63b006bb0b2605ddae508387f32338b1cb9863c |     
    mips64el |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/25726f93a3e9ee7ca2d505e106669e8b412a703b |     
    mips64el |                    ncurses-6.1 | NOK | http://autobuild.buildroot.net/results/13b8da6fbd0039ec017f89a7dbbe38c078a58aa0 | ORPH
    mips64el |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/fd8f88b44944c1b86a7b1c635136d8501b91502e |     
       nios2 |                  pixman-0.34.0 | NOK | http://autobuild.buildroot.net/results/cc16d770e73797fc3decfa4f71691eb949e05c11 |     
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/4c57556dfb80be209eeda4db2228a73c082f5aec |     
         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/623448b649776353dde4277012c39f97305f4584 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/28da469c0e2dce4a4c7fc68001741e03861052c4 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0f1d69c8cd78f616dab962b6af2d477d73366e16 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/8387f55af7bcfdbe38d35822de466a3b0dc0eea8 |     


-- 
http://autobuild.buildroot.net
