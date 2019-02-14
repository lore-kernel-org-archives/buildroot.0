From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 14 Feb 2019 07:00:39 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-02-13
Message-ID: <20190214070044.6825F2152B@silver.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-02-13
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   1 |  24 |
   2018.11.x |  21 |   0 |   0 |  21 |
      master | 179 |  23 |   2 | 204 |
        next |  35 |  27 |   0 |  62 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                  cc-tool-0.26 | 1 
                host-libsodium | 1 


Detail of failures
------------------

        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/9a7a44bdd4ae4dabb1d0dca4d01656bf1c039be6 |     
      xtensa |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/42c53989ccce7d417510a9f0da9272698a7afaa7 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                 qt5base-5.6.3 | 8 
       gst-plugins-bad-0.10.23 | 2 
                 ibrdtnd-1.0.1 | 2 
                       netsurf | 2 
               runc-v1.0.0-rc6 | 2 
                  brotli-1.0.7 | 1 
                     efivar-35 | 1 
               fftw-quad-3.3.8 | 1 
                gerbera-v1.3.0 | 1 
                   luvi-v2.7.6 | 1 
                   netsurf-3.8 | 1 
               qt5webkit-5.9.1 | 1 
             stress-ng-0.09.47 | 1 
                   systemd-240 | 1 


Detail of failures
------------------

microblazeel |                   brotli-1.0.7 | NOK | http://autobuild.buildroot.net/results/1b6e6c5fddf3538ed7f150294c3d8fa94b3e4c59 |     
      mipsel |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/48ba906bb6f4dc0c8af43ec11be64f7168dd62fd |     
        i686 |                fftw-quad-3.3.8 | NOK | http://autobuild.buildroot.net/results/cd44fdd2db0c23ebd30b723c48df45f71e0e57e0 | ORPH
       nios2 |                 gerbera-v1.3.0 | NOK | http://autobuild.buildroot.net/results/41338cf3e1173081e2bc2a36e1ad5b2d49c3df29 |     
       sparc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/0fbca36d2ebc6a17e1c7971c3e4762859764cc7f | ORPH
     aarch64 |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/ef25cbda917d7d9b59a3a9a57723571d6e58c217 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/de990c7e287a092164ae9ab0843f8d98e28b0ad4 | ORPH
         arm |                  ibrdtnd-1.0.1 | NOK | http://autobuild.buildroot.net/results/df26d352ef4d0ce28b032c4e85325d61da77970d | ORPH
      x86_64 |                    luvi-v2.7.6 | NOK | http://autobuild.buildroot.net/results/6aeca20d8b604a7a19061d9afd4964cdcaa80e7e |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/f67bb80f45dc5d5eb82c97cec110bcdacf54b0de |     
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/b8486fb6af33d1ec6a9e0c4b1a2dac418ca71134 |     
        m68k |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/cc86001b12627e0230d493832cbdee1aafbd90e0 |     
        or1k |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fed5752c27cd0fd0f86fc2e4213b379435af5929 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/c3f8231d2809bc1c5a3be231acfbdb70b1b9677d |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/879592e47a0000dc7940e65afdc132e3f787ac4a |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/686f3512fd6c401e3fc6e66902c5ffd41b881075 |     
    mips64el |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/3d51827fd37cc2891d1d4afada7eb6034bc96a48 |     
         arc |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0133c118e5838157987b4d6492abe2167f711437 |     
        i686 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/445e8ad9510b5bc0bd13a50b0c0cd38b24394ce4 |     
        or1k |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/0107a925073cc76283903041610c8cf0b431e8bb |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/adba89ed88474c7fec78b652870a5e70b8251b49 |     
         arm |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/80b02a3adbce73b8bc5ec01bfb2c0f94a2e58c48 |     
      x86_64 |                runc-v1.0.0-rc6 | NOK | http://autobuild.buildroot.net/results/419af2cde6efe741b1279712a891addf8faed7f6 |     
       sparc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/e7328f2a0f3c2b7c553c5c8825ad2144e26ad28d |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/6a5d1cd400a34c34e7342154554823f78c036f95 |     

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

             libva-utils-2.4.0 | 6 
               host-qemu-3.1.0 | 2 
                   netsnmp-5.8 | 2 
                     pcre-8.42 | 2 
                 qt5base-5.6.3 | 2 
              sqlcipher-v3.2.0 | 2 
             stress-ng-0.09.47 | 2 
           uboot-tools-2019.01 | 2 
 brcm-patchram-plus-legal-info | 1 
                     efivar-35 | 1 
       gst-plugins-bad-0.10.23 | 1 
                ipmiutil-3.1.2 | 1 
                   strace-4.26 | 1 
              swupdate-2018.11 | 1 
                   systemd-240 | 1 


