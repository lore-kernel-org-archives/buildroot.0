From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Oct 2015 08:30:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-04
Message-ID: <20151005063021.5E407101DE0@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-04
===============================

        success : 201
       failures : 58 
       timeouts : 0  
          TOTAL : 259

Classification of failures by reason
====================================

                    glibc-2.21 | 5 
zxing-cpp-fa34227d26e0b388e... | 3 
freerdp-17834af7bb378f85a3b... | 3 
                busybox-1.23.2 | 3 
              swupdate-2015.07 | 3 
         conntrack-tools-1.4.3 | 3 
                pulseaudio-7.0 | 2 
               iptables-1.4.21 | 2 
                harfbuzz-1.0.4 | 2 
                 mesa3d-11.0.2 | 2 
            micropython-v1.4.6 | 2 
mtdev2tuio-e1e7378d86abe751... | 1 
                     apr-1.5.1 | 1 
              libethumb-1.7.10 | 1 
                  mono-4.0.2.5 | 1 
                  aespipe-2.4c | 1 
                    webp-0.4.3 | 1 
             alsa-utils-1.0.29 | 1 
                libevdev-1.4.3 | 1 
                   systemd-221 | 1 
                   msmtp-1.6.2 | 1 
        imx-kobs-3.14.28-1.0.0 | 1 
                  libnfc-1.7.1 | 1 
                     aumix-2.8 | 1 
           argp-standalone-1.3 | 1 
                directfb-1.7.7 | 1 
                  samba4-4.3.0 | 1 
             lttng-tools-2.6.0 | 1 
                 bind-9.9.7-P3 | 1 
                coreutils-8.24 | 1 
                 mesa3d-10.6.8 | 1 
            ibrdtn-tools-1.0.1 | 1 
                    ustr-1.0.4 | 1 
                   ushare-1.1a | 1 
              wireshark-1.12.7 | 1 
           qt5multimedia-5.5.0 | 1 
canfestival-7740ac6fdedc23e... | 1 
                   perl-5.22.0 | 1 
                    parted-3.1 | 1 

