From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 04 Apr 2019 06:00:33 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-04-03
Message-ID: <20190404060039.31373862A9@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-04-03
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  38 |   3 |   0 |  41 |
      master | 255 |  77 |   5 | 337 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  rygel-0.36.2 | 37
             dbus-python-1.2.8 | 10
                  ffmpeg-4.1.3 | 5 
                   netsnmp-5.8 | 3 
                       netsurf | 3 
                   netsurf-3.8 | 3 
                qt5base-5.12.2 | 3 
           bayer2rgb-neon-v0.4 | 2 
                host-go-1.12.1 | 2 
  vdr-plugin-vnsiserver-v1.5.2 | 2 
               wireshark-2.6.7 | 2 
android-tools-4.2.2+git2013... | 1 
                grantlee-5.1.0 | 1 
                host-libsodium | 1 
        kf5-kcoreaddons-5.47.0 | 1 
                  linuxptp-2.0 | 1 
                       lmbench | 1 
                   mimic-1.1.0 | 1 
                   mutt-1.11.2 | 1 
              qt5enginio-1.6.3 | 1 
           uboot-tools-2019.01 | 1 


Detail of failures
------------------

       sparc | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/d75a6cf99f58fb5f42abaf9d54cde28224bc44fb |     
         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/62ead69777d7b65f78875c4e39087791ef82d78c |     
         arm |            bayer2rgb-neon-v0.4 | NOK | http://autobuild.buildroot.net/results/c84b65642cb1b2d246f3a92ac957af5c5fcb86e8 |     
      mipsel |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/4078ee9e8aa304f044dc92e9345c28341349d468 | ORPH
         arm |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/4500ba54cdf18913154ed1f2b2c634c6a2f90b41 | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b2f67f0a99d93749491fad7feb9848e32d49043f | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/2ddd1d12db1f971a66261638c263c9fd84596311 | ORPH
    mips64el |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/0025c966ecab7ea876578056f1d3dcfc0a07cf2a | ORPH
      mipsel |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/42f08fa572bb97563e5ac288137a25e5dd2e1782 | ORPH
      x86_64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/6caf71efc3ec434a3074812a1746cfc144cd1509 | ORPH
     aarch64 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/81a69efd0648a016baebe93ecc3bd4ff80ca9aaa | ORPH
  aarch64_be |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/b2a6cb4132a24edce4b150a5fa13e6bb3c5c8d6c | ORPH
       nios2 |              dbus-python-1.2.8 | NOK | http://autobuild.buildroot.net/results/8ccd2ffddf976b926a9d5f369fb959832b51b1aa | ORPH
    mips64el |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/fe8ba64e5fa0735a3105e53d39813ad42c4ee050 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/1a237e773100903d0af6860c8d8b95d4efa15938 |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/34b699405396cff6e15f6762a2f44fdfc23721cd |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/220f14ffaa8364fb7aab415202e496b478eb8dbe |     
      mipsel |                   ffmpeg-4.1.3 | NOK | http://autobuild.buildroot.net/results/75126b04a67c65699bf8eafc97f4febb4458298b |     
      mipsel |                 grantlee-5.1.0 | NOK | http://autobuild.buildroot.net/results/90e7823e0c8816faf0c54e3f108a629e608abc22 |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/5f7c84b16f045747946083b6dbdc41ab3e4f47ef |     
         arm |                 host-go-1.12.1 | NOK | http://autobuild.buildroot.net/results/9501fa15f0317dc0c444c08c2822c5eaa5ac58a6 |     
       nios2 |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/1a46bcacaf88e2bf98248d8e15289b562b823466 |     
       sparc |         kf5-kcoreaddons-5.47.0 | NOK | http://autobuild.buildroot.net/results/2248f37ac0caa4abdf0abe7b4b14690cd3015e52 |     
     aarch64 |                   linuxptp-2.0 | NOK | http://autobuild.buildroot.net/results/efefc077cde2f2a89aecf14c1418be921a888533 |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/a7de21702b3853c45d1566e9d6825a5fe8811ce7 |     
     powerpc |                    mimic-1.1.0 | NOK | http://autobuild.buildroot.net/results/6e4552f1c955856a1b9c3b670a4b2e54cb349a26 |     
    mips64el |                    mutt-1.11.2 | NOK | http://autobuild.buildroot.net/results/25af03da1ef1ce1c7773827b3668eb970197b4cf |     
      x86_64 |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/fb20deaab79d99a93319b848b533271f0e8907cf | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/b691653096bc87c7cb3c6177b287f413a60550bb | ORPH
         arm |                    netsnmp-5.8 | NOK | http://autobuild.buildroot.net/results/e5ca26c1635172b2285cbc43565515f4a2f91d1b | ORPH
      x86_64 |                        netsurf | TIM | http://autobuild.buildroot.net/results/e491b879d5daad4072e2ddfa7753150e708408bf |     
      mipsel |                        netsurf | TIM | http://autobuild.buildroot.net/results/78566fe84958afd7746dc749a6c7e45901923df6 |     
         arm |                        netsurf | TIM | http://autobuild.buildroot.net/results/0c834878f8366ec38131fa91872f7533af772605 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/960d7544759beb22e4f4ee424395bcefdf86bf5f |     