Detail of failures
------------------

         arc |  brcm-patchram-plus-legal-info | NOK | http://autobuild.buildroot.net/results/02cec5c2a40db3d40972159f41d30979d6db84be |     
     aarch64 |                      efivar-35 | NOK | http://autobuild.buildroot.net/results/694b21b4d8e9ebd3ffa0b8ade3c941fcf7ae6c91 |     
         arc |        gst-plugins-bad-0.10.23 | NOK | http://autobuild.buildroot.net/results/1b1b3a1804d88be6837659d7c47aee09d931a38b | ORPH
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/5ec6cede8a0d265aa427bc926f9576b4dd52bb64 |     
         arm |                host-qemu-3.1.0 | NOK | http://autobuild.buildroot.net/results/c4af5505f80e1e6185df70d191e85d9393df5795 |     
        i586 |                 ipmiutil-3.1.2 | NOK | http://autobuild.buildroot.net/results/75193bb416665ea2d15d3b9f0ef0a5ef203cb301 |     
        or1k |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/d25234ea61855b7030518bcd531e2b3415857296 |     
         arm |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/90b885ee753bfa58f71625c7f06ac42310adbf1e |     
      x86_64 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/bcbd4a94bcbaa19dc08d45d8e0bac0acd08bc9a8 |     
       nios2 |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/554d61c0c47204d9d02a7dde843922ead6b1f4f3 |     
    mips64el |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/83e3c2c9e3d342dd48e8ac8148880f753499fdb1 |     
       sparc |              libva-utils-2.4.0 | NOK | http://autobuild.buildroot.net/results/c0b7625e6dcd14f4e1bddc3040336a414c4aad8a |     
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/8b23ff2855d56eece2b94a94c4742e37918dc1b8 | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/0be96b6ebc81342e2a45c8a33fb090309a711262 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/ff9a2ef7309d88170619bd4f1838a6ab07cd9b03 | ORPH
      xtensa |                      pcre-8.42 | NOK | http://autobuild.buildroot.net/results/e79b7406fe51c062c1085c079ad493019a76c080 | ORPH
         sh4 |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/63a9ef07b7b60d2324b3d279cffafdad70ada492 |     
      xtensa |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/e377b5642a9b8ae3d90032a14132c1bb51dfbccf |     
        m68k |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/35cde5ae28b00d2512eeb4f6093c2fc5f8f28a3e |     
     powerpc |               sqlcipher-v3.2.0 | NOK | http://autobuild.buildroot.net/results/9d57dc2f4b0650e6cd9a51c649938b9a446e0bf7 |     
      xtensa |                    strace-4.26 | NOK | http://autobuild.buildroot.net/results/c2d7644c6d34abfe2d479cfd2f378ca1c2a802d4 |     
     powerpc |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/c74cb880a5e0e6fd6b730e24f7e7ba1c0d804b50 |     
         arm |              stress-ng-0.09.47 | NOK | http://autobuild.buildroot.net/results/f4c4d60dc5358c3b886e55df4fabe476d41cd301 |     
        m68k |               swupdate-2018.11 | NOK | http://autobuild.buildroot.net/results/37d17d06330cca28789bbc6ef96d9ecb369f586d |     
         arm |                    systemd-240 | NOK | http://autobuild.buildroot.net/results/a06a97322f28d8e246043e9535df0ad8c769e987 |     
    mips64el |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/750597074df7df6e3c5ea0954f06a85342aca2a6 |     
        i686 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/c88e4d94c21e247f6d190842dfa05ab797e8704d |     


-- 
http://autobuild.buildroot.net
