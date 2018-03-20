From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Mar 2018 08:01:02 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-19
Message-ID: <20180320070102.42B2E2072D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-19
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  42 |   0 |   0 |  42 |
      master | 200 | 114 |   0 | 314 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

            btrfs-progs-4.15.1 | 32
                tpm2-tss-1.4.0 | 22
               xfsprogs-4.15.1 | 11
                    htop-2.1.0 | 7 
                    liblo-0.29 | 5 
                  udftools-2.0 | 5 
                       unknown | 5 
              tpm2-abrmd-1.3.0 | 4 
              keepalived-1.4.1 | 3 
              tpm2-tools-3.0.3 | 3 
             bluez5_utils-5.49 | 2 
                  boost-1.66.0 | 2 
                  host-go-1.10 | 2 
make[1]: *** wait: No child... | 2 
                busybox-1.28.1 | 1 
          host-acpica-20170531 | 1 
              lm-sensors-3.4.0 | 1 
                     php-7.2.3 | 1 
                   qemu-2.10.2 | 1 
           qt5multimedia-5.9.4 | 1 
                   systemd-237 | 1 
              wireshark-2.2.12 | 1 
                   ympd-v1.3.0 | 1 


Detail of failures
------------------

    mips64el |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/34ab3c8b5cf90db8db619703e1b1ccb3d391f35a |     
     powerpc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/43a999c8845b9708a6437753512fdfe8de143f24 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d531c1465e1795d47752c77e9998d9b743b8d036 |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/5526f52c18cd581e390670d434ff15336c1e31ad |     
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/651518f12b8a98d53cb5402445a476bd2bf32155 | ORPH
    mips64el |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d6b5fb377f44d0b6eef96c08e550ec7277a9e3cd | ORPH
         arc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/8fe3bfd1fa564a4fd5bea81f11f54f48ec7469e3 | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/6c0bbd2751d805a388aeb7d646c6d85e0c28fffc | ORPH
        i586 |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2d7f5d2b11e0c14b16bda3ae2185dc3d460accdf | ORPH
    mips64el |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/00fc4d447317217079c43b92f6ddbafc4070eeb3 | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/34c0977d29854a87e36ac955d0c3d6378e7a6041 | ORPH
      xtensa |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/9955580b02f3d074d446a30c7088e4ee62ca6021 | ORPH
         arc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/2176960ac71c4a49ceee3ce6058e2312ebd65252 | ORPH
    mips64el |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c908569726eef3c8fbc07e8d538d8ea4bf5e177c | ORPH
         arc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/033676f103eaa9b78175b44df21551d711b2b918 | ORPH
      xtensa |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/72ea3cf5bda8b405ec2cc71955a3a4ed2b597e82 | ORPH
      mipsel |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/8ab93cfb6c2e5f8a1c624e9bb8f75cb2c0c15529 | ORPH
       nios2 |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e474fe2456ec49a3e6e6ee8e22574f8bc92eff4d | ORPH
    mips64el |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/f3f0851d0d1cba6e475a2cff48224a19e62b9034 | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/16a67929b21ea0d5b696bcbe026f05157419023c | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/c5049094f8e101797a4a426aeeaadb36c62a8f60 | ORPH
         arc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/db8b4b313fad5fe1befdc128f188010a26450c86 | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/070100051777c35a44606060847af200c0886782 | ORPH
      mipsel |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/cbec31d955fc5974fb927e722426ae119dcd885c | ORPH
     powerpc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/891d9710ad9424ee281ba37eff8cc7ac76397bb7 | ORPH
         sh4 |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7f226ec99a1d908c6e6bcd2a8c178b83f5eee9ab | ORPH
     powerpc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/5285fcdd7d81aab8824902b5b4beee6e5aa7d28c | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/202dd723546ce94b4777ad5282067c350ac692ae | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/25811282d2fc242d1f5f612b006deedbe3c6e1c8 | ORPH
     powerpc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/4125ad5cd8831bba7aeefabff8fecc9178caeeda | ORPH
       nios2 |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/6aca3ea89979acd38018c820ee24800604e308e8 | ORPH
