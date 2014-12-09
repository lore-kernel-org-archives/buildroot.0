From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  9 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-08
Message-ID: <20141209073015.CF854101F76@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-08
===============================

        success : 177
       failures : 59 
       timeouts : 5  
          TOTAL : 241

Classification of failures by reason
====================================

                  guile-2.0.11 | 9 
                libexif-0.6.21 | 7 
          python-alsaaudio-0.7 | 5 
                pinentry-0.9.0 | 4 
                    liblo-0.26 | 4 
             libxmlrpc-1.25.26 | 3 
                  perl-gd-2.53 | 3 
  toolchain-external-undefined | 2 
              fconfig-20080329 | 2 
       directfb-examples-1.6.0 | 2 
ltrace-0896ce554f80afdcba81... | 2 
              libsvgtiny-12121 | 2 
                       unknown | 2 
                  zeromq-4.0.5 | 2 
                   ntp-4.2.6p5 | 2 
               w_scan-20141122 | 2 
                 libsoxr-0.1.1 | 1 
                poppler-0.24.4 | 1 
                 webkit-1.11.5 | 1 
           host-openssl-1.0.1j | 1 
                pciutils-3.3.0 | 1 
       opentyrian-2.1.20130907 | 1 
                  sispmctl-3.1 | 1 
           python-pyzmq-14.3.1 | 1 
                collectd-5.4.1 | 1 
                  python-2.7.8 | 1 
                    ruby-2.1.5 | 1 

Detail of failures
===================

         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/1ae88fd0fbd6ed360054c39c734a243ca7d7470c/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/48d562aa7b4123fe66322d158bcf92300cb61650/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/1ce945239a4b6c95460f86a646397db94739d13f/
        i686 |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/cb9ef38640433039179c47a8ac2c476f9c1ad69b/
        bfin |               fconfig-20080329 | NOK | http://autobuild.buildroot.net/results/7860c6d8ab847fb1884a1f9100a5576269d31d60/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/543cc0a74b9f0b8168d3117cd51e96dde32320b9/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b51db50dfcf8a19e33b7bc0b75fe3882d751c506/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/dd418e90669bbe028738c5a08040313d405518a9/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f666cc390aa470765d69345eea306a73258bc23f/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d3dfb8ab7a9ad0585bccd5ab4405dd4c68186169/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/401368f928c5a3bfbd8adac4e15cce0700b0d9b5/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ff34c13d17e9eb1f2d30221e665f232460861aa0/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/4eeb8fbe113587f0c1d6d787289a529f6ad710fe/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d5ac8efdbbf957487e56bf7d53d5ab3c4321b0bf/
        sh4a |            host-openssl-1.0.1j | TIM | http://autobuild.buildroot.net/results/ef5ae4664c9bb40abc8173c8a0f59acfc6a24ad2/
    mips64el |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/6d609403fbc67ce1c3f3244be12864a0ba4f3083/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/f931f5145429952f6c674e95138cf3ec6087f40d/
     powerpc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/3a50d2eb5b0cb55f09c1f9ff924ba8d953c0a7ba/
      xtensa |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/aeb5b57e1ffa28d0e60ad28095b90e504ec215ff/
      mipsel |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/d9cb8c2e0df791a24ad831f01950218a13e01bf1/
        i686 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/1bc38b9c174a482a49fde17e0e432a2149a370ba/
         sh4 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/32fa63e521184707150196b9e938211a5a41f9da/
    mips64el |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/e48b0e12dc93c2de5681f1074a003a2dbd3397a4/
        i686 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/039e7916443025785f260590d4e6b3162dd5b67b/
     powerpc |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/2aeba8daf1a51340c3be51cc31e5036c0b98e794/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/63f1b807e908020fa7b5cc2b13cd109c2ba77d39/
      mipsel |                  libsoxr-0.1.1 | NOK | http://autobuild.buildroot.net/results/923d4ba849839beca89f427687bbd903d6037b15/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/b7f8c7c7ef61f4bc0352605dd508839865fde39b/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/9711473a9de4d35620baf018bee9ad88b133254d/
        bfin |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/277f3e4bbe243c4a72ee39ba7a8d3d2fa282f5e5/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a73772e3bf65cb5d0e43b14f462e2732aec34ec1/
