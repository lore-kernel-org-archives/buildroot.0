From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 21 Mar 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-03-20
Message-ID: <20180321070007.6576D2084D@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-03-20
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  25 |   1 |   0 |  26 |
      master | 171 |  81 |   0 | 252 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

                 mplayer-1.3.0 | 1 


Detail of failures
------------------

        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/3e86b82277b3ed4d77315a5b6f747472d381061c |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                tpm2-tss-1.4.0 | 34
              tpm2-abrmd-1.3.0 | 10
               xfsprogs-4.15.1 | 9 
              keepalived-1.4.1 | 5 
              tpm2-tools-3.0.3 | 5 
                     php-7.2.3 | 4 
                       unknown | 4 
                    liblo-0.29 | 3 
             bluez5_utils-5.49 | 1 
                  boost-1.66.0 | 1 
                  host-go-1.10 | 1 
                   qemu-2.10.2 | 1 
            safeclib-v03032018 | 1 
                  udftools-2.0 | 1 
              wireshark-2.2.12 | 1 


Detail of failures
------------------

         arc |              bluez5_utils-5.49 | NOK | http://autobuild.buildroot.net/results/17fb36e072b2e06c63f9e7cb8a01ea601fa64f0c |     
     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/ebd582a50a6545f784c928a972f45c60929da076 |     
      x86_64 |                   host-go-1.10 | NOK | http://autobuild.buildroot.net/results/e6f276ff9a855a543825bbb67148938e0b77bbe4 | ORPH
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/82d31b752574b6b4a8865d1d4732644890ae5689 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/4aba3e1e0fca9532b8d239cb574477aeb74740b8 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/976e5d04fe10675961ed67ece12a7e263590e771 |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/5e8ee7c9e907c17247b2a1e44e1e74bf4e5d2b6d |     
microblazeel |               keepalived-1.4.1 | NOK | http://autobuild.buildroot.net/results/f32e6497357ab415ec6304d594de0cc593fef403 |     
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/91e44484711980d477973084348447ee98343ad7 | ORPH
         arm |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/9b27546e7f28080b27ca3dc0133c46c3f84f643a | ORPH
        i586 |                     liblo-0.29 | NOK | http://autobuild.buildroot.net/results/aa8fdd354430ceac2e8063209db871d4dc803bf8 | ORPH
        bfin |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/020bb1688252e1356ea1bf823220806d3a20986b | ORPH
microblazeel |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/d98f39da5941f6cfeffa549a7a30202cd6ee5406 | ORPH
      xtensa |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/22c9d6345380fdeb7b8ec4baa1020ee8d8e1097f | ORPH
         arm |                      php-7.2.3 | NOK | http://autobuild.buildroot.net/results/9b5932975b8217a1066fe71636f84bcdda48a3d0 | ORPH
         arm |                    qemu-2.10.2 | NOK | http://autobuild.buildroot.net/results/b825c0cd397424b1fc7fa87c580e1757dc25c588 |     
