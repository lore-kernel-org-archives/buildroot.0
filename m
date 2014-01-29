From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 29 Jan 2014 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-01-28
Message-ID: <20140129073009.4D1A1100E8C@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-01-28
===============================

        success : 77 
       failures : 47 
       timeouts : 3  
          TOTAL : 127

Classification of failures by reason
====================================

                 libhid-0.2.16 | 4 
                   open2300-12 | 4 
rtmpdump-e0056c51cc1710c9a4... | 4 
          sane-backends-1.0.22 | 3 
                       unknown | 3 
                   ccid-1.4.14 | 2 
                    sdl-1.2.15 | 2 
                  thrift-0.9.1 | 2 
                     vlc-2.1.2 | 2 
               alsa-lib-1.0.26 | 2 
         host-elf2flt-20130904 | 2 
                 pixman-0.30.0 | 2 
                elfutils-0.155 | 2 
                 cairo-1.12.10 | 1 
                    mpd-0.18.7 | 1 
                      axel-2.4 | 1 
                 httping-2.2.1 | 1 
               libsigsegv-2.10 | 1 
                  pango-1.28.4 | 1 
            host-libusb-1.0.18 | 1 
                   lftp-4.4.15 | 1 
              pcsc-lite-1.8.10 | 1 
                      qt-4.8.5 | 1 
                 libnspr-4.9.6 | 1 
                      icu-51.2 | 1 
                  samba-3.6.22 | 1 
  toolchain-external-undefined | 1 
                 mpg123-1.17.0 | 1 
                   dbus-1.4.26 | 1 

Detail of failures
===================

   powerpc |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/cbf465e1c7b2a2a44bafbdd244e3ded752b16d2c/
      i686 |                alsa-lib-1.0.26 | NOK | http://autobuild.buildroot.net/results/9a7459146ff03e022f7a190ecb6e98c5176d8a42/
  mips64el |                       axel-2.4 | NOK | http://autobuild.buildroot.net/results/2d9548cdd768f8cc65a973bcaf97270ae979141c/
       arm |                  cairo-1.12.10 | NOK | http://autobuild.buildroot.net/results/15906876dab117d072d47dfbd5ed63703feea66b/
  mips64el |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/8e5f1a768c3a808801383b52693d6941897d89a9/
    x86_64 |                    ccid-1.4.14 | NOK | http://autobuild.buildroot.net/results/c5d98484add13e002336c2996ceb4077e6fe738e/
       arc |                    dbus-1.4.26 | NOK | http://autobuild.buildroot.net/results/d834975f1f032618815ca32e87f2e4e40f6ef948/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/183cb43a0a884f82664e892208b59ca1c7ef62f6/
      bfin |                 elfutils-0.155 | NOK | http://autobuild.buildroot.net/results/721722983d48d43c0281dadf4fa27b74fb840dfa/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/43889742a0d4fe9a3dd391c3768c4ec7091ca5bc/
       arm |          host-elf2flt-20130904 | NOK | http://autobuild.buildroot.net/results/4c54fc216bfbdda3a2d12506661274fb19207972/
       arm |             host-libusb-1.0.18 | NOK | http://autobuild.buildroot.net/results/7bbf6ec25250dea96503253ac468adfef77a9010/
      bfin |                  httping-2.2.1 | NOK | http://autobuild.buildroot.net/results/0ffaaa0de8108670156f6a0c164548eb0541ae0d/
      bfin |                       icu-51.2 | NOK | http://autobuild.buildroot.net/results/e80cb5a2b7156bcea16e74de77d1e60ebe3f4b28/
      bfin |                    lftp-4.4.15 | NOK | http://autobuild.buildroot.net/results/3c2b38667de930bd6fa8b76be7a8a4b540f486fb/
      i686 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/57e22fbf67ea6940084e9fc924e881f1d9acc374/
   powerpc |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/5a3c9d11fa3f3033462e7728fce5ecd39caa8e18/
    x86_64 |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/a5b2d9ed15e949d46eddfb00fc9277f3ec95f877/
  mips64el |                  libhid-0.2.16 | NOK | http://autobuild.buildroot.net/results/21cd745ee8e7bcdccda38d2deea04efc656c9064/