microblazeel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/497025b3f5761ee8cfd227108b48ab792dd2f469/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/b4c12158e6e5be2cac8b51e6d1721912ea90d55a/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/9641e0b87733d6765cf92db55c8aa508ec224f98/
         arm |                    ntp-4.2.6p5 | TIM | http://autobuild.buildroot.net/results/ebf1ade4699fb006f58029f321fa800600eba40d/
    mips64el |                    ntp-4.2.6p5 | TIM | http://autobuild.buildroot.net/results/1296339aa79bf7208e5cd216890491dfaaa5a436/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/b7bf0c7e98cb0a81f1f9517baf53db2b4a15ba16/
       nios2 |                 pciutils-3.3.0 | NOK | http://autobuild.buildroot.net/results/39ba901e64d27ef97e269a89f1a6a56779e90462/
        i686 |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/82bbef122dae5811bc87121d7ee4d01b7bc09316/
        sh4a |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/8bca43f998778760125c53df5dcf054a0f609b35/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/2de5264f32fd76d654a9c83df1eb74a9364fd39c/
     powerpc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/ca2afe15ac679522bdd90818b7582b06860d58d5/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/314de324a09f64f8b95882ca169c77847d75680c/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/4eb80a5cd86459efc3612255dfb1b81dbf22bb51/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/18e8d4eeed441ec4b0b40725b12c32906f59b233/
        bfin |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/7e1b2daa7e8c471140e2e487c5c5441c64983ff4/
        i686 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/2ee12099d1de2eb98659de9c5d38ed01784ab2a7/
         sh4 |           python-alsaaudio-0.7 | NOK | http://autobuild.buildroot.net/results/e4ac22755cbaf18fb8a04dddfee17e288b0d5689/
         arm |           python-alsaaudio-0.7 | NOK | http://autobuild.buildroot.net/results/3b882e1196dfea18e55670f397732998c781b280/
     powerpc |           python-alsaaudio-0.7 | NOK | http://autobuild.buildroot.net/results/958fef1e1eea0f390cc23a379c14bb44ab0b0706/
     powerpc |           python-alsaaudio-0.7 | NOK | http://autobuild.buildroot.net/results/2dec463de766272ff29bbef8fd08a223d16a92a0/
     powerpc |           python-alsaaudio-0.7 | NOK | http://autobuild.buildroot.net/results/20ac027a2b27457dd046f83abc329cf9caaaca8a/
      xtensa |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/c6777c8387534ac145097e2efffcc84180a71a92/
         arm |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/3937273bfed2422d3e4b9e6e7b9bbc2d55584ffb/
        sh4a |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/2d8346694f0a5e146069c8be4d8ba78477839b35/
        bfin |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/967e0937939ef5f4728d2436fb6cafe7f81191d9/
    mips64el |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/a62ea268354e3aea896870128f23db9da00d7f83/
         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/ae9ae6db39243ffa45fd6fc6a31a09e007f6ba44/
    mips64el |                        unknown | TIM | http://autobuild.buildroot.net/results/f73c87ffbcdfe4d8edfc316c2824aad9bda73032/
         arm |                  webkit-1.11.5 | NOK | http://autobuild.buildroot.net/results/987f4e6447076a4f0eca09771a5131e0c5e0a0e4/
      x86_64 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/d755df306bf22e78f7d3304191250b3f66a8e634/
      x86_64 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/817338b433c892b0507e44f74793858831a29d0a/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/c4839c0d2252810c7a77d976d9344305574330ee/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/6832a9a68327160a91861cf99b18488ec2cad01f/


-- 
http://autobuild.buildroot.net
