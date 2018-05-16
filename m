From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 16 May 2018 08:00:18 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-05-15
Message-ID: <20180516060018.A9592208D1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-05-15
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  24 |   2 |   0 |  26 |
      master | 296 |  57 |   1 | 354 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

          host-faketime-v0.9.6 | 1 
                host-lzip-1.19 | 1 


Detail of failures
------------------

       nios2 |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/3602e8216479157fc78e46d158a96154cb0008bf | ORPH
 powerpc64le |                 host-lzip-1.19 | NOK | http://autobuild.buildroot.net/results/43711eeea65743c4996b4755778538dc81221871 | ORPH

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                host-lzip-1.20 | 29
                   libnss-3.35 | 5 
          host-faketime-v0.9.6 | 4 
               host-llvm-5.0.1 | 3 
                host-go-1.10.2 | 2 
                libkcapi-1.1.0 | 2 
                  autofs-5.1.4 | 1 
           bash-completion-2.8 | 1 
                         boost | 1 
                   exim-4.89.1 | 1 
         glibc-arc-2018.03-rc1 | 1 
       host-gdk-pixbuf-2.36.10 | 1 
         host-gettext-0.19.8.1 | 1 
              jquery-ui-1.10.4 | 1 
                mono-5.4.0.201 | 1 
pixiewps-9e5bdc6c86c8487b2a... | 1 
qt-webkit-kiosk-34efddb0bf0... | 1 
     toolchain-external-custom | 1 
              wireshark-2.2.14 | 1 


Detail of failures
------------------

     aarch64 |                   autofs-5.1.4 | NOK | http://autobuild.buildroot.net/results/262b774e904f0c5ecb94700039e0ff44f96ecbe8 |     
         arm |            bash-completion-2.8 | NOK | http://autobuild.buildroot.net/results/17d913fae29198869fe00f9e7a196a3ceef83fb5 | ORPH
microblazeel |                          boost | TIM | http://autobuild.buildroot.net/results/7e096991edb3a7f38261b3522d4cd92b359dd317 |     
         arc |                    exim-4.89.1 | NOK | http://autobuild.buildroot.net/results/a362dfef9e5187931431000c54f03f841d17c847 |     
         arc |          glibc-arc-2018.03-rc1 | NOK | http://autobuild.buildroot.net/results/621f5c5430d4f74403c65c1502103ea1316d6704 | ORPH
      mipsel |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/7429afcd704ed47a3b6730669151c38d5bd53052 | ORPH
        m68k |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/a8dac9c43bedb3f9ac500168d34a782c516ffb6b | ORPH
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/3683bd57998be4b70397c24a21abc2c0994275be | ORPH
         arm |           host-faketime-v0.9.6 | NOK | http://autobuild.buildroot.net/results/ecde81f883545e11ec18e5476583ba660e691142 | ORPH
         arc |        host-gdk-pixbuf-2.36.10 | NOK | http://autobuild.buildroot.net/results/aea58ff1b4c1dacef72771f86212ab22236696b8 | ORPH
     sparc64 |          host-gettext-0.19.8.1 | NOK | http://autobuild.buildroot.net/results/089e3e3a3fccc6639ce6c69ee2247f66c952ce8b | ORPH
        i686 |                 host-go-1.10.2 | NOK | http://autobuild.buildroot.net/results/07b16fbb6600813fb79fcfd76b85e0d7c7dbf753 |     
         arm |                 host-go-1.10.2 | NOK | http://autobuild.buildroot.net/results/2ee81277ce357f7c09998ee60a1942056cd22624 |     
     aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/824c70e982d8ec7e518cf4db058767df42db6b04 |     
     aarch64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/e2dce7bb939b0d3579fa9e11caed4a115cd4979a |     
      x86_64 |                host-llvm-5.0.1 | NOK | http://autobuild.buildroot.net/results/81f5cf22dc1a1f8d773c6172876c3edf9c97795d |     