microblazeel |             safeclib-v03032018 | NOK | http://autobuild.buildroot.net/results/3f6234995099ff2f450df629392f7fcf6c233f5c |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/0abe7939b84e734bf952e40dec75c6b882d3be1e |     
microblazeel |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/19ef7e2b63bfe1fb2356ed467a9d55a8e056c1a7 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/beaa4d79836b8666dd0f85cf360f0eeb8fede05b |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/4369db50a455bf3b4a6924df189971e058817738 |     
      xtensa |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/510238583573f6f8e9cadbdd40a84060f48aeec8 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/f9416bbd1cbefb952742213f17c1b9ed79c60eab |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/c9e5394d5089cd9aa62e09448a41d15a85aac184 |     
         arm |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/a56debeb524533e443814c5b61c1cb4a5855cbb6 |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/630e08e46fedf36652fd35fc1470d435be681d84 |     
       nios2 |               tpm2-abrmd-1.3.0 | NOK | http://autobuild.buildroot.net/results/bdb11ff63f0bec8d04de2e2aa389976bca5742d3 |     
         arm |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/44da02a4dd59cf6904aa09dac0711ea95f196e7b |     
     powerpc |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/cd065310e3d16e39270cef17c7bdca2cae521348 |     
      x86_64 |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/5ba187570279ed65c25e8486698dc36ee6952445 |     
    mips64el |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/a6ab4f6b735cc1a9b61ac4d67c25fbb38e6b0ea4 |     
        mips |               tpm2-tools-3.0.3 | NOK | http://autobuild.buildroot.net/results/a290443bb30549a86d4f543f29396d72b3df24a5 |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/12e39a13016707978776390fa568c936183df490 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/cbceb445530675f18e661d990e9fe4389dfaa54c |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/059096b54c401bb2cbf2677692f241e30d7bdb41 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/e3a2459eb1cde8b753d94602c06c8e16dc023256 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/df38f41119322fd1cd6ba95fb5e44ecf601b147d |     
         sh4 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/01db241cb236c1a12d22764d9849704852c6410a |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/879b8a6f8aa13d7e6c6a5e63a4c686952fd30979 |     
       sparc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6cf2057e8343f070a26d7f525b520ab6b228e949 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/213690ddcfcf5a7b2cfe15cc8f41a3037a3c9420 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ef5c5c3e37ef9cde4f31b1d1fdfa6432bcb548b8 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f5d1db3bc1dc2e743f0a46d12447fc5ebdc1f8cf |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/a9772b2173031fca9dcc468ac7963fd349099955 |     
        m68k |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/ac1cca9e7b07237fe395a69462e3fe8967e32632 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/f5b14a55d4d1e462af815721631161e4150cf2c4 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/e1da933a5129e6b6948527d9e02fc7c7cb929ed6 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/c5a9a94f095e41e936b1ccffaaf75da176d493d2 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/be15a0e084017aa106619092c23d6755f717a55f |     
      x86_64 |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/0ee6e68f403b5db5b6e100a8b75a8f28bd0dc209 |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/12110a2287e7be8fe689737c94fa20c163e58e56 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/eebd1abdeb2b33de4cbf76735a64979f584ea18b |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6609ff813785d7545da20c218114be929b007d37 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/46c72bb597cb2bba2c9939e25503f09250b361fb |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/aebb9349b5a84b70693cfd19e1595c819383af91 |     
     powerpc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/869014d4995e4a4cfc1ec92b6fb7abc993ea25c9 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/c627c90c211f8b40909e87690ad80a1ffa7e746e |     
        bfin |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/aa4b37dc0e47933927c43653b66e7a5acb728190 |     
    mips64el |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6e6ba98db69582a6935dcb01ce1ecffcf812c4fa |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3400cce801f540dec374e84d6615cbdbf4190bd9 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/2fbaacb5c46dde9cb3c5bc8923d66c695ece5efa |     
        bfin |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6a77829c1d1f6a517a2d3c8e7d9c271d6eaca256 |     
      mipsel |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/3afeda6b54702df5c75df8797467e5ae1b45b968 |     
         arc |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/40c518addab7b1237798fe300a705a4f7e2d2e3f |     
        bfin |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/6803d12f8e86a0fd39696367fbfcba70714f07aa |     
         arm |                 tpm2-tss-1.4.0 | NOK | http://autobuild.buildroot.net/results/70775feeb78cd5407352f3d37209ed3b4cf3693e |     
         arc |                   udftools-2.0 | NOK | http://autobuild.buildroot.net/results/fbf3ad62e80492cccf6da86a513d30c8873b060e |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/d370fb15b5559de9650c1cc5e1014720b92cb8ae |     
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/c7499336cde434d7e1178f91b0da4a399465f55d |     
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/8c9b1012a7cb65e62c36cbf32b3c388f28aab213 |     
        bfin |                        unknown | NOK | http://autobuild.buildroot.net/results/abbf9477467747dd890e3413753af63b2033bc6d |     
    mips64el |               wireshark-2.2.12 | NOK | http://autobuild.buildroot.net/results/673b48d796662e4cc0ee419744b7dea61255faff | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/66e425b00a06f928be0951ac4196190fe88b0f62 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/862fd6eabd87c313f4f897462a8bbdcb19d06c33 | ORPH
     aarch64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/4c46f557c4e8796cff8254c43852c0bebad1cb85 | ORPH
    mips64el |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/7049592c9112aebd8d599628371a61ff2fecb548 | ORPH
         arc |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/1595a4178256ad0b5ccc2f4aa86f11e3a9e11d54 | ORPH
   powerpc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/f2334caee3e24d96c59d18b255be207b64b52ffb | ORPH
      mipsel |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/145af92fad2914a1dc3def7c357dbba2f9a4b657 | ORPH
       nios2 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/8ba4e94cfbb8a5cbb166423a671bdbcdf535f86b | ORPH
   powerpc64 |                xfsprogs-4.15.1 | NOK | http://autobuild.buildroot.net/results/1cde87d1daf3c6009220ff47512794cef6a2938f | ORPH


-- 
http://autobuild.buildroot.net
