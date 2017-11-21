From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Nov 2017 08:00:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-11-20
Message-ID: <20171121070010.D36472083B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-11-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2017.08.x |  12 |   0 |   0 |  12 |
      master | 170 |  16 |   0 | 186 |
        next |  33 |   6 |   0 |  39 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                      feh-2.21 | 2 
pdbg-77158819158d1d7053a737... | 2 
                       unknown | 2 
google-breakpad-7515ab13768... | 1 
       kompexsqlite-v1.10.12-1 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                 libdrm-2.4.88 | 1 
                 mesa3d-17.2.4 | 1 
                 mplayer-1.3.0 | 1 
           oracle-mysql-5.1.73 | 1 
                   pcre2-10.30 | 1 
                    php-7.1.11 | 1 
 xdriver_xf86-video-ati-7.10.0 | 1 


Detail of failures
------------------

    mips64el |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/7b996bcd77ff61260dde24d25fec91fecbc1e072 |     
         arm |                       feh-2.21 | NOK | http://autobuild.buildroot.net/results/e1eb5896b50467940ddf4884cf47c50343bf34ec |     
     aarch64 | google-breakpad-7515ab13768... | NOK | http://autobuild.buildroot.net/results/498573a2185901bb9fc7bce94b0e4625405176aa |     
         arc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/c96a4815877db3cdee543bd1a12e96460aa8ccf5 | ORPH
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/7b3548bcf207d79e1f6386447423e0a9345eed8b |     
       sparc |                  libdrm-2.4.88 | NOK | http://autobuild.buildroot.net/results/3b7a948e73c98fcf3de2bfcb72d4d49588329561 |     
     powerpc |                  mesa3d-17.2.4 | NOK | http://autobuild.buildroot.net/results/5ed996fbd5cb2653309cd74b05c0e0bdcc19bc90 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ce354d5d56eb55fa316ac784cb9309b7785734e1 |     
         arc |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/f642bd2a0384d64bb0c01fdf16f670ac70c2f021 | ORPH
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/27374556584b6fd8a0a1c8932cfdc61755005fba | ORPH
        bfin | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/5614ff5364497e4f7cc0d6ff9504f3bdc3b1ff62 |     
    mips64el | pdbg-77158819158d1d7053a737... | NOK | http://autobuild.buildroot.net/results/f74df0c8b0733e9e3382499b812d285af965271f |     
      xtensa |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/e1d6888eadcaf171942fe492b3c74d388dfc9c2e | ORPH
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/503daabc2bb2f49160ba77670e3b241dbd426f09 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/97ab4d36a2a1a9a32dc47d5e7df66f63fe8ecad8 |     
         arm |  xdriver_xf86-video-ati-7.10.0 | NOK | http://autobuild.buildroot.net/results/49018f15ed9a2c5b8a718af3a08c0f1b3c8c19b4 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

               asterisk-14.5.0 | 1 
                  boost-1.65.1 | 1 
                   expat-2.2.4 | 1 
               gst1-imx-0.13.0 | 1 
                   mp4v2-2.0.0 | 1 
                    php-7.1.11 | 1 


Detail of failures
------------------

         arm |                asterisk-14.5.0 | NOK | http://autobuild.buildroot.net/results/ca5dd1fc73a8327dc9277e9168b8b8da8b6bff98 | ORPH
     powerpc |                   boost-1.65.1 | NOK | http://autobuild.buildroot.net/results/f3fd6a4951d8e685980c50f64d65e3471133ff29 |     
         arc |                    expat-2.2.4 | NOK | http://autobuild.buildroot.net/results/997473c705b1848d88be5333607c4ec192adea2c | ORPH
         arm |                gst1-imx-0.13.0 | NOK | http://autobuild.buildroot.net/results/5c404a2a28a4052056e5c9a7edda40641fe55f9e |     
         arm |                    mp4v2-2.0.0 | NOK | http://autobuild.buildroot.net/results/28ed0775503b860671c31131f2f7e1bfbd0fca5c |     
         arm |                     php-7.1.11 | NOK | http://autobuild.buildroot.net/results/d5f5bb47a728af1d00d00ed1814af2a83abc8d5f | ORPH


-- 
http://autobuild.buildroot.net
