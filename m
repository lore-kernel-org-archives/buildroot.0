From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Mar 2017 08:29:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-03-20
Message-ID: <20170321072907.45A0E20F4D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-03-20
================================

      successes : 131
       failures : 55 
       timeouts : 0  
          TOTAL : 186

Classification of failures by reason
====================================

                 gnupg2-2.1.19 | 26
libkcapi-a039f8a5adca57dc69... | 6 
           uboot-tools-2017.03 | 3 
          host-skalibs-2.4.0.2 | 2 
                   irssi-1.0.2 | 2 
                 qt5base-5.8.0 | 2 
         tesseract-ocr-3.05.00 | 2 
     docker-engine-v17.03.0-ce | 1 
             gst1-vaapi-1.10.3 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libepoxy-1.4.1 | 1 
                lmbench-3.0-a9 | 1 
        ltp-testsuite-20170116 | 1 
                 opencv-2.4.13 | 1 
               qt5webkit-5.8.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  samba4-4.5.5 | 1 
                 sudo-1.8.19p2 | 1 
                 wiringpi-2.44 | 1 


Detail of failures
===================

      x86_64 |      docker-engine-v17.03.0-ce | NOK | http://autobuild.buildroot.net/results/2994d2d06e48e38936f8b0e9824282ab96891000 |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/d311fce16e65aa1d4b8fa29a75cdae59bdb0a01c |     
      mipsel |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/4594797f83665d65a98fdc4f3e783d4d2fc0b77b |     
     powerpc |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/405957a780d62a24b68da265334e5f9b8493dddc |     
    mips64el |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/9ebdf328528234e12bfece920a0a5dd6994a98b6 |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/8fc4b09f2d25b4c760cf1f2c5a1c9501f5f58d87 |     
      mipsel |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/e2d29b399b06867c310426b116179507e990286d |     
      mipsel |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/7b3623e7f31e176e7df48c0c1efc58a1273f08da |     
        i686 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/4d6a91c78071686fa19fa84b170928ab201c0066 |     
    mips64el |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/b30700af3a32fefa0d4184ae1272340173edec42 |     
    mips64el |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/fd62db30ac7765ccf0edbcbb08efdf447fd23c54 |     
      x86_64 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/ff152dea8ee6923388b622d3126756aefae296fe |     
         sh4 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/268fb356cbaf2698a34e2bafefb11f203dff2fbc |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/079ae5e2ab7745c2c0d2393cadfaf19a15419cb9 |     
        mips |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/ed2f4bb9b1613df837abe5dad0792107353869c0 |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/a9d4f7bd2ea45a3ecc92e03101d09133bf5c5902 |     
       nios2 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/bcf2655c6ae4e4ef7cc2d5ce38e983c025d688ee |     
    mips64el |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/ec4b9053dda8ee4a33f02895c5b0fc9bfba43de7 |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/bdd5432083463bbfa86eb83ccb4abd4f03c42b9f |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/5b44aae4d0db96d49cb0e2c4b916282219bd1a28 |     
         arm |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/4646d93314f0231b910ce5af24c10fe85a56449c |     
         sh4 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/986594f826bab9f81a3428d99fb3a8adfc99fd99 |     
    mips64el |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/83c08d26ba7ae67cf9dff8fb1b913c0b1f7df08b |     
   powerpc64 |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/175fb1a9f026f4cf9ec40f171a760707dcb0e83e |     
      mipsel |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/e04144f7206046f726cb3df81c3b127a8c2c01a5 |     
       sparc |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/94ab59dce61cadfdd4784c041539ea757a279727 |     
     powerpc |                  gnupg2-2.1.19 | NOK | http://autobuild.buildroot.net/results/d689f8bae83e0b93e93f863a0a40c764a14961a0 |     
     sparc64 |              gst1-vaapi-1.10.3 | NOK | http://autobuild.buildroot.net/results/070e5510a20b6140a06b154e1dafc8cb9c5fdf8f |     
 powerpc64le |           host-skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/bad1d05890472eda0f653385ed40d16788b067fb |     
    mips64el |           host-skalibs-2.4.0.2 | NOK | http://autobuild.buildroot.net/results/fa895595133f8c6389999a9b450ef29d1c4f028e |     
         arm |                    irssi-1.0.2 | NOK | http://autobuild.buildroot.net/results/247d76c96562a10001e2ccc5b0f9e5aaba1a6d8c |     
         arm |                    irssi-1.0.2 | NOK | http://autobuild.buildroot.net/results/6d6d3f8d8a894de0247de12bade01ddcf9732f20 |     
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d810047f534567a2cb07b9c4843dc98648c079cd |     
    mips64el |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/da5f9237ab6758819fd0d3f99255cf913300ac44 |     
     aarch64 | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/c526b0b9908aad8e95bb1ba23e48d6c739099810 |     
      x86_64 | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/38861a77fa98f017f6b6a4cbbfeb71b903a0e5f0 |     
         arc | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/10dd6c0537b1d27a9ee78bbfd9f9c033a11404be |     
    mips64el | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/355709c9d24a560f40794381e3fc37bee0dc5b76 |     
 powerpc64le | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/5a73237a9c16c6b4605dd7b08c04a04d80885216 |     
    mips64el | libkcapi-a039f8a5adca57dc69... | NOK | http://autobuild.buildroot.net/results/d725eb3610d0b7227373ddc6b54676c3186a0a99 |     
        m68k |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/f16a9bf5f29e50cb8ee10c630742c550d04b079a | ORPH
        i686 |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/979cb21336ee06cda30798fcb9e56622fdaf252d |     
        sh4a |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/80af431bbe95df4c4f5faa3fc272015b0324b3f6 |     
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/f0e0b215dc0e25f9d5bca6a7d8fa5730910298ae |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/d8f660bb8f3d8e9f11132cc776ac11aaaf68493f |     
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/3f5717cc470cdba8311d5fc6a4b7960c64ec8c80 |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/b08f48f277b0163200ebfa1b2230423ba22e56bd |     
         arc |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/4db191e5b4d3af416223192b93306ad36b3d85e9 |     
     powerpc |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/e8c6bdc314b9a8d5de303633a3abd7b7e44beb2e | ORPH
     sparc64 |          tesseract-ocr-3.05.00 | NOK | http://autobuild.buildroot.net/results/5fe42f3f5f135a481b2908aa47339553179b45be |     
     powerpc |          tesseract-ocr-3.05.00 | NOK | http://autobuild.buildroot.net/results/66e44564aac79c1c47755f6d158663317a5ffe09 |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ec4b94db3c73e9139a76677879e326c586d36b2e | ORPH
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/eaf4e5ffc1b2dc3890c529f9d5a0d7e8b6813500 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/4b0bb4e419ad6a495366a72ea59adcf9741aceea | ORPH
       sparc |                  wiringpi-2.44 | NOK | http://autobuild.buildroot.net/results/544d62f8df7185aeb8ad2766694640ca1a9ded4b |     

-- 
http://autobuild.buildroot.net
