From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 15 Feb 2017 08:29:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-14
Message-ID: <20170215072936.14F2220756@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-14
================================

      successes : 205
       failures : 62 
       timeouts : 1  
          TOTAL : 268

Classification of failures by reason
====================================

               openswan-2.6.46 | 6 
                 glibmm-2.50.0 | 4 
                 libnss-3.27.2 | 4 
                     lua-5.3.4 | 3 
                 qt5base-5.8.0 | 3 
                 sngrep-v1.4.2 | 3 
               trousers-0.3.13 | 3 
               bctoolbox-0.4.0 | 2 
               domoticz-3.5877 | 2 
                  lcdapi-v0.10 | 2 
             libsidplay2-2.1.1 | 2 
            lttng-libust-2.9.0 | 2 
                  nodejs-6.9.4 | 2 
                   ortp-0.27.0 | 2 
             qt5location-5.6.2 | 2 
             berkeleydb-5.3.28 | 1 
                  boost-1.61.0 | 1 
           cannelloni-20160414 | 1 
               cbootimage-v1.7 | 1 
                classpath-0.98 | 1 
dawgdic-16ac537ba9883ff01b6... | 1 
                 enchant-1.6.0 | 1 
             freeswitch-1.6.14 | 1 
                ipmiutil-2.9.9 | 1 
               librsvg-2.40.16 | 1 
             lttng-tools-2.9.3 | 1 
make[2]: *** wait: No child... | 1 
                    mosh-1.2.6 | 1 
                    mpd-0.20.4 | 1 
           oracle-mysql-5.1.73 | 1 
               pulseview-0.3.0 | 1 
                  samba4-4.5.5 | 1 
                 synergy-1.3.1 | 1 
                     vlc-2.2.4 | 1 
                 wavpack-5.1.0 | 1 
                   ympd-v1.2.3 | 1 


Detail of failures
===================

        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/87878d24da3e1b93896cd6f548f81ab9dd975a25
        i586 |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/789b8faca2131eab7285866a05b538e66fba8db7
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a2aa4c5cbb305725379adfe2545919e650d9c86d
     powerpc |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/dfa0393840e1facf99b290cca656562494f8b854
        or1k |            cannelloni-20160414 | NOK | http://autobuild.buildroot.net/results/82d1dca3aa7ee9189baae985db59464d95696ed7
         arm |                cbootimage-v1.7 | NOK | http://autobuild.buildroot.net/results/80bc32cfaa9c7ec56a1f91cf7828527e2f379b9a
     aarch64 |                 classpath-0.98 | NOK | http://autobuild.buildroot.net/results/f0c0cf6e5b63fea3bf8f587d870c2dc66f61e203
        or1k | dawgdic-16ac537ba9883ff01b6... | NOK | http://autobuild.buildroot.net/results/bc9e372ade3b09623ac9a24010b79684df4d07d0
        i686 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/2959954530d4fdbed0b6ed6b355271b136b7f4f4
        i686 |                domoticz-3.5877 | NOK | http://autobuild.buildroot.net/results/4ca5e3239a3d601022aa3a33e86e95a6e32c228a
         arm |                  enchant-1.6.0 | NOK | http://autobuild.buildroot.net/results/8590467d23383f9b55aef16b483a6a0a303f9c2b
        or1k |              freeswitch-1.6.14 | NOK | http://autobuild.buildroot.net/results/a37ff30f159f54b61519944e1060073ff1f2c912
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/21ee2c80df8e909122820b2489df7c5318a15111
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/4389276f3aaf8ba0e331f40599fda35e7fe705ab
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/6a39a3318eab395aed87aa5bb5dee2fee36cc84a
         arm |                  glibmm-2.50.0 | NOK | http://autobuild.buildroot.net/results/24175b399ffb14f3b27d5d322b1a7698a72ac194
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/fb9a071b8739527f424cfe2886ec480f438f70ab
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/852212792b0163edf78a117cdd8d04496e43ddca
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/80db653a8055a4cc9dc91e0d2a9a5835cc36db7f
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/4f8e5620b49ef47420510b1c40741b7b44b5c2a1
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/cc855e63cb9a7ce35212da50937dbc76da09f784
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/ebc9579ab645fa8f95d934576d3362c28245a19b
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/d7025b251128c29e25bbaa4d7e3d2e12f3319fd4
      x86_64 |                librsvg-2.40.16 | NOK | http://autobuild.buildroot.net/results/fbae2644bbe90cc88ce04598d866235013519239
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/3eb37b363603224e8fc96bbc681fdb067b5c0385
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/adde07a78c7b9c7d417c4d2e976787948e4a3439
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/fa2266e2a2a00b6e92af4c16fd2aebb763242c16
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/d06a49096ff767236d293e7af63d4230fe0ee88d
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/f2b0163c6b8c676a411297099299d93b288e2cd1
        or1k |                      lua-5.3.4 | NOK | http://autobuild.buildroot.net/results/7f6a16eb957372ef0fc8ab0c757b62e1daa45c75
        or1k |                      lua-5.3.4 | NOK | http://autobuild.buildroot.net/results/da0bd6951ce43e6a7ce548c762cefa31de3de200
        or1k |                      lua-5.3.4 | NOK | http://autobuild.buildroot.net/results/cfa9577279db3fbd71074e57c36411b28e7b4c74
