From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 25 Apr 2018 08:00:41 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-04-24
Message-ID: <20180425060041.2D183207DA@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-04-24
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  21 |   2 |   0 |  23 |
      master | 211 |  46 |   3 | 260 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              lynx-2.8.9dev.16 | 1 
          usb_modeswitch-2.5.0 | 1 


Detail of failures
------------------

         arm |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/ba1f1d774b8cbc5c718adbcf7f5e897815326dc8 |     
microblazeel |           usb_modeswitch-2.5.0 | NOK | http://autobuild.buildroot.net/results/1cdbfc11233995f0e10d426ea16809fc4b48f76a | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     lxc-3.0.0 | 10
                   flann-1.9.1 | 6 
                  udftools-2.0 | 5 
           libfreeimage-3.17.0 | 4 
                  host-go-1.10 | 3 
                  zeromq-4.2.5 | 3 
                  flare-engine | 2 
               log4cplus-1.1.2 | 2 
reaver-9bae55bd30b6d46b42da... | 2 
                cifs-utils-6.7 | 1 
                    gst-ffmpeg | 1 
      gst1-plugins-ugly-1.12.4 | 1 
           host-mono-5.4.0.201 | 1 
                   jamvm-2.0.0 | 1 
              lynx-2.8.9dev.16 | 1 
                  mpd-mpc-0.29 | 1 
              openblas-v0.2.20 | 1 
                qt5base-5.10.1 | 1 
                snort-2.9.11.1 | 1 
              wireshark-2.2.14 | 1 
                   woff2-1.0.2 | 1 


Detail of failures
------------------

       sparc |                 cifs-utils-6.7 | NOK | http://autobuild.buildroot.net/results/e3ccbf5628170bc1828be5a85b5227ebac144477 |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/040e5b2b862bcf964b1649cd412a769d57af562f |     
      xtensa |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/02d0abcdf61190e1f964533d5eee31bc90f79411 |     
         sh4 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/02ec317c68ed6b142c6163568c689cbc3473e7c2 |     
      mipsel |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/5c23c86912fdaa80a23cf51d7c21b05bd0898222 |     
    mips64el |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/e76ed7f4ec306c3ebd6673daffa230ad699a4319 |     
     aarch64 |                    flann-1.9.1 | NOK | http://autobuild.buildroot.net/results/fe245c65a9c6de3890348ab99526600f26086bce |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/03dcf316f42e467e9312cc5ecd69e503c3b8b90c |     
microblazeel |                   flare-engine | TIM | http://autobuild.buildroot.net/results/30e1a93e4dbbc4f672c6158b9fa7e674cf2226d1 |     
microblazeel |                     gst-ffmpeg | TIM | http://autobuild.buildroot.net/results/1e48acf7a848867d70574fc7f2ae34b9c037b533 |     
microblazeel |       gst1-plugins-ugly-1.12.4 | NOK | http://autobuild.buildroot.net/results/f5ce8fc62c3347cfe479b89916f6205bed91a136 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/c1b39cfd17021335cd66baef55c2ec9b657efdeb | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/5b756020585020135f428f50b6415f8d658051fa | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/8d7a92b89c30fb6a4c94a2eb145b5a4b6e7ba20f | ORPH
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/ac8ca7573d34d05a0e1ce366ef4c2309d1c9a9c5 |     
      mipsel |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/544b23e68643fd906eb8a87fa5ba176bcd1cb8ce | ORPH
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9a02df88e63f8b5ab0fb657f1c7f92db82da0046 |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/57c23a7ecc21f55a84eb44a6aa6cc962e30cafaf |     
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/139e2889679358adf5ffe2f2245c028272504ebb |     
     sparc64 |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/9ec8c7e3223168a16c7460cb0de6246201a82e92 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/c280607f58930089bcb14cd12fe73e5650d96542 |     
        m68k |                log4cplus-1.1.2 | NOK | http://autobuild.buildroot.net/results/c808ffc79cb143483fdd92cf81fef02b7f3a3b7b |     
    mips64el |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/6e5ae0dbf67dcc0f7827999b91118e07147ac0ac |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/a8f0fd6db1070efa3e59f373202c67d669368142 |     
       nios2 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/cc1c5c29eb20d0ddeb5c43af01bcb1954d134ff9 |     
     powerpc |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/947b4607e31fd34847fa2dabc560c2f8b863e806 |     
        or1k |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/5a549fe4a32616dcc6f62f07680f62d6c850bc26 |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/436b2042475f7faf9da6280d5bd0ddadc78d20e3 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/dd69f00a43403856db8b82001664ebd0ef1a7a4f |     
         arm |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/0b0acb4bd480918f1da4d9e7117468d15c071d41 |     
      xtensa |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/3d0cb5feb7f5a1eed5836b97517d4db651cf6b5f |     
     sparc64 |                      lxc-3.0.0 | NOK | http://autobuild.buildroot.net/results/2e1ca54d08991c809b1ada4f45139bf7efe0813b |     
microblazeel |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/4de50b6eed480953f0e047f05bf06a77cfe173ce |     
    mips64el |                   mpd-mpc-0.29 | NOK | http://autobuild.buildroot.net/results/f6fb834f0c2b3b62e0c1fadc14f8b719e793cbaf |     
         arm |               openblas-v0.2.20 | NOK | http://autobuild.buildroot.net/results/66385d27421f3b8fccc4af2b7341c93132eed16f |     
microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/27cd3b5c34c97768aa02426b698a94becfb7dd56 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/9ab03aeaef4faacfa3e10106574b5985a47db662 |     
         arm | reaver-9bae55bd30b6d46b42da... | NOK | http://autobuild.buildroot.net/results/35c4ce28c322da03ab18c89e56e0e1dc6d072a02 |     
       sparc |                 snort-2.9.11.1 | NOK | http://autobuild.buildroot.net/results/289ee9ed2f896330e96f7df0efb50c3164818da4 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/f10c852dd9a1c553cfa8561a02f9ae4511f8b0b1 |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/ae45e33b9ef2c6bf620184addaf47ba783765dba |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/9873e412f8e2299e4182d62e2ad181f7f0550bdb |     
        i586 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/2c5e86d189388f1b659b7d1b85f7a95891f60b3f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/5fca8f1af7c82b4108097cffc186eaf359598253 |     
      xtensa |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/1e95df05077bedea0f4646cc6624ec863fff3ab4 | ORPH
        m68k |                    woff2-1.0.2 | NOK | http://autobuild.buildroot.net/results/cd88d2df8aeced4879b0af1a011551c1c5e6a79f |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/53c80ca6f22275b8f0fbf44ebd409b5072e046df |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/ac071a7736c07859adde8b54ba4cdf7878b8b7c8 |     
       sparc |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/0bd053d0b729a8e1a4ef234c33becb9ccc91cc91 |     


-- 
http://autobuild.buildroot.net
