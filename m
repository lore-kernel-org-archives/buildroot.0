From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Mar 2018 08:00:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-22
Message-ID: <20180323070009.1FD66208B0@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  30 |   2 |   0 |  32 |
      master | 220 |  92 |   0 | 312 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                     php-7.2.3 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9e1c8175bf4d2c653b3c4c730ad80e71eb24c3c4 | ORPH
         arm |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/04eaf3145966c72dc0ef8c927312851433ab8e9a | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                tpm2-tss-1.4.0 | 31
              tpm2-abrmd-1.3.0 | 18
               xfsprogs-4.15.1 | 10
              keepalived-1.4.1 | 5 
                       unknown | 5 
                  host-go-1.10 | 4 
              tpm2-tools-3.0.3 | 4 
                    liblo-0.29 | 3 
                  udftools-2.0 | 3 
            safeclib-v03032018 | 2 
             bluez5_utils-5.49 | 1 
                  boost-1.66.0 | 1 
                  flashrom-1.0 | 1 
                   qemu-2.10.2 | 1 
               qt5webkit-5.9.1 | 1 
                 sngrep-v1.4.5 | 1 
                    xen-4.10.0 | 1 


Detail of failures
------------------

     sparc64 |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/c7b1af8b94580cf5d3ad5c2291e8aacb07603b6c |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ba889ecc46b7b5f8b08171109becee4457dadb49 |     
        i686 |                   flashrom-1.0 | NOK | http://autobuild.buildroot.net/results/1a0f4d425ccb627e32b40487032d4cb51be9e271 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/82baef64b66b72474bae1e4208f68ed16b2cbf3b | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/799b5daaef97b2c420d67c2949bba64fde9a6374 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/ca8ee6d31159bde44a8334369ae46f37fbab7f62 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/b178f409b96bea5ed92471fba32420b1d6a25edc | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4257bb8e857e8a38f3c5819ba7a198201825981c |     
        m68k |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/b3c7a7a393c0c7b723e37d5d5417255f2a58c4fe |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/467a2db1b0035ff7516ac5fd1b74d703f4ae9379 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/6040194b34c70ce424ffab67d6a4045abd1c3f38 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/14fb158ac2a93530dea5adc8e3ead4b3cd761939 |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/c7225ac144f15e49f45186a8fbcf5f0227aab2fb | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/1e628e66aacaa7e1c90c9b7751145bb46fbe531a | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/c6c7c41b722f92216abf2a5e9e02f576c4d1b39a | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/a8e1e47ed90ab54d47df27dac82640ff0903581e |     
      mipsel |                qt5webkit-5.9.1 | NOK | http://autobuild.buildroot.net/results/417b648cfc4dc9ff85f89f75f8c60be6a77a1a53 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/2fea680b2bbeb3d6f46a7f4b5dd4c60c5aa77c31 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/94a42e879cce5d9ab1cea4ad779693300ae62ffb |     
    mips64el |                  sngrep-v1.4.5 | NOK | http://autobuild.buildroot.net/results/213d40845047087bbb3e1b5e10adb57de5103a68 |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/200e70868d0083bcf6f764351603bd1a8f0211d3 |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/613d4465848c11a9b228a75391834e0816e0ca6f |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/da409efaa46f3090eb694a1dbc1ea75be6b973b9 |     
       sparc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/c33a0a522988dfc659b6b77c1495899c7a40825e |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/65643b2d7ef4f924704a97a8ca707c1756ac0679 |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/cc4195271ae3442c5a18316cb6eff3528b9cb03f |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/e391d0f4655009d77ca0fbbcb97b2a723a8dc9d3 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/82ac9055b56ea730df0d549426301e2016145e6f |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/6300624ec36836873ea032edc1b14fd84780fbcc |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/76f6a5a150892282851e87d049eb347ecb0e9afb |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/9198ab5c66d7ed24f5f5aa8dc398faeb6736bf2e |     
         sh4 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/2aa0a8e6b8bbc9c4f5742fd4b70f0a9afc8055b3 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/23e89644f45cc403faced71ce5814639df9a04ef |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/a3726d50661ab0711458c641a27659f23dddc986 |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/709e2f4e0074420bdea0e5c0c0f4f059af71fa3f |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/59a8872e047d065cd8185f2f5abff3daf4ec223e |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/4d7bf2f8aa018e25f622e39c284daf5a8d8ae5be |     
        i686 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/08de156a4da21d2df5bd3e0a05a50754529ef06e |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/3775cc3d7e43eaa1fa7aa09b5cb2c05ac17de848 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/71bdcfbc5664b50d18ad4e8d4c56310081765ed6 |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/af848276281cfbc020d9c998d0e5a9b450395263 |     
        mips |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/b4fee2cfe505f692c9d2cd8341919b0fe69171bc |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/28d702dcedb080a61ec0b0822a851f50b2d407a5 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2524ab5f112980abf1f1b8d03003cbb967df164e |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/67aa36a532cbdb0334a9a8e8aff820bd2550e0b4 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/9b3312959eac74bcfa5d7da32beaf7eca8c7f2de |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/1cc052c421bf2bff73e59644df364053091882c2 |     
        i686 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/997cf4bf753971b113a699332fa6dc88e12f8094 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/e3ee8264e735ef1a19834641f8826e965e8d9165 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0d81b85f78d7affa785951412fa6a040bebd3320 |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/60361528a59b4ccb9b379d1006415cf0e12f28c1 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/714ab9f7228b17763983a089a3666bac0ee169ce |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/1fb77081c6175c3ec660e08efb053cb467ac78c1 |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/775af333d30b4e7bb39bd9d34756d42d3de34442 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/175ee64a4300f0baa6927d02b501516f36902a8c |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/d4e21ef1b42eb0c6cc9f4f8afdad3098d187cd19 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/584c463ad4e69b840d75bf204492c8ee56a8c8f1 |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4fcad4630652fe89addcdb54d4216ecbd7a4f31f |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/88a4e1d9f16a8cc40e357d41356f980fc1c5d11e |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/e8c3bc3002557e8a841987822ca20c0a69561c88 |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/aedd6f7472974dfc37f096ceb125031c5ddfb017 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0dc1721c23b5aef9005c4922efd2cd6c9af6d805 |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/477e7823c39a503af078efb1ef13094a7ba2cfab |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/648035febdc7d7d9398a65f25e7eb1f1ee7c8720 |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/c327f4e593662b8f65ac282c9a4a2b008c6fa37f |     
        m68k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2ca44ba606430553dd49151ef4204a7f17485c0f |     
        i686 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/fb66f9ccf80542496b9fd8d7f172efe941df6029 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/765bdbe39c300e14fb1c2aef51b6913a79f7a812 |     
