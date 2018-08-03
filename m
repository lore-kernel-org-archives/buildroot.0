From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri,  3 Aug 2018 08:00:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-02
Message-ID: <20180803060011.86F2120739@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-02
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  10 |   0 |   1 |  11 |
   2018.05.x |  27 |   1 |   0 |  28 |
      master | 158 |  58 |   3 | 219 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                       unknown | 1 


Detail of failures
------------------

         arm |                        unknown | TIM | http://autobuild.buildroot.net/results/9ad0944c6672b9f521f2f0d94973fd29519cc1ae |     

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

          host-libglib2-2.56.1 | 1 


Detail of failures
------------------

 powerpc64le |           host-libglib2-2.56.1 | NOK | http://autobuild.buildroot.net/results/85442fbf70a44b0f9b77f44c7708d35196c46a8b |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 11
                  boost-1.67.0 | 10
                  polkit-0.105 | 10
                 copas-2.0.2-1 | 3 
               mono-5.12.0.226 | 3 
               aircrack-ng-1.3 | 2 
               azure-iot-sdk-c | 2 
         host-cryptsetup-2.0.3 | 2 
           host-libselinux-2.7 | 2 
                    ncmpc-0.30 | 2 
                qt5base-5.11.1 | 2 
              argparse-0.5.0-1 | 1 
                    brltty-5.5 | 1 
                cgilua-5.2.1-1 | 1 
                cutelyst-2.5.1 | 1 
                    f2fs-tools | 1 
             host-guile-2.0.14 | 1 
                libmpeg2-0.5.1 | 1 
            lua-basexx-0.4.0-1 | 1 
       lua-messagepack-0.5.1-1 | 1 
          mediastreamer-2.14.0 | 1 
                      qt-4.8.7 | 1 
              wireshark-2.2.15 | 1 


