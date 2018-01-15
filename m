From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 15 Jan 2018 08:00:07 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-14
Message-ID: <20180115070007.3CF1A2086D@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-14
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 207 |  71 |   2 | 280 |
   2017.11.x |  23 |   2 |   0 |  25 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

              e2fsprogs-1.43.8 | 33
linux-firmware-65b1c68c63f9... | 6 
             libostree-2017.15 | 5 
               domoticz-3.8153 | 3 
           host-mono-5.4.0.201 | 3 
                 mplayer-1.3.0 | 3 
            nilfs-utils-v2.2.7 | 3 
                   gconf-3.2.6 | 2 
                 s6-rc-0.4.0.0 | 2 
              swupdate-2017.11 | 2 
              wireshark-2.2.11 | 2 
               asterisk-14.7.5 | 1 
             bluez5_utils-5.48 | 1 
                  boost-1.66.0 | 1 
                  cc-tool-0.26 | 1 
           cups-filters-1.17.9 | 1 
                     gpsd-3.16 | 1 
              lynx-2.8.9dev.16 | 1 
                    mpv-0.27.0 | 1 
            python-txaio-2.8.0 | 1 


Detail of failures
------------------

        mips |                asterisk-14.7.5 | NOK | http://autobuild.buildroot.net/results/3f5a687357499f73ed8aebdb408735290e0b29db |     
       nios2 |              bluez5_utils-5.48 | NOK | http://autobuild.buildroot.net/results/69b2651eb1a9f7dc0e500e7c8e21bd667cb85677 |     
microblazeel |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/d9c1bd2e15ed841697ceefe1048839cb83ade289 |     
        m68k |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/1c5997d245dd444f4d0ae1f971863079e9cf0829 |     
microblazeel |            cups-filters-1.17.9 | NOK | http://autobuild.buildroot.net/results/3c20f95573ae1e043cb50e56c1f8c3f065b09156 |     
microblazeel |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/4de5d50a2107f481c7bfecdf1382022a1f0bbb07 |     
         sh4 |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/95c8da526dc759c49413306a1ee839a0ea8512a2 |     
    mips64el |                domoticz-3.8153 | NOK | http://autobuild.buildroot.net/results/d768baa971680d249909b7cf9069ceb5fe798ad0 |     
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/54d5987000dfb81a6b8c98ab56e4dfe77656ca36 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/6553eed5785596e407073e9d3fd7303a437ab3fd | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/19158fc2359d21fa13f1e8322807d12e8b7bff9d | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/10adf5e2bf42c2ddfdce2c31e7dceddaea02b573 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/7d5d028ecaba96ca78bc7b11303ad4347939d938 | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/a7cdcbcf29e3bc8802a49bccc6cc265813db343e | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/ee11d6d5391553af2d06a744e4dfade471c2127c | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e269e9b6d26d98c04748dadf3da74ee1ef017434 | ORPH
        m68k |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e35f85c719c6e2e02afffc77dbfd4514b4a649b6 | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/a2f1b2e3c422afdaeb05889d568c6b5fbae171e5 | ORPH
   powerpc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/68a91c3dbb77d22727e55e73349231803fa6d18e | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/e1443c0691597cac1c064b990ae0552f0ad6ffec | ORPH
     sparc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/57328dc90c84342637debd73c8428adc00bde806 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/7d3f70f78896557900739c4124437b874b6117df | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/a0ee1b6a502ad05f32ed9ad02c4e75f1ae0720d9 | ORPH
   powerpc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/5040ed784ae8f6b9a6caf6b7dc615a59a3b1a749 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/74b1f259998325db7657ba49f00255ab4fd013b8 | ORPH
   powerpc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/7e06ca2f82914bddfc847bd9e329cb9c3c58d8f4 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/ffaa042f9ef8ed5a99bf209c53e9ff4cc365be49 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/4dea7e4bf2a20f2a23ed16336753355b06440a00 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/2948eca87727df38aa8bfabf8cd23a3fd6ac7418 | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/5fa669870546fa7042103f4a91408e13b9cc2f6e | ORPH
        mips |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/713584d2d5eb50029e8f1d9671f5b757c57027ad | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/a2f67412324f3769211d084fe5ee8eacfc3c5a54 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/de1943438049240d189a64882d5098b7c4287434 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/79b3d0e718ffcbca4af220d4c6cec897dc8f1c71 | ORPH
     sparc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/5baaccbf1fd44bb88ae672929bfacd932a367828 | ORPH
     powerpc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/72342c6a36b1c6ec36b130bed3eecd6a78c6de8b | ORPH
       sparc |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/b5d3b929df2832404378298da2a77530cde2a885 | ORPH
        m68k |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/2f789376cf39f82dc380c1a7f688fa0c0334f243 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/6a921db5be25f1111fb1c337fe3db88fc6b44299 | ORPH
      xtensa |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/0d928f19ec58d9f915350728d144208fa501c54f | ORPH
     sparc64 |               e2fsprogs-1.43.8 | NOK | http://autobuild.buildroot.net/results/14df3dde2772219d112b9016fa415dc06ed3dd55 | ORPH
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/897b04a4050b81ca7e38e36d18859e3291713cc5 |     
       sparc |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/d910611db00009d1930cdfada2d700da88373601 |     
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/3dbdd47ba24943586c4d11ec5f096e2b9a43644d | ORPH
     powerpc |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/0419b3b067301aea66b5e67a9942aeff19942f61 |     
     powerpc |            host-mono-5.4.0.201 | TIM | http://autobuild.buildroot.net/results/977046117ad4eace1de3a89b81a32b2775e45b60 |     
         arm |            host-mono-5.4.0.201 | NOK | http://autobuild.buildroot.net/results/5629ecfa4ef576edddff4013ce8756cb3f42e9fa |     
    mips64el |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/731d8bbc6e5ff7595ea858592c819dcfe656de03 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/fcc3de32315d4666c615f94db448e38c926c1be2 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/5aa408ea2d84c7db312aa59816715126631a1f16 |     
     aarch64 |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/11877f433b415b36e4b24956c378694596a55b5f |     
         arm |              libostree-2017.15 | NOK | http://autobuild.buildroot.net/results/907362f17d9abb81d7ba603ae347763cc80a8406 |     
       nios2 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/49d09e7b55349a3d2e1c7656f8da589ecca618cc |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/74115d95c3a79829cefd20daab8d5a56bdad5e4a |     