microblazeel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4fe4db75252aebe381091977bc8863348684b407 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6ae7be7f8c8cc4a3137cfeaa9bdc6c80e3280e02 |     
        i686 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4c0bf6f5b5f473b80655e1ac76b82d821a1dd546 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f3d2d9b46903f894e8204fb1823a7c86bfef66b9 |     
        or1k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/64ccb9de66b9ef55314ac082ec8cc62f59ae8494 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/bffe4b691fa66ea6e640af280d530c2f0010bfd6 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/b1bb99995ff13146171e25e6c33d1e6e00d212e2 |     
        m68k |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/245c89b1c6bea489dcfbd515d27c78adb8b3ba72 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/70e1f78ed1bc49791b70594ba4135a4fb7c61219 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/75e547c648aa060eb0ffd1c73d98f544968bbab4 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/6c9c695e5e7b5c3bac705be3926a43539b8a3a42 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/2e03eecb0f076f7d516f1389b5d2c492e31295d8 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/698c6e5d3fa8f2a1dd268bbd0b2ffe83084c4c41 |     
         arm |                     xen-4.10.0 | NOK | http://autobuild.buildroot.net/results/04099a067a38c0f71f62f8c0fe6f5069ac09d5d6 |     
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/1ccdaa9f376581cb19be8ecdef28726c90648f9c | ORPH
        or1k |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/3152e1bc69418603ccca417b37ae58d48d7d7410 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/33acd740fe74e5417f4e385cfb867e886e4f7fdc | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/b22fcebaad7d7c463ab897fa389ec66699aeeb6b | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e7746afdb1861935f86e39a482d3aa7013a8ed73 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/09843362f8f741c252d3a0bbef097a51f3a39212 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2cfcaef6d3e9e44a60bac1badef4231f47401e5d | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/15cd090c10f4a927337d6414411b9f76337b0da9 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/230d928d0eb3e1152d05204d28d6babd33959f46 | ORPH
        or1k |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a01c5ca76b1155d6cba97a547438cab40f6ee2de | ORPH


-- 
http://autobuild.buildroot.net