microblazeel | make[2]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/678da454ec49b2b35918080ab4a6fbf0688af1b4
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/60aa12f1aed08e3b7a98f9ce7091bee3a44d692c
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/033dd9cda2f2d6831a386fd43755b985969bc8e4
      x86_64 |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/4ca86c8096bb3ae12eef689b85a5fbd9141c925b
     aarch64 |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/d63c1e5c472082346cab3437f6e4649006202e83
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/f1c993b355b8dab4d0843a38147ea8e2347ce8c1
      mipsel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/db991b7a5b500d3f3686e4b4160629ce059cf787
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/5b8b7245240777d81b3bc27861e0f66a1c657087
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9e702cfb19fec8a10606b760caf142d748b3c8a3
    mips64el |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/54600156e41609fc79330dc52d0d7c13fd6360d0
      mipsel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d6059cc890c769a617f6088a89e16f168cc756f0
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/a0172a38e568c019f5a0cc927cbac8ef20d13ca9
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/2a1b0fae4d64aac4c9830d92e945354f37e4eb83
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/d5d85ebd05c785cd03d42a9448a57d3953b4f1f5
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/911281298219d2419dd81bdff00d8cb34695c094
      xtensa |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/b7b85c6622034fb371f5785efdee9c56d0439774
        mips |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/a6fed19612414f17eb20ffc02a0efe207fe555f3
     powerpc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/80e052cf9d913f321868a786ae423a041fd3b556
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/66006bc3d048e0c9100cb1ea8efd6fb825d17ba7
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/a37538b07b827f0df0b797d84278a59013f76124
        m68k |                   samba4-4.5.5 | NOK | http://autobuild.buildroot.net/results/cb34dcf7698606667632a221ffe7843437af65d4
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/e3726f7a5b1673df154fc73cf14c8a6fa37f2bf8
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/109f3d676f72b1f78534051eeef59152ad1a7476
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/28e3af15d4c437d7c0ab295a75bdf088aacf8f7c
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/94ad6e8bbbeb926ea834d9d6e3ba87d0398acb86
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/7298c95833f12eceef6b688809faa50f5de76f6a
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c10d4ac3a2478bb6bc0e8869475717a770c51a80
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/58f012ea51cf62f8c8987e92cb04601a88ccfa9a
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/35aa5752c826b529c0af1ddbe6376f6028e8f44e
microblazeel |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/a80221dcc0860046ebdf0bbf454e056b1e20df83
        or1k |                    ympd-v1.2.3 | NOK | http://autobuild.buildroot.net/results/d4535cd504a43506f9e27a99b7a58019e4dcce53

-- 
http://autobuild.buildroot.net
