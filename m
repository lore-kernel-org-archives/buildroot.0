From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed,  4 Jul 2018 08:00:47 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-03
Message-ID: <20180704060047.AB1C8207BD@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  15 |   0 |   0 |  15 |
   2018.05.x |  15 |   1 |   0 |  16 |
      master | 131 |  33 |   0 | 164 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

           uboot-tools-2018.03 | 1 


Detail of failures
------------------

         arm |            uboot-tools-2018.03 | NOK | http://autobuild.buildroot.net/results/9965eee33215c0165a6eff233e832ead45622260 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                    host-rustc | 10
             gnuradio-3.7.13.3 | 5 
linuxptp-303b08cbf55096aba5... | 4 
                   wampcc-v1.6 | 3 
                      x265-2.8 | 2 
             host-gauche-0.9.5 | 1 
              mjpegtools-2.1.0 | 1 
                mongodb-r3.3.4 | 1 
                 opencv3-3.3.0 | 1 
                       qt5base | 1 
                qt5base-5.11.1 | 1 
            qt5location-5.11.1 | 1 
                  samba4-4.8.3 | 1 
                 wiringpi-2.46 | 1 


Detail of failures
------------------

       nios2 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/490ddf75321b504102c2cca9376dae5b90593173 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/568b22391ce4fb334d8eae1c19f639eeac92f96b |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a341d7cc8e97598bfa9bc6e6ac7930f2d9f28d8a |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b883f99ad9c4acfbcd77a04418829086c2b384c3 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d5ef279c856f6a9467a46a72b6160b6da8a21411 |     
        i586 |              host-gauche-0.9.5 | NOK | http://autobuild.buildroot.net/results/e92a26022836bb466c341c3ae11c072102a99e11 |     
         arm |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d8a4361fb866b3e5218b5605db50c77f5303dada |     
     powerpc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/a9075f9e2aeac0694045af2c7f162c22fdc09c02 |     
     sparc64 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d4b26746ec8d452d5a9ad3f200079e8be28deef0 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/d61f9172a194c27dea6e9db82e3b977df747e6fc |     
      mipsel |                     host-rustc | NOK | http://autobuild.buildroot.net/results/22d233a3145c12080cffe4d172d910cc986bcbc6 |     
         arc |                     host-rustc | NOK | http://autobuild.buildroot.net/results/518b067bd1f7db33a47554cf26c3aa3400a25927 |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/68711fc097a9f37a5ab2974a577e3f8b51dab9ad |     
       nios2 |                     host-rustc | NOK | http://autobuild.buildroot.net/results/e79e654d33bd5d420f704e740a1c5696642418c6 |     
 powerpc64le |                     host-rustc | NOK | http://autobuild.buildroot.net/results/4ce1674428a4633f4cb43681f94ac6f188040ecc |     
    mips64el |                     host-rustc | NOK | http://autobuild.buildroot.net/results/1c7c3d2b5d8653aab9bd74c4eae4aa93d6d53b70 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/d2b8157d279f2d963bf1f8072fc4fe09223b4393 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/57c3c68ff0d16b0fb4572b78eef097c4571d2322 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/7823656329ebfee7755640599664448f17a2e6c4 |     
         arm | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/919dce73a19c689e3413c46434797d963401d788 |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/10119cc8750dd5960323040e248c80c437b943c3 |     
     aarch64 |                 mongodb-r3.3.4 | NOK | http://autobuild.buildroot.net/results/ca43ddf553a2c8b2c64432de281cf7126ffb36e9 |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/67b3273cefdd67f0ff702bf8ee39a5ff714c313d |     
        or1k |                        qt5base | NOK | http://autobuild.buildroot.net/results/11359a99fa8e5229a7679d176546af20ab4ecdaa |     
microblazeel |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/1c48081fe9f8c56adf228ac2942f7a230cebdcdc |     
        i586 |             qt5location-5.11.1 | NOK | http://autobuild.buildroot.net/results/2b71f186b8d67c4805393c9c016d641893d46220 |     
         arm |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/28af94dd07b1d40bf0d89e671082e1671d388994 |     
        or1k |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/35d9d1c2c3dc6b3b34b7df74ebe41f2bdcce9c1a |     
microblazeel |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/1031818290d8e1f9db80a984ea05ee6b4dfe05c1 |     
         arc |                    wampcc-v1.6 | NOK | http://autobuild.buildroot.net/results/60053dbc47658b5161dc76a40037c0a0aebdf619 |     
microblazeel |                  wiringpi-2.46 | NOK | http://autobuild.buildroot.net/results/21feb3ef582237efe2b6986d95c1a3339e32019c |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/672201ab28e0b2a8afba9af443c0c348685a5d6f |     
         arm |                       x265-2.8 | NOK | http://autobuild.buildroot.net/results/d649efcf193e939c46323300a9b4b13f9dc93fae |     


-- 
http://autobuild.buildroot.net