microblazeel |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/074b8ea250038702feae33974a04f1658b288456 | ORPH
     powerpc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d2aeb76c513f0046a0432947f863963b539d883f | ORPH
         arm |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/6ddf57148d909d6ed6a0d24eb3b04e683510bdc5 | ORPH
         arc |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/5da984e4bf590bf3e1c7374264cc48468db7b8a6 | ORPH
microblazeel |             btrfs-progs-4.15.1 | NOK | http://autobuild.buildroot.net/results/3c771455cbc8460fffab6c4dd9835ee4a5776c19 | ORPH
     powerpc |                 busybox-1.28.1 | NOK | http://autobuild.buildroot.net/results/92add949d01b24638ce6937302fcf8b70b2c92e4 |     
         arm |           host-acpica-20170531 | NOK | http://autobuild.buildroot.net/results/26a8a3f218b6c18d75b23fb380c8fef1cfd60333 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/52397bfb130aa41da3c079635c8c05a3094f2465 | ORPH
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/9ffdc42bb41bfd42e9f70bbff30eb9257fa0ce64 | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7a16028d6bf15f5eb9bb480b55b1e2fec3e7beca | ORPH
         arm |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/1c86b2ab8025a8e7c9183e04cfad0daf7446b238 | ORPH
         arc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/b40d7a9ff8deea4cf8d501485a9778067e29ef17 | ORPH
        or1k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/862d0b05a452a5e1e3ce0ff536d3f5776fb7bab3 | ORPH
      xtensa |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/7028b0a782bb2713b6d67518307afa498585348f | ORPH
        m68k |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/272e4abe76ae789226a1026de6a8db5d83ac1fa7 | ORPH
     powerpc |                     htop-2.1.0 | NOK | http://autobuild.buildroot.net/results/edd6eac46042637b47fc55ab51d4139902c9c089 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/11732e0bc4372d4777734b863b70547580435b54 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/c54af00fe5e6ef279f4dccbc7c42a6f450a570f8 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/1b3208c7ab54dc8939e7fd357240ffd9b46761bd |     
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/23c1d6666f16471a05d973e0bba7152f74a0d4c5 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/bcc67b125367e23e6760a15c3222a0ae1392abc0 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/15f2b50b84cda678cb87d8dd7e73f07d6aee4052 | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/f41928ea254c32189191291434b21efc645153ef | ORPH
        m68k |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/e272c04c245172d418e71f186ea2829a0183c8c6 | ORPH
         arm |               lm-sensors-3.4.0 | NOK | http://autobuild.buildroot.net/results/37d95f35e31116d609e80d13c593d89bde3d3452 | ORPH
    mips64el | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/c13f0cf1d578ed91ce5ee8fd5b80ea30b1552d19 |     
      mipsel | make[1]: *** wait: No child... | NOK | http://autobuild.buildroot.net/results/b1874932ab6b36a3a1f6a33e1a3ab1b6846831f9 |     
      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/44ede76744a265c82d8ecd0e0f5bb5b1a3c4eb05 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/6346b25be2844f9ef722e52040ac1b43d9c38899 |     
     aarch64 |            qt5multimedia-5.9.4 | NOK | http://autobuild.buildroot.net/results/0ba262e7786fbc8e04fde26e473f4ec604789bb4 |     
     powerpc |                    systemd-237 | NOK | http://autobuild.buildroot.net/results/b4ad07353e51bba6b9a0d3fce6ab565d1aecb86a |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/f5d23fcfdfec9b5abba385b8bbab951261a8d330 |     
       sparc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/6a71379d693276f97d3100a9642155d0c55dcc2a |     
     powerpc |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/bf99eec5516a3e28b2edbfd782e3dec206fba1b9 |     
         sh4 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/825405462ab960c22cec2097775251a455c3b61a |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/410735ab71d17adcbde9da0d0f1fcb86c726c1ac |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/c95dd8e57a2736873b23cea5102a4709ee63578b |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/568c76e2c1687b87ea263846c66a68c62ac89065 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/1684bea9825775780e333ee68cc854f2848b1801 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0cd983dbbcb28a70583bb3785ba0acce68e0b57d |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ed0ef3f32d4ef3ca00d8385b90cf1bc8a4df31ff |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f078b407c617e412d4cba52345fbd92757ea7703 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/1d756bcdd1eeb01df75b076a125977ffdb0d285b |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/eb602c77621e93717669f38bb1eaed73c58a5753 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f059dad6bf808e43200e0d48f0dc7a9dd397d6a6 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ac95fa678d32c58cbfe1a33e91b5b60430ccf62d |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3af63038531a66856bcc53153c33a25dfe6f90d5 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4989a669b955d18e796606e9e4991a3515564238 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6942b0aca8c55dbf7d024c2de63cfb068d69786e |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/b9f7b94f11c43661482e9840d5c95b88cfd91fff |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/a105349a2070fc51c35d67790a198e56ff1b973e |     
        or1k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/78d2cc68b5d166763d0711171854809ab462c4d9 |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3a11c99aaac0d4fb34fd945e39b5578d3cfd217f |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/4d2c01bd725b28f05de014d675d770eae3680b8d |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0554798fd147396a43bc58466b5950f7c8d0fb97 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2141d334ee26d909be29e9170a08cb294e3c906b |     
        m68k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3cc915adc90ae9974f17bd592a81158b0037de25 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/eca5d94fab27ab45898e96ad4a6265094c6fca75 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/79963f81da0a250b04b105c2a73c0221e89c4c17 |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ec487aefbff68403e22e808e5b687f7e3dabbffe |     
      x86_64 |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/42e833d2bb936120e26910cb5e6c72fc2976734c |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/3b11e5904930a5527d74522c4ecd09bca9c2bf3c |     
       sparc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/cdf755c51be902da6993b79227e5613b163e16e2 |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/2510093d3d9b63161952bd0c0c2bf002b90c0c0f |     
         arm |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/fd91c0a6e02ac4acc0d7a9832672f908160666b0 |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/154ac61fa814b2c9643fd55a09a29869b63bc8da |     
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/7bc91567dc8a0f93e63d61f49f1257c05747efa0 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/1fe7df0a9e294b2d70bea8e92267b3b410a48aa5 |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4d5cc9537639d464d04beb57889eff8a4afcc741 |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/025afb9fb8b8a679c1e8eb224b5e1d3ad9dc60fc |     
       sparc |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/5a56d8883c05a85dd3cddc66636f637d18bc8772 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/700208304cde70f8c48bea18a5a1f95ce801c262 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/305cc009e78a649c34ada885e0db0931a4ea1b86 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/e21dd87af91f2d190c8ff6151a257647363b9c2e | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/03d466077a822be21a91ed1ec499d55eca616b34 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7c382184245e1ac55574f036f2a8905a338a4c49 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/42089797b1ca73b367883e447d49ee155c407bc7 | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/185fe1f393167729f3fa16d8f799712a8458eb93 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/d934cc8853a1c1674d84642eb987691202405fea | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a5213e8282e48d56de050cf79d4b3b510b53b8cd | ORPH
         arm |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/09be0d199cfef452c9789de8b605b48a748c025a | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/a2971388115d0f7271037e4708352ae5cb96df9a | ORPH
         arm |                    ympd-v1.3.0 | NOK | http://autobuild.buildroot.net/results/121d64a1f05f6e87c1d007f546e315f2c8d09536 |     


-- 
http://autobuild.buildroot.net