microblazeel | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/b622be3c725123cc006f8adef4f8ca76ad2926e6 |     
      x86_64 | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/801cf75c45af7950cf80afd28a435852cb2bd85b |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/38b15239faa93fdaa4c211e2a5667e03bfb93f36 |     
         arm | linux-firmware-65b1c68c63f9... | NOK | http://autobuild.buildroot.net/results/961640cc3c7ab75eccac2beddc54728fc6f7f7ef |     
         arc |               lynx-2.8.9dev.16 | NOK | http://autobuild.buildroot.net/results/86436123dc0263157e32042cd5e3126b86395384 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/f5133c3bafc936ac7033c7659effd2828e86d026 |     
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/fed6f063e7e02111a8af1641318cefe9161ea4ae |     
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/78e509e0bd3f49802254388c3116564b4b930e9f |     
         arm |                     mpv-0.27.0 | NOK | http://autobuild.buildroot.net/results/e0c1740a2a13b30104b6638f8c617c61cf3625a7 |     
        i586 |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/9f190b1cafdd8e34dbb3ace372a77ecde64c6946 |     
         arc |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/fb0b663d9815bcc6e6ca29d0f0c24cb1d50a80e2 |     
      x86_64 |             nilfs-utils-v2.2.7 | NOK | http://autobuild.buildroot.net/results/59a075309e2874d74475aa8bc9f2e2eeef20c235 |     
     powerpc |             python-txaio-2.8.0 | TIM | http://autobuild.buildroot.net/results/1feb577e699e58e9766bc16d8cc57f6af3f4744c |     
         arm |                  s6-rc-0.4.0.0 | NOK | http://autobuild.buildroot.net/results/902fe2e7c78dc8e02677893bd6ab6af0803cdf45 |     
microblazeel |                  s6-rc-0.4.0.0 | NOK | http://autobuild.buildroot.net/results/75f532fb127465795583591d180cf44e6f0df82d |     
        i586 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/610abc84a1022180cb39c8a6b88bb9ac44f54e35 |     
      x86_64 |               swupdate-2017.11 | NOK | http://autobuild.buildroot.net/results/037501bb120d18afb82930c740b18129593d0e0b |     
         arm |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/40d6cb2c213229cd5cf5c769e8788d602f6c0e45 | ORPH
         arc |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/3c6b4a606765048622eb70eed08f17ae844eff33 | ORPH

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

              host-erlang-19.3 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 


Detail of failures
------------------

         arm |               host-erlang-19.3 | NOK | http://autobuild.buildroot.net/results/e89dab7d1adb55b95d86ff2de1b2482bdb088af1 |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/5f62cfcc9ffb15a4cc5568e502f44829f066d303 |     


-- 
http://autobuild.buildroot.net