microblaze |                  libnspr-4.9.6 | NOK | http://autobuild.buildroot.net/results/60cae4076459a631c47851c19bb67eb24ddfaeec/
     nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/61da4894f637dbef4acd3489d9c1c84ffc11e6a1/
      sh4a |                     mpd-0.18.7 | NOK | http://autobuild.buildroot.net/results/b6f59032271a4af4634cf253ce7661ef443a5cf8/
      bfin |                  mpg123-1.17.0 | NOK | http://autobuild.buildroot.net/results/435c9ab1ca12f00facd95b5151465fac67334126/
       arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/bc1cfdfb61bfa7fdaa3d31c443b8b12ced34072e/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/555fa5f90b757095d19c72c13e56970e51593726/
   powerpc |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/3e64a7efbe4c3915cdbb1c658059cefb70bbd06e/
      mips |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/9992b1a97532063cee6def0e4b2f1e2f484999ec/
       arm |                   pango-1.28.4 | NOK | http://autobuild.buildroot.net/results/b1aa59c815d1e0489525f1d75fcaa2a5a9bbe7e1/
       arm |               pcsc-lite-1.8.10 | NOK | http://autobuild.buildroot.net/results/1979e89b601a1bba5694e70d186c16ee4b5a2c37/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/124ae5f8869c84e41cd6f7d03b0ae279ac412436/
microblaze |                  pixman-0.30.0 | NOK | http://autobuild.buildroot.net/results/d9aa48e21c7f980f205553af12c3e04338d262c2/
      sh4a |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/5e5ec8f51227e2e0de6adc127b74672a87dbd1d4/
      i686 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/55bda4076af031db9778d97f9ddc5c6b14de17ce/
       arm | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/9ba2f8ecb0a73cc7e625faf713ad4161202b2293/
      i686 | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/4e1988f049fa97574da54e5097e5ef1668c2687c/
       arm | rtmpdump-e0056c51cc1710c9a4... | NOK | http://autobuild.buildroot.net/results/02a15ad5211a1e620002c442ce256147d9b9ee88/
     nios2 |                   samba-3.6.22 | NOK | http://autobuild.buildroot.net/results/a8111f77f18f794ea919c642e61e258d225783a7/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/41f6f08f1f3603c40d50acfdc4d52870275da447/
   powerpc |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/938f27f2085cc088ff1d631fed56a0c4b7f27932/
    x86_64 |           sane-backends-1.0.22 | NOK | http://autobuild.buildroot.net/results/067bb6f263306fe6b5b527ad156a0f9831379693/
   powerpc |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/53fc3d2fd0337e8c358e004a37870a884d3b12c4/
      sh4a |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/82041bc9f1d76f0f68e0757be17035afbb26a2b8/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/6fb93982c0cf54426e951b20a0736fe934205036/
    x86_64 |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/e266f359f08670d4a5a4e78b288f0b6e1d3b500e/
   powerpc |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/38642579340d5ce7203fffe47b84dbdd53eefbc6/
    x86_64 |                        unknown | TIM | http://autobuild.buildroot.net/results/ef884364d8d790732e6e130df3499ee4f336c3fa/
      sh4a |                        unknown | TIM | http://autobuild.buildroot.net/results/392e6b8ca70d7b5882dd02c9d31f01472dfaa8ce/
      mips |                        unknown | TIM | http://autobuild.buildroot.net/results/5dcf1576cb934bc50ff38545f29e620dca02b5a9/
   powerpc |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/dd35f843edb7bd4b1e4cdc0ecb5b194032f35979/
       arm |                      vlc-2.1.2 | NOK | http://autobuild.buildroot.net/results/72584d1d305002387000c7423c7d3fbda4a380b9/


-- 
http://autobuild.buildroot.net