Detail of failures
------------------

         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/61170d12811c70037ee875434a295ac35a2a5c50 |     
         arm |                aircrack-ng-1.3 | NOK | http://autobuild.buildroot.net/results/fee6e0a1a2bd16d54328ea14a32958f5f9c6db4b |     
      x86_64 |               argparse-0.5.0-1 | NOK | http://autobuild.buildroot.net/results/57724c131413b0fe8e2b4fb965dc68d3d9fa411d |     
   powerpc64 |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/dc076f9445e82fa75a77a1ec9a58b1799d19bbd1 |     
       sparc |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/27f1112b35e4124493dde32a415c4ce8a23c8af1 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/8c91c2d01d9ba42ed3b9f132ab04995fdc3fd948 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/48842cc13047d6fc1a1087fd31a24e086cb88488 |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/50b55b4005b356f09260586ca53850ea72c0ea3f |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5fc92218d482119c72e93fddad108893574d8bc0 |     
     powerpc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/77987c7399d7b6814bbfe0fe7ae59bc5db16c18f |     
         arc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c9701263f2867403f9df555fbfc7359ecad33d7d |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/c36818b7570df667c9825a5f1234d248789ce929 |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/367627eb0fdc92e8d09458370bd8dde363d3a21c |     
       nios2 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/f6ea0f1141df1764e2608c73905422f5dd511dc2 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/5cd1fc104f8a99a6ac8aff2f3f0089cbb65ef053 |     
      mipsel |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/aafb517135096870537319444cb3d7f68227b8da |     
         arm |                 cgilua-5.2.1-1 | NOK | http://autobuild.buildroot.net/results/254366fda8406f9c1c4ac97d6eaa58c691285840 | ORPH
         arm |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/4f00f9ff46e16b6822b7f525e6dfc17c2a075dc0 | ORPH
      x86_64 |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/e157a783e67aaa436aa8c05e99deb0dad39ba598 | ORPH
         arm |                  copas-2.0.2-1 | NOK | http://autobuild.buildroot.net/results/25c5e7ff5fab5ac45d959d50eded47bec4fa83b5 | ORPH
      xtensa |                 cutelyst-2.5.1 | NOK | http://autobuild.buildroot.net/results/0e97bb08840facb5ed332562bebd8f55e1bfa549 |     
    mips64el |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/c1d8c4b2f7b81dd699fe78ba2326e468fe4b6804 |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/25e744394921ea2ef3e3d354369bdd834f76ab4b |     
     sparc64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3ca132319a64e01fbe62cf44664d9553ff4ca457 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/3b761e8f2618ffbc4f07a62f3ae2c1f32faa7bf8 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/1f5a045fe75ce4d03c9c6b80f81f9dc280974a08 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/db38daeb782641c53ff3e8a4f86e748afcd608a3 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/56bea2876d43e9ac77cbed3538152c99ec22d080 |     
        i686 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/82cb849aa05aa324822cc9bc57f34f5ac3f2f131 |     
 powerpc64le |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a393d02aec88892ad8477367d98e9fa0b2d0ff75 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f88c6d7f98f4dc52a4e433e4852145b454809fb3 |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/12902dfbb9e07fec93f64f26d68de243b4c8cb8d |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/7f2d8097e0147851102ee67af97ff0494fe5a566 |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/58bd9549610d65a59e7666c77c07b0af4146250b |     
         arm |          host-cryptsetup-2.0.3 | NOK | http://autobuild.buildroot.net/results/32e67296f62e73c76c96631eb4eafc0b68b31c3c |     
     sparc64 |              host-guile-2.0.14 | NOK | http://autobuild.buildroot.net/results/a2ff23ffa036dd1917c1daa90beb7315d569d2dd | ORPH
      x86_64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/18459464c1898ce2ad933cd7c3dcc25130af9964 |     
     aarch64 |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/e2db8c94cb80ef0a0a71e91a465e66694e11d728 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/4b626f9e456cc22e43b31fc4ddb333590b2cde45 | ORPH
      x86_64 |             lua-basexx-0.4.0-1 | NOK | http://autobuild.buildroot.net/results/996fd6430f99d08956132fd46445badcd60df2ac |     
      x86_64 |        lua-messagepack-0.5.1-1 | NOK | http://autobuild.buildroot.net/results/7c4a23991448dbeed88421888320f3b5fb85ceef |     
      x86_64 |           mediastreamer-2.14.0 | NOK | http://autobuild.buildroot.net/results/f339ac6ea30815eeb8ecb144c971f56c06a9f995 | ORPH
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/04ed7f51809333e344446e0c39feb402a1e9a306 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/52d856a306422b02e778cff80fff6327306c91a7 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/7a1e5a121abb71f127fb49ae013f9564e47b8577 |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/68b2b295681c918ed8b826c8c68591b706e2b1af |     
    mips64el |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/b8eb146b6f6aa362b6d9bf0dfeef5d7f2075dbde |     
      x86_64 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/397650353f3add1b213340999bd37dd6ac010af6 |     
     powerpc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/64d1bf86557e791cf9f66a650bbf2762238bb08d |     
      xtensa |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/01944a550054efbbea97398dbf20fe8164e5dc77 |     
      xtensa |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/125d677365f8977d61bc535c957ce7951fe179b9 |     
       sparc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/462af32e9a4bd0121518b04aa9056252262a4ef2 |     
     powerpc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/adf63c7586a4d7e0c795ba52962afd37d24de224 |     
         arc |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/fbbea2ec8d202e32612a80da05eb12e68ab05ae6 |     
      xtensa |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/dcc693ee5090ff3f979e8eda19ba603cd7f99fdd |     
      x86_64 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/38590fba62a83de8868d94aec9e2ace3bd69efee |     
         sh4 |                   polkit-0.105 | NOK | http://autobuild.buildroot.net/results/5ceb019b5bc7aac963be03c69a7e601051c2cfec |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/15bbb12d640ee3d5b92a0b5615910c0042d07ebe | ORPH
     aarch64 |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/cbed39597d6c42f679af20a812f556bed2ff231e |     
        or1k |                 qt5base-5.11.1 | NOK | http://autobuild.buildroot.net/results/076a392080330eabb0dd3cc22fae926d8c22b020 |     
        i686 |               wireshark-2.2.15 | NOK | http://autobuild.buildroot.net/results/b0c31409f53c8698fa42c05334fb638545f9e11e | ORPH


-- 
http://autobuild.buildroot.net
