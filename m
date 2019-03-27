From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 07:00:41 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-03-26
Message-ID: <20190327070046.238A922850@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-03-26
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  33 |   1 |   0 |  34 |
   2018.11.x |  38 |   2 |   0 |  40 |
   2019.02.x |  44 |   3 |   0 |  47 |
      master | 215 |  87 |   5 | 307 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

             qt5location-5.9.6 | 1 


Detail of failures
------------------

    mips64el |              qt5location-5.9.6 | NOK | http://autobuild.buildroot.net/results/3def7f9ee97935e41c201bfdde6a9e87eea66cdf |     

Results for branch '2018.11.x'
==============================

Classification of failures by reason
------------------------------------

                    php-7.2.16 | 2 


Detail of failures
------------------

  aarch64_be |                     php-7.2.16 | NOK | http://autobuild.buildroot.net/results/efff92194f74ddb722aac75ffd37ac9b2ff89f83 |     
         arm |                     php-7.2.16 | NOK | http://autobuild.buildroot.net/results/c588b78f88a7b95d884dcd727f76410cd3074bdf |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                busybox-1.30.1 | 21
              fetchmail-6.3.26 | 12
                    putty-0.71 | 11
                    uftp-4.9.9 | 7 
            optee-client-3.4.0 | 6 
                  ffmpeg-4.1.2 | 5 
      host-uboot-tools-2019.01 | 3 
                   netsnmp-5.8 | 3 
           uboot-tools-2019.01 | 3 
                   glm-0.9.8.4 | 2 
                host-go-1.12.1 | 2 
                   mimic-1.1.0 | 2 
                       netsurf | 2 
                   netsurf-3.8 | 2 
                  brotli-1.0.7 | 1 
             gst1-libav-1.14.4 | 1 
                 haproxy-1.9.1 | 1 
                host-libsodium | 1 
             openjdk-jdk-12+33 | 1 
                          opus | 1 
                    postgresql | 1 
              spandsp-20180108 | 1 
                   sudo-1.8.23 | 1 
              swupdate-2018.11 | 1 
               wireshark-2.6.7 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/54755deebefa66c19c8a6b76620ea8000f7235cb |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/ba1515649d931c1529f0651c8de351b0e88cb888 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/65a2294b1f9cc29d1e539204706dc04ae1e84141 |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/5af7ac41016560a5ce79f4dd2ea783f4a5fce33d |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/e348908fc90d7bb0ac15da7babbcc972d6da7495 |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/f25aabc1b927cabfdd9c784520deb2b6278460f4 |     
        i586 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4b6ae4c5121085a944804444e932c921452560fc |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/7835dae7192f9784a487d4b99fe22a55aa332dfc |     
     sparc64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/391530f733ee92469c0cb61f101e6905131aea7c |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/4968de0f3a73f1a2219c95015a6b0c5da804e769 |     
     riscv32 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/c32b10b6feb82f21357bac4540f7c7d1a4101afa |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/877a0d85e4b447e84f1734fc7006cf4be4488afc |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/95b50bffc052fd5d9706c80a6c6eb66112064474 |     
     riscv64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/a7dd987883452bfca9ae7fe8f5d56e5a1b94c5bb |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/c77ec9b8fd09993675eff1e8c14ff822dc041e34 |     
     aarch64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/987a4e20a2dcad1ed32ba5d45550bb07d1f34bad |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/666e323b4af5a5306e356fe902acf89fbb9f7c7e |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/36199d87d91b1cdd0806def50eb101879b7a9f5a |     
         arm |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/d1a6ab64ecf041fbcc95d2e80ae885b125605b14 |     
