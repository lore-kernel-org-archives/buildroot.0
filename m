From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 08:28:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-12
Message-ID: <20170413062822.2A2D12084E@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-12
================================

      successes : 229
       failures : 58 
       timeouts : 0  
          TOTAL : 287

Classification of failures by reason
====================================

                libselinux-2.6 | 12
                busybox-1.26.2 | 7 
                 xenomai-3.0.3 | 7 
           uboot-tools-2017.03 | 5 
                 binutils-2.27 | 3 
                  samba4-4.5.7 | 3 
             bluez5_utils-5.44 | 2 
openblas-f04af36ad0e85b64f1... | 2 
                  readline-7.0 | 2 
                  arp-scan-1.9 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                libmpeg2-0.5.1 | 1 
                 libxml2-2.9.4 | 1 
make[1]: *** wait: No child... | 1 
                 mplayer-1.3.0 | 1 
                poppler-0.53.0 | 1 
                 qt5base-5.8.0 | 1 
               qt5webkit-5.8.0 | 1 
                  quagga-1.1.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    sdl2-2.0.5 | 1 
toolchain-external-codesour... | 1 
                  trinity-v1.6 | 1 
                     xen-4.7.1 | 1 


Detail of failures
===================

         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/d22751f764257d680a9ec53e7168c4cdcdd8b3f2 |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/aa370c74131e1a1cdf46db0cb260296201937bb9 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/4ba32459cdd36c3cacfc8b170229bf69e3bb92d0 | ORPH
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/b0310710809d96fb1f3857977cd67a513fa2546c | ORPH
    mips64el |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/7e3d55da5f809e83b3deb1428d6e70ecce0626cc |     
         arm |              bluez5_utils-5.44 | NOK | http://autobuild.buildroot.net/results/1d9551400834735e91c735f69b3e4273436c5a35 |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/d77bd2c401f659078347ee18551842d122db5004 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/89b4152fdff0a4c215de6a23a0d7fd7850375e02 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/8fcc9350a62ba35e710350a8df07482c729e0b9a | ORPH
        i686 |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e1d7ce85104637d3d73577b955352a69249a7a75 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/84bdd480148410d7fce9c078a026cb36197c1708 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/9cbca270116e2957b0d73aa9513e0c91ac076f62 | ORPH
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/6fb8995a5daf9c7780fa0bf8571f219059c99779 | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/7091d3020f79c6e1ae70fe492ad348aca7c9d7d8 |     
       sparc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/6927b725e59bdcfb25f34370c0617b495e04df4a | ORPH
 powerpc64le |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/01a06c853dc2c92bdc584cd24b8365c875149447 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/13823b231f4c205672a96fc039edd51cbe997fae |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/f008ef23c5fba53aacd079d62fb2af78741265f3 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/534dc7c176e7e0969c03bbadd8c1574af81927e2 |     
   powerpc64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/a465498654456dcaf18a393e5e40dd0ba9db7005 |     
        sh4a |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/0e95c59be6422b7e1993bbba461d07be18963d0c |     
      x86_64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/fced1a65e7157bf9d26f06aa35364f86a29a9672 |     
         arm |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/0652039e7a79daa31a43e53e8dec55ee57385260 |     
      mipsel |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/189523bf44320fcbefe2598603430b47f52480b1 |     
    mips64el |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/6ca30aa084474e0225d8080063d8af41caeee2c9 |     
     aarch64 |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/fb825bed952060f58f4673c9bb10ababea4a32bf |     
        sh4a |                 libselinux-2.6 | NOK | http://autobuild.buildroot.net/results/c06c8e6ba7240caf1e2849ae31b7b584b89638b2 |     
         arm |                  libxml2-2.9.4 | NOK | http://autobuild.buildroot.net/results/89cd216a904c6abe2064751f7242ef723aa01365 | ORPH
         arm | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/8cb36f5cc3dd8502b6ae0224bd8f0e35fec0041f |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/e271b246361fcf854545bdca88cdb463ba33daab |     
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/bd3fc95b15f00ce13191d085edcf9d9389250c0e |     
       sparc | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/a55b19f70a9d3acacf44b3c7df963227bcf1abcd |     
     powerpc |                 poppler-0.53.0 | NOK | http://autobuild.buildroot.net/results/33cc036e025623d1e920aa61b01207e2a413ed7a |     
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/861b495746f0040092c1eb8d5d54eca893db555a |     
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/feb5524dab7db8572d59054106288a7e54fb00ef |     
         arc |                   quagga-1.1.1 | NOK | http://autobuild.buildroot.net/results/2ba4b0a6c6f6b26b8c821f972e388d3749043559 | ORPH
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c51813d88d831e29a044b39e60cd401539ef5c09 |     
      mipsel |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/779c4e8595c66f3fbbfa3b08b84d4b165984425a | ORPH
       nios2 |                   readline-7.0 | NOK | http://autobuild.buildroot.net/results/631716634304ce3c510bc7549a0d5200d62be532 | ORPH
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/6cfea78e006fe91e060d2ebbdc93ca1e0aab7492 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/4c577bb63d32c9b52dfd9da2539ffe8e74d17e16 |     
         arc |                   samba4-4.5.7 | NOK | http://autobuild.buildroot.net/results/bde2839a5ebf13ccc011a99f1007df4bb5ff12e5 |     
         arm |                     sdl2-2.0.5 | NOK | http://autobuild.buildroot.net/results/14c7fefefe897f8d35ab36af5db9ca013f4f6da3 |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/6db8ef9723a669f3821de9836f11d84db7b43c56 | ORPH
         arm |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b40d045f41dc4dbc66d5092ea5e9e045cd825e31 |     
      x86_64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/66da69e86d57c434092d803632eb6f8ef6ef3f6a | ORPH
         arc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/e5db812f799ebc5fc5121d0ffa5b0dac8d4634b0 | ORPH
         arm |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/fffca0cc3338de28c466b78a20660098f4c32c1b | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a40273f4dd894f1311a06552b962a89cc31e0be7 | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/a2e40961cfcdb67eefbaf9e3c4b1591a222c2da6 | ORPH
         arm |                      xen-4.7.1 | NOK | http://autobuild.buildroot.net/results/c8c1b3f5df59e227f561786c6b7e430ee66a1240 |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/1a9c83c6769452b49f11133800d2472bcad1712f |     
         arm |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/8fb484738bce06459853084e141daf5e4e75cc51 |     
      x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/f001e54725bf4f1b751cd9bb652c883261a6f608 |     
     powerpc |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/ea6d9a1451a09d391a224fe3f84be2f04f209dbf |     
      x86_64 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/674d1a928456252ae2379e0da99da4106b86c627 |     
        i686 |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/d828625fad7aab9f4a464d1e80b51de32da234a7 |     
        bfin |                  xenomai-3.0.3 | NOK | http://autobuild.buildroot.net/results/6f9fe6e0b867af256307f2c267c08af6c7c246a9 |     

-- 
http://autobuild.buildroot.net
