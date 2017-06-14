From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 14 Jun 2017 08:30:31 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-06-13
Message-ID: <20170614063031.2386F212E1@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-06-13
================================

      successes : 117
       failures : 35 
       timeouts : 0  
          TOTAL : 152

Classification of failures by reason
====================================

knock-258a27e5a47809f97c2b9... | 9 
                 mesa3d-17.1.2 | 8 
linuxptp-97c351cafd7327fd28... | 5 
                  cc-tool-0.26 | 3 
                   attr-2.4.47 | 2 
                beecrypt-4.2.1 | 2 
                 sngrep-v1.4.3 | 2 
                  cppcms-1.0.5 | 1 
                     gpsd-3.16 | 1 
           host-doxygen-1.8.13 | 1 
                      x265-2.4 | 1 


Detail of failures
===================

         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/72b4d595e221b5b293a06631058e27c18f142a79 |     
         arc |                    attr-2.4.47 | NOK | http://autobuild.buildroot.net/results/bb5c3387b59e4c145e38b25de5d33c66b4a6ed30 |     
   powerpc64 |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/af3d26bd396edde63d7afe7df4c80903d4b93adf | ORPH
    mips64el |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/4cfacb66821884bfa2d7dbcc45273567bcbeee55 | ORPH
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/7a1185dba1da6a5ddf58106e3b9d71bae5152cf1 |     
       sparc |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/5452efcc141bee8d2c4dca1d2cdb091199b6a076 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/e3257df47339ee942e84169e115c2203a877a589 |     
         arm |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/82edab4c3c43f40b6da9ec2ca848082b1c1a3672 | ORPH
microblazeel |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/b58eaa1ffbe984008cf0377ce27aa1f2afd6d005 |     
         arm |            host-doxygen-1.8.13 | NOK | http://autobuild.buildroot.net/results/a8a61e61f86e9e730f545bfdc1e7bcb3edcab96a |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/e32b22c68e762cafd56bc5e7dea77e745eb7568b |     
      xtensa | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b2b1101f2d61a36f67eebfe66c30d7b1fefd96a9 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/b9e20dd097a6b5076821812184dc83ccffd46ef3 |     
        m68k | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/8d39b329e119db0c1f2659e303260ff78d73ecb5 |     
      x86_64 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/c8ec06b9c6deff13c8d66979b9b32d2009b9c51b |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/810586a50bc06c57ea6df70ae935d50b0d35b5c4 |     
         sh4 | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/2b80fd6fd097d3c893d4a50ecd1bd6b2f2cfcc67 |     
      mipsel | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/220e467fcd8e5fa967968b20a102548c409dc627 |     
         arm | knock-258a27e5a47809f97c2b9... | NOK | http://autobuild.buildroot.net/results/5d030ad5d4bdbfdc9495ed51db841304096f7535 |     
         arm | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/ac2b6dfc41e93016efb8a52bdef83bc6b1da761a |     
 powerpc64le | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/fddc3e5acfefd1688383171b3796100f22f02fb5 |     
      x86_64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/6553869f015ac0482c9f57c99e5e2a816ea3027a |     
     sparc64 | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/d3f37a9c71e90eaad25cf4397792a9d787807a16 |     
     powerpc | linuxptp-97c351cafd7327fd28... | NOK | http://autobuild.buildroot.net/results/0b5b0d3f6c30c7749fc84e7a6e4ed16a861b744c |     
     powerpc |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/227f2bcaf0690173ac4fcf0f39efebb699426213 |     
        i586 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/5cb0f6d4437a5e5ee07062e9ca5690dfc78f8907 |     
        i686 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/3bea1b1ff732160294d0457353c77769cbb3b0d5 |     
       nios2 |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/806d90e02cb4e37d784a35516f7c709970a4452a |     
    mips64el |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/31a8aae9e58d6e23525e653d34225b0a7b262ac1 |     
         arm |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/072e58a9425e8721a3fa1fdc6edfc2696299c216 |     
     powerpc |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/50792cfa1d058d8dcd068819b37f75a03c8b2b13 |     
      mipsel |                  mesa3d-17.1.2 | NOK | http://autobuild.buildroot.net/results/3079cd8b32a2bde2fae544127ed3f94836a66dab |     
      x86_64 |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/5cb96723c870202ad8e7a61717557e815d55eab7 |     
        mips |                  sngrep-v1.4.3 | NOK | http://autobuild.buildroot.net/results/f64f5e7b5dcf801e4eb32be0c34e16e99cc6c800 |     
   powerpc64 |                       x265-2.4 | NOK | http://autobuild.buildroot.net/results/e9dcb12a4b5d0ce8f9defa456f69d8d6662b9536 |     

-- 
http://autobuild.buildroot.net