microblazeel |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/5f1114c6ee98e50516e5ec75d697fc3cc8767a49 |     
         arc |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/87bfcfd24086f0998b43b8fff0b33c38cda4df86 |     
      x86_64 |                 busybox-1.30.1 | NOK | http://autobuild.buildroot.net/results/d2a9a294855a51a6cb6235541b581353e5d047cc |     
 powerpc64le |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/664bc4327ca0fd65e557d6d47d08089dfbf2a029 |     
         arc |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/63700b2f06a089ef34af98a412ff5f91f825365b |     
       sparc |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/c316a59097da67d0f7f67b0389f2a9330765f781 |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/439446591b4bbe8983c051a9d4403c4b0c0bb915 |     
        or1k |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/cd2dc3add8be3a39ac226bbf0dd1c61d1e22d77b |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/3075fbef0ff6dc29851115be15c61559c39da977 |     
     riscv64 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/d335566ca946b2307a72bafbb057f2b72f8668e9 |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/2711b7a90c80a8021d94792442bb0eba15a4df16 |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/170fe4e9a06128ffb9afc85643298eea847afe5c |     
        i686 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/1ff5f437f48cfeb7b33d500ae8616de0d991939d |     
         arm |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/b93ab48d8729730411265a52df25f3e8b8ca79cc |     
     aarch64 |               fetchmail-6.3.26 | NOK | http://autobuild.buildroot.net/results/2f51abc1a508de70af3e16d21774390e35d17c0d |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/f1bbb3b519cd9e3f3354b2d44a6ccbfd294e18ca |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/c7146227a0e236637d2cfc4496a7c4ffb88fba80 |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/4b206a1291d88f8b48bfc944f24864d8d6bc0d71 |     
      mipsel |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/8823867cfd987e8dc5b1b854b1a8f860c0f1e49e |     
    mips64el |                   ffmpeg-4.1.2 | NOK | http://autobuild.buildroot.net/results/27075273d48b65ba415601777a502536d1ebad4c |     
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/5b6d373a3da6ee6a051005bb63b8fb6583b621ec | ORPH
      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/7eeec1d6a817b352212367e1469da4638c3ba93b | ORPH
    mips64el |              gst1-libav-1.14.4 | NOK | http://autobuild.buildroot.net/results/776028a43bd180b4895efc74321e3aee56cbcb47 |     
       nios2 |                  haproxy-1.9.1 | NOK | http://autobuild.buildroot.net/results/4d7be00514f5276a9fd533adfdbc3d5183bb59ca |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/611edec26df2454398803959d9f904e7c92540b4 |     
   powerpc64 |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/1e6f2c1f8b976722f8fea2b0c202d63133dc36c3 |     
         arm |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/67366df341646bd724610ba4d19056054db5c37c |     
     aarch64 |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/9db3c9dd9040151b40f77134145270d306c34472 |     
      xtensa |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/eb59b81989226177562e8e141545268ae21b6b3c |     
     powerpc |       host-uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7f740a1c87222728319ad6a26333083b4219ecf6 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/603634229c7a81def401ceb12019228ed2ada194 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/456c123537905ea75080db5da7dc0cd02f3a6d9f |     
     powerpc |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e0c604038f0bc486ac8337698127b87f3231ad83 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8c2975983a006c021af01636acaa1442c14e9654 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/68b0b85e2b8a7c655e8f30f35b7efcfa4d524732 | ORPH
       nios2 |                        netsurf | TIM | http://autobuild.buildroot.net/results/302f450755a2a0a341c2277db9292ae1dfd2c0be |     
        m68k |                        netsurf | TIM | http://autobuild.buildroot.net/results/83f17922186a7784d18940ac36f8dd699b7ebd5c |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/ce2d6a9f5610a513b6ace03291627972c84943af |     
        i686 |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/7c3e7dc36d2eca59a35b870cfbe47e1d7f761d27 |     
     aarch64 |              openjdk-jdk-12+33 | NOK | http://autobuild.buildroot.net/results/9276df9076adccffbac02c470574259ee30f09ed |     
         sh4 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/caa6f06459ecf700f4900145311d8f1e88586004 |     
         arc |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/743f248f1cf6a5d5fbfc2f2355bbf3965cfd91a4 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/7ffa833855b01f3a40eb65062b400137de9864cb |     
        or1k |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/faed167240dfcb180d363eba197ee2b3259ac0d5 |     
microblazeel |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/193ca84bc564286c30ce7b25328cc62fb135936f |     
       nios2 |             optee-client-3.4.0 | NOK | http://autobuild.buildroot.net/results/e3a337e2515437731132579a83031a9ebbf5434d |     
microblazeel |                           opus | TIM | http://autobuild.buildroot.net/results/f9bdcfc4b9bcad07f3d88c827dff546e187db00b |     
microblazeel |                     postgresql | TIM | http://autobuild.buildroot.net/results/fb2e9df078143da1a4c144b838ff246525335472 |     
        m68k |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/c68b2c7e97bf754771d5128e2cca2f3a3125d810 |     
    mips64el |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/4e9b47b862d2b6c3b0b94f3cf7189947eb08be78 |     
     powerpc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/db3c017ce539129984c49518821f36b85d7f60b3 |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/5c7dea97a85635c11e2a9bccd5bc405013434030 |     
         arc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/952299d3a27f758eff60c091cb7f3f848c092fb5 |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/94868b9a109ad687afcb23aa87dcfc8dcd515b78 |     
         arc |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/31f199fe2e2f6d23582f30700609f8b59f29cd2b |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/89287e0289cd87f996ebf25f73f20f9b342409f1 |     
         arm |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/5f64cbb2ae0b9cb0a16ce1ab479f9ffe61433620 |     
      mipsel |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/a62fcce8e94203d145906009be08dbf950d6406b |     
      xtensa |                     putty-0.71 | NOK | http://autobuild.buildroot.net/results/bd2c50f5a6abadd84b2d40dfb831a8155d8990ea |     
        i686 |               spandsp-20180108 | NOK | http://autobuild.buildroot.net/results/c68fb5290633e644404aa67fb6226033b763bc46 |     
         arm |                    sudo-1.8.23 | NOK | http://autobuild.buildroot.net/results/fbab60f55c7932bbf07b9628bc849e163b34756f | ORPH
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/d001aebb4522b22a32eafd887db971e4bd9ff25e |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/5f33daaab3f7586db508de897f2fa03d35e2bd6c |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/7c7cea0bda083e732df45683b138623a256b655a |     
         arm |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c26a649f854dab890615c7417fbc54c84435cd54 |     
       nios2 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/0bd4f4cc6d78c6d4f58449f498276374a33f0417 |     
        i586 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/7a06c0d3f0dbd951780daef816d2f4e1fbc0c632 |     
     riscv64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/a4109feb2b7a6e924fb0e990827c3e4b9166547a |     
         arm |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/522ecbaa2a2488ea720c2f8775a0c289b74beeb5 |     
     sparc64 |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/f5a26909ebb24d7518b530242570d062a8235963 |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/4b65f73ac67c01ba44b746f13f786687155ffc92 |     
         arc |                     uftp-4.9.9 | NOK | http://autobuild.buildroot.net/results/ff7a3d07215b98cd86f57ae975d73efbe93a4b04 |     
     sparc64 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/f19a5eea92f79241299349f859e80703b96eb761 | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                   netsurf-3.8 | 1 
                qt5base-5.11.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/df28f72d7ca26f066c82d0c2998f3c43d2d84201 | ORPH
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/6c02c1089f4f59218727d45545eb98a9629ef22f |     
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/4a2a493ab951d7fc6bf5cf5dcbfdd5025fa2fbd2 |     


-- 
http://autobuild.buildroot.net
