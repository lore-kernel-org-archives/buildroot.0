From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 05 Jun 2019 06:00:43 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2019-06-04
Message-ID: <20190605060053.A522985EBE@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2019-06-04
===============================

      branch |  OK | NOK | TIM | TOT |
   2019.02.x |  25 |   1 |   1 |  27 |
   2019.05.x |  13 |   3 |   0 |  16 |
      master | 178 |  45 |   2 | 225 |

Results for branch '2019.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.12.2 | 2 
             host-cargo-0.26.0 | 1 


Detail of failures
------------------

     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/bddc9039406f521c1f90b7894d1f57f1231723f6 |     
  aarch64_be |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/24008204dff8d5d9abdde2c69d9995de8b9c23aa |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/3d10c81f46abfb3c2d7caf512930a318c5f2050f |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

    host-mender-artifact-3.0.0 | 18
                poppler-0.77.0 | 8 
                openzwave-v1.6 | 3 
              domoticz-4.10717 | 2 
               host-efl-1.22.2 | 2 
             iputils-s20190515 | 2 
                   libva-2.4.1 | 2 
  vdr-plugin-vnsiserver-v1.8.0 | 2 
                     vlc-3.0.6 | 2 
                      gzip-1.9 | 1 
             host-cargo-0.26.0 | 1 
           host-nodejs-10.15.3 | 1 
                       lmbench | 1 
                qt5base-5.12.2 | 1 
                         snort | 1 


Detail of failures
------------------

    mips64el |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/f5a7fb972666abd3e0cddd9c3fc814ea9504420a |     
         arc |               domoticz-4.10717 | NOK | http://autobuild.buildroot.net/results/d1692baf024048705f35a6cd709b2333823e2814 |     
         arm |                       gzip-1.9 | NOK | http://autobuild.buildroot.net/results/1237a4ff0267cb879f59489e1dafdc2374bb1d19 | ORPH
     riscv32 |              host-cargo-0.26.0 | NOK | http://autobuild.buildroot.net/results/6faab7870b36ade701f13d5bf303846fa6b5021f |     
      x86_64 |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/b9cc40b4079ba5e78e0582146d29c7a6cfe4027d |     
     powerpc |                host-efl-1.22.2 | NOK | http://autobuild.buildroot.net/results/537490738f1f129486d53122852cbc2e6ebef50c |     
     aarch64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/69399751434badd2f9ff146d2790ee13bfef3127 |     
     sparc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/293d1d039f533413ba21f3372337bacbe586d754 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0fad434ef0723877cf0da3259a7c8dec773bc4ec |     
   powerpc64 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/851f54609124f17bc76b2607db6be07158ea91f8 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ff5fea5029bc2d7719ee10f9c2964b7c6f782767 |     
        mips |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/9eb3b437e83737e5066137dae51b091a8c31e65d |     
     powerpc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0fd107a2b56d26dee3a2215d7708d4fc19404deb |     
        i686 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/0360cd9881de77c0a873f4cbb33118530ad9bbe0 |     
        i586 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/8e4fec1ade3fd05a3892e38954ff61eafee2b487 |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/89c17f4d68b5c4d7823d74f57f0412c37bf1d9fb |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/99992116da90b342e932e3930b825aa19a12ad2d |     
      mipsel |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/607b8f8fb6cd34b8ab1ebb18b3595b75eada9db8 |     
         arm |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/b436d50a11687afa7021efc7eedd24fc337b0994 |     
       nios2 |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/dd50002818c37bb043c70fa200d11e6ddb133fef |     
        mips |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/05ce7634035782495677f001cfbf68e872accceb |     
        or1k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/4ae5e067fd9bc9415e16b8ecbc635582ae1cb50f |     
        m68k |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/d1eba4b039f5ed6dded620f12fbb68843627f316 |     
         arc |     host-mender-artifact-3.0.0 | NOK | http://autobuild.buildroot.net/results/ed50715241b226a4cc3357a541cc3e839a81c3df |     
      x86_64 |            host-nodejs-10.15.3 | NOK | http://autobuild.buildroot.net/results/3f9e8783176165539e128c7116e5aabc528e3c4a |     
     powerpc |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/80eb23a784c1636914bcf098f81c5f4c15a7e443 |     
         arm |              iputils-s20190515 | NOK | http://autobuild.buildroot.net/results/48aaf8d3f48d977d1b60c82c2aca7783e3bfe5bc |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/1068855eca14c5c386b6c5ed81495137aa48983c |     
         arm |                    libva-2.4.1 | NOK | http://autobuild.buildroot.net/results/4fda331a19ea1c41157b5e01fa4b3dca8c005dbb |     
     riscv32 |                        lmbench | TIM | http://autobuild.buildroot.net/results/0731abc85ef509c5b78f35d369d086d51ff0d04e |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/44f9ec8545635c64e1b6cfa7784f3dba9868595e |     
         arm |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/e82564721a2b132b5bbf271628c11f9c138f9223 |     
        m68k |                 openzwave-v1.6 | NOK | http://autobuild.buildroot.net/results/56a4d674f585b338d25ae11b3d884ad8798c7478 |     
        m68k |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/01d8b1a362bc54144261c342a608f197692ef4fb |     
       nios2 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/6383d64356a4b105de59ac4f17ead66b07ccf02e |     
     riscv32 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/87d4c851cfdf0f5d36ee50c1fc26bce29a9b3420 |     
     powerpc |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/3aa94c10cfe63195c1d5a0ad559a576e229c4e0d |     
   powerpc64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/a4c22cc45deeff1aa5ac36cb23748c6979389ae1 |     
     aarch64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/f546aa80554c8e30f20a3f6a6361a227d0e09ac0 |     
     riscv64 |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/6789e69d1bdf63b5691c0d024834258d99b42e18 |     
 powerpc64le |                 poppler-0.77.0 | NOK | http://autobuild.buildroot.net/results/91105da84249f3610e4e564f119eb27955c0184a |     
      x86_64 |                 qt5base-5.12.2 | NOK | http://autobuild.buildroot.net/results/7eca9e48ebe86916a1d5b9aeb16ac0d1e046c412 |     
microblazeel |                          snort | TIM | http://autobuild.buildroot.net/results/d2412710f6cfbfc069e7858e507e28555baafa3e |     
       nios2 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/04a3acc86096d1ded3dc09ed1ae5eace0b47b2e7 |     
     riscv64 |   vdr-plugin-vnsiserver-v1.8.0 | NOK | http://autobuild.buildroot.net/results/c9c4ff128b823b3e9b9518f90fe778274a2efc4d |     
     riscv64 |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/24b85544330a963547a38c050075878fbe627aa8 |     
    mips64el |                      vlc-3.0.6 | NOK | http://autobuild.buildroot.net/results/7ebeab5d7b84b414aa5f6b8b3e0728dc42914f07 |     

Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

                   glm-0.9.8.4 | 1 
                host-libsodium | 1 


Detail of failures
------------------

        i686 |                    glm-0.9.8.4 | NOK | http://autobuild.buildroot.net/results/a195496d0d500a2510944d9a349a6234c9e589b4 | ORPH
 powerpc64le |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/0ac338e6e49f73e1adfd20c46e1aee2ec8dc66d2 |     


-- 
http://autobuild.buildroot.net