microblazeel |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/899192697065c812f0828125432eb4de1c11f03d | ORPH
     sparc64 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/e91feaee66c48f012764500aa0a407e0f8a2fd10 | ORPH
       nios2 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/e0a19158d24acbc10cc6b5b8e4e8bf47529a67b5 | ORPH
      x86_64 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/73e71d4ca2e39b2fee963f77e939f7c76e0b97ee | ORPH
         arc |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/538a0a4656b06b1465ff719aa60ce3dc0e6a604d | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/1b68f81d510455e66230ed261ca0a05964cc7883 | ORPH
        m68k |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/dcc4690ed6766e8a5529dbc691babdc653248a20 | ORPH
         arc |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/b7a83efeb0c99a4bedab319c101e8d1e275577d5 | ORPH
         arc |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/58ab149dc6d4d1c6408c16d15ea77ea3e5c53ed5 | ORPH
    mips64el |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/de56abfcf399c552352d3d2f49c216faa0343741 | ORPH
        or1k |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/73e076921ef916026d1c4ff414f43654bc06b31e | ORPH
         sh4 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/972235aeeacfc4c55d629f8e345786718c305bcc | ORPH
     aarch64 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/4a74527e5c557bef67a933e0af2aadccc7d46320 | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/08e4a61b5740c27d43e586c7f975d9f4e2bd0ced | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/b6c53101b178ed8f15569a7268fb1f049643f989 | ORPH
       nios2 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/542412cd503c4a97071ce146f3096ff3aa443809 | ORPH
    mips64el |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/8e723f963e4efba365dda22e5fbd91441da4b1e6 | ORPH
       nios2 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/a4c3ab3f2c0af82d6f1fb0415badbd90cd36c62c | ORPH
microblazeel |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/e7714efb44e366714b5450df6aa8d569f16b4f92 | ORPH
      x86_64 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/ddb2474e8c458c59bb4867cde70bc21ad906ef9d | ORPH
microblazeel |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/e1ceb1f1ea9e6720547505670fdc49b6328fec5f | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/125836ee5685922559e93ff674c086d27368aaf8 | ORPH
        or1k |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/d0980d7553ee295aaa992426215d2741aeae152a | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/4eb88e8ebd87ec0495e755e58d70933ecfbbc1ee | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/acd6a4044f98612787b6b0b070a35ef57c5ea23d | ORPH
      x86_64 |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/9fed0c13e84d3553c831f65186aa49f9f3cef637 | ORPH
        m68k |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/91c1f6626dee092d6d23a60b06c64e89355f1a7b | ORPH
         arm |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/845e200a49a91947d8b18b8a7df8ee9482c1dddb | ORPH
      mipsel |                 host-lzip-1.20 | NOK | http://autobuild.buildroot.net/results/d6e04c88a9b1641d1582374682990203e5eddd2a | ORPH
      x86_64 |               jquery-ui-1.10.4 | NOK | http://autobuild.buildroot.net/results/9058ca8c419f8a369f37d749ad6567099b85aa5a |     
       sparc |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/de5e136ea433633d836bff1d2ac1d3b461391b83 |     
       sparc |                 libkcapi-1.1.0 | NOK | http://autobuild.buildroot.net/results/a8a0dc95e8a84146ab4fcdb4ccab1bb291becc53 |     
        or1k |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/d38a6baadcce10ceaba0126389247a98d96b35d6 | ORPH
         arm |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/86cbb283e43efbea9071e869caafdc70dee429c5 | ORPH
        i686 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/768d31b26c33162446cfd2133fc7cbe475faa4b0 | ORPH
       sparc |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/ce3bde8b65db3b188784addc4d6c0491630df849 | ORPH
        i686 |                    libnss-3.35 | NOK | http://autobuild.buildroot.net/results/bb4bd9278c278c3b241641cde48a38a772e4fa7b | ORPH
         arm |                 mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/8e7cd034e30205794d9b6d8d703708398b07416e |     
microblazeel | pixiewps-9e5bdc6c86c8487b2a... | NOK | http://autobuild.buildroot.net/results/0d6785397627e8b9292971a4fa34269bf93310f0 |     
     aarch64 | qt-webkit-kiosk-34efddb0bf0... | NOK | http://autobuild.buildroot.net/results/d9d82b8d63172eb4391755f365c96d737d3d504e |     
         arm |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/1adea42910d0787c38a5c87ec366072f4e4e58f8 |     
         arm |               wireshark-2.2.14 | NOK | http://autobuild.buildroot.net/results/2133d56f11e828bdb7ce9dc452def041bcc24822 | ORPH


-- 
http://autobuild.buildroot.net