microblazeel |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/1408d896496a82a4ce66fa2e5b00b12c3f5e7701 |     
         arm |                    netsurf-3.8 | NOK | http://autobuild.buildroot.net/results/3f810b35a9dc35a7e91d6c67653d95520c667c95 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/791be605152c0ba63037c5cedc745fe8b5e97906 |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/c1891819048ce02446a75e2789ea72402763b50e |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/def1bde9a642515b4ad790bd1635aab7df7e0925 |     
       nios2 |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a7150749a217d4da0c29cafed496851c414cb10f |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/ed80c42481e67037cc7a7357f08775dc22834361 |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/77b1854c914915d3205d915a0f01001f6f3555df |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/8a651180556d4d646e6f44de9025cbc5daf199e9 |     
        i686 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/dd22ded69645c20ed301cffe2466e2f8efcdeadc |     
     riscv32 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/1e7ad17beb36834809f59f5c03aee7ec93ebd31c |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/077fab3e0e88034e07a5b0e12c102c41ada1caf2 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/614a6509b84d2be144082fafb8ea67013a9c3230 |     
      xtensa |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/4a086e066e11121785f598e4889d7980fe1ced5b |     
     riscv64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/254a516ff85fddce2051035b0f90accae6a9b7b2 |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/11f2c21170e194a92fef15afe3ff18205866699e |     
        or1k |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/555f72758a380f29c765e46d5881d080dfaf9fb2 |     
     sparc64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/c7bfe4d3fec87fbea876eb5714b2fcfa88b56e69 |     
      mipsel |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/14dd64a8fe3efaa1de86358ab46b216d168e5131 |     
      x86_64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/cee82fd7223979583095ea25dc499d473a73f6ac |     
     aarch64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fa61b2f3c0b56658c63fa3e5d27ba39f0f0f933d |     
       sparc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/b8eb38a34a3104b87c69fc2243433d67c2ccf06d |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/3770f6b07e277689dec49d0ed4372452c4f43e19 |     
  aarch64_be |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/173cc17fc9722f216394bf4606ab3bac9c2f372f |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/04c90f86f22183750d2d964138d6f4b01dd9bb84 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/e570ede99eb2b5062e405b25ed5302f5d19bf785 |     
      x86_64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/eb25a10ca2de456193f0448fe0cc0b635e1db91b |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/58a9d07cc6087afd01b90da73545845930372150 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/d535c35c9049401c37177758bde62856d1f52258 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fc935df981bf0c0a7048e3ddbb70a66d0d94b43a |     
    mips64el |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/fceb90e44232ac012672a619564e28280a6e5467 |     
     riscv32 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/f0df6d6a2faf5ba721985a96804dfb9ae1c94ae9 |     
        mips |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/1ee79aba37e0c921aa9c2877289c293abb16c96a |     
      xtensa |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/76a1bf9a77478b2711956c5d519df7f9c6cc665d |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/c81d196cebb17956bfc90a71d2c8ec464641e5ef |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/1f0ec43e034a589b074240fd54001d3771aa7a37 |     
     powerpc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/2de68070916f0308e12f458d1864e961cc811749 |     
         arc |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/34f214d62fee53e7296d58b3a846abde8d629f30 |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/6f33175a5776fe9d569802c7b047b2441a7683dc |     
         arm |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/60e36a53918d7d1d1717a470c4a7cdba678a093e |     
        or1k |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/5dfdc8cabe4456d9c0c060d74e16cd240a9c4264 |     
   powerpc64 |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/42bfc2a8cce31263e0748c9aa3678648162b38ba |     
        m68k |                   rygel-0.36.2 | NOK | http://autobuild.buildroot.net/results/81ce9667e7b73561794bd7745cd9ea566ea96385 |     
         sh4 |            uboot-tools-2019.01 | NOK | http://autobuild.buildroot.net/results/ba1294a850802145bc59738b7321ba4c69913fa3 |     
     aarch64 |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/abd7a94acb7d4595b4f93c5c6c3a6ba8ffc199e6 |     
      mipsel |   vdr-plugin-vnsiserver-v1.5.2 | NOK | http://autobuild.buildroot.net/results/9080adabdfcd960bce1681414cb0d7f43e465a65 |     
       nios2 |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/b0a2b31800b89dd14e01897d6ba47e779146a414 | ORPH
     powerpc |                wireshark-2.6.7 | NOK | http://autobuild.buildroot.net/results/754f68d017ecb469a3460774b39f97cae272ff6e | ORPH

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                qt5base-5.11.3 | 1 
              qt5enginio-1.6.3 | 1 


Detail of failures
------------------

      x86_64 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/f58ba00ff8737eb9f3ba5f39a1b6eea4afffd48f | ORPH
  aarch64_be |                 qt5base-5.11.3 | NOK | http://autobuild.buildroot.net/results/28f7da3ff119745cbb41063e64ecfe86d1b39f9f |     
      xtensa |               qt5enginio-1.6.3 | NOK | http://autobuild.buildroot.net/results/a4923bfd8bb8ffae6472724e36e43eada4e5b838 |     


-- 
http://autobuild.buildroot.net