Detail of failures
===================

      xtensa |                   aespipe-2.4c | NOK | http://autobuild.buildroot.net/results/18dadb8e8bed50dfe7fb55104f71d31ca4788af8/
         arm |              alsa-utils-1.0.29 | NOK | http://autobuild.buildroot.net/results/095615059d3425abde1bea4f682dc5cb57e8db12/
      xtensa |                      apr-1.5.1 | NOK | http://autobuild.buildroot.net/results/3892b812482b51f77c70a7b1572d99d3c9aa8636/
      xtensa |            argp-standalone-1.3 | NOK | http://autobuild.buildroot.net/results/814c190dea13556213c333b81c1180b896bcfd89/
         arm |                      aumix-2.8 | NOK | http://autobuild.buildroot.net/results/6b1a9012ee4e7b98eb389820ce8589b51cdcb18d/
     aarch64 |                  bind-9.9.7-P3 | NOK | http://autobuild.buildroot.net/results/3b57360c2e3a6a368dfeb198cdc1a12a1e2a837a/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/4aaf6d85ecec359e532fe63f7b36cdc95bc5142b/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/838f5bc5ec003d3be6b3f569fa187d664f364448/
       sparc |                 busybox-1.23.2 | NOK | http://autobuild.buildroot.net/results/7dab478b23f83110983e209afeefd53301bdae39/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/500a64ed05fe0e900fa5c60daea40dba0380a438/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/32ebc09a1075155e2e4c311c5c1e2a58fc257063/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/4103abca48cd19dd73ec13a5d708acb3efa16944/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/a88f3d808387f49912fa2544ae36d4ee36b84e82/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/59f3030bee4e1db625d4b45f98c07cf58276dec5/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/e847c6aa9362a1ccaec541637d1160aed78d51f4/
      mipsel | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/a5da96759a602773b9500e8e60b3ef1fcd59307c/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/6b0e410feb6348d4f03b3f077c36fa0bf362d645/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/4161a2fa57bd769c82b03d9b95ef3cf76a10c618/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/5ab606962505255d2907093763b9b8056f81d8fb/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/06608e3e8cfc66a1f9d70d7f0911e9fc6837c856/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/e571b8a7bf4899b991a31a7d07fb71a8caa9d0fc/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/2496a74696c4c1a9273598508d6ad627d633727b/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/1002a587577db10a6dcdecb93f77f76095ed99bd/
       sparc |                 harfbuzz-1.0.4 | NOK | http://autobuild.buildroot.net/results/730e9cf66633e09651c26fed3f6a447cf658e7c7/
         arc |                 harfbuzz-1.0.4 | NOK | http://autobuild.buildroot.net/results/28a626063c3d7b2656d3fd41592219204994178c/
         arm |             ibrdtn-tools-1.0.1 | NOK | http://autobuild.buildroot.net/results/bc9ee49304d1a1908440c3d74ddee67bd203f1c8/
         arm |         imx-kobs-3.14.28-1.0.0 | NOK | http://autobuild.buildroot.net/results/fc0b25ab9a700e8d985eddea429b44cc5fd86c16/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/c05899cab796f19ee1e6f8e86e444932eed2d070/
      x86_64 |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/ce988bd58c5e8d7fd74eec20fba287aed49a8a9f/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/077a121cdcc9f7a9a6b50cf7696a85b63dbf0f40/
        bfin |                 libevdev-1.4.3 | NOK | http://autobuild.buildroot.net/results/b309c3d12a2c15d0b22fb931373424dd42b89a2c/
      x86_64 |                   libnfc-1.7.1 | NOK | http://autobuild.buildroot.net/results/f7ecaaa63fbdbbc029a9041eb1770335a5056438/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/a463f7b3a9881134824dc38ec1f68a3f431d46f6/
      xtensa |                  mesa3d-10.6.8 | NOK | http://autobuild.buildroot.net/results/0e68ea2e6e996a1c942cf492abf77b2d56e8ac06/
    mips64el |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/11e3987981dda00e408f46b959ec85ef32b29807/
         arc |                  mesa3d-11.0.2 | NOK | http://autobuild.buildroot.net/results/3d49fef65ddaaa048bef290d636d8fc50318bbce/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/06aeb77c4ab6dfe6edad8edbccd8c8d7de029315/
         arm |             micropython-v1.4.6 | NOK | http://autobuild.buildroot.net/results/06fc79dad3d4c0c5f997f4c2e4b52014727764ac/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/8e81dd55dc4d1f54931c5a05c0475ea594b77bbe/
       nios2 |                    msmtp-1.6.2 | NOK | http://autobuild.buildroot.net/results/a91c36a46584d52a892c468842c68ab5df78d986/
      x86_64 | mtdev2tuio-e1e7378d86abe751... | NOK | http://autobuild.buildroot.net/results/2e155f2f57fd035362ad1b414f42e1c2b5de844b/
         arm |                     parted-3.1 | NOK | http://autobuild.buildroot.net/results/e1b6de7b234f2ec154d772ee93e33275dff38f3e/
     powerpc |                    perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/50c2fb3d6b2c7e1367441193d43d3344c62a0797/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/d09ad61b3fc150c339410ceb3d68f2cd5bd751cc/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/f3a08b52c390bf5200d1c92ba0e92b86ad334864/
     powerpc |            qt5multimedia-5.5.0 | NOK | http://autobuild.buildroot.net/results/ecc4fee1d034d8d5936c104d429dab336e79e05e/
    mips64el |                   samba4-4.3.0 | NOK | http://autobuild.buildroot.net/results/5b7f8790172bda1e63afef909c5a391b3c3b857b/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/db14155181163d4467c392bc13052a84fef60ee4/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/5b3979742071976626e5a9dd6876ecd1954cfaf6/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/3c3abce8c66680d441c108c5875b0a248e52a9e9/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/df3f3b9c1bc879ab8b4893188c87078db968f550/
         arm |                    ushare-1.1a | NOK | http://autobuild.buildroot.net/results/7ebeefb084b5cc849b75e6536fb42110df826143/
         arm |                     ustr-1.0.4 | NOK | http://autobuild.buildroot.net/results/a396d7ccc8a5e40d5a1e0db82a1420120b06c2b2/
     aarch64 |                     webp-0.4.3 | NOK | http://autobuild.buildroot.net/results/52fc294ff2f9ea3d1a4d729b27a647b33951013d/
      xtensa |               wireshark-1.12.7 | NOK | http://autobuild.buildroot.net/results/8a11bf90e411c5c35f12bea450bde548075a9eef/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/c4aab2e3f2e5e3a058e7dbd0dac41fea6eb57471/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/40237b8b15675fbe677b20a1cb5d0514804dafbc/
        bfin | zxing-cpp-fa34227d26e0b388e... | NOK | http://autobuild.buildroot.net/results/888ced9e5133f93fb130ffd025ccfa6772347bfc/


-- 
http://autobuild.buildroot.net
