From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Apr 2017 08:28:13 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-04-22
Message-ID: <20170423062813.F1E8F20768@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-04-22
================================

      successes : 195
       failures : 65 
       timeouts : 1  
          TOTAL : 261

Classification of failures by reason
====================================

                 xenomai-3.0.4 | 15
           host-protobuf-3.2.0 | 12
           uboot-tools-2017.03 | 6 
                    ola-0.10.2 | 4 
             rabbitmq-c-v0.8.0 | 3 
               acpica-20161117 | 2 
      binutils-arc-2017.03-rc1 | 2 
                libepoxy-1.4.1 | 2 
                    mpir-3.0.0 | 2 
                protobuf-3.2.0 | 2 
toolchain-external-codesour... | 2 
                  arp-scan-1.9 | 1 
                 binutils-2.27 | 1 
                      bmon-4.0 | 1 
                  boost-1.63.0 | 1 
                busybox-1.26.2 | 1 
                 efibootmgr-14 | 1 
expedite-0529ce56b6fb01e965... | 1 
                 mplayer-1.3.0 | 1 
                  nodejs-7.9.0 | 1 
               syslog-ng-3.9.1 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 
             util-linux-2.29.2 | 1 
             xcb-util-wm-0.4.1 | 1 
                 xorriso-1.4.6 | 1 


Detail of failures
===================

         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/ded284b33fdf1d00ff09a40ab97192fcc05c1576 |     
         arm |                acpica-20161117 | NOK | http://autobuild.buildroot.net/results/8c219e507342760bbb0cb712760f3877a350587b |     
         arm |                   arp-scan-1.9 | NOK | http://autobuild.buildroot.net/results/5a033c9df3197fc60e582274ad4a3524c1edb35c |     
        bfin |                  binutils-2.27 | NOK | http://autobuild.buildroot.net/results/97957ba2b2efa53b1ce440c66433d11753aeba11 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/38ea1f53bdf0bddc4421aa69ef23605e0c6535a0 | ORPH
         arc |       binutils-arc-2017.03-rc1 | NOK | http://autobuild.buildroot.net/results/75d6f10ddf8c3fdb35ebd0ba3915f2fcd3bf19c3 | ORPH
         arm |                       bmon-4.0 | NOK | http://autobuild.buildroot.net/results/b1f8f0adcc713e7cf5096c328d266218470e168e |     
         arm |                   boost-1.63.0 | NOK | http://autobuild.buildroot.net/results/d5a1a3fa812315c1ecbe4a7f96d81e98e4a4205d |     
         arm |                 busybox-1.26.2 | NOK | http://autobuild.buildroot.net/results/e0b180322fc1a431de133f6dcc7f49d5653c6153 | ORPH
         arm |                  efibootmgr-14 | NOK | http://autobuild.buildroot.net/results/5c43015c93d8a2ef7244dbcea19af929c8c8044d |     
        i686 | expedite-0529ce56b6fb01e965... | NOK | http://autobuild.buildroot.net/results/e9b2f66494288062b46d5e248b3941a1c6407dae |     
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2d1dd039a3ca9b1fd40394d547ee4dfe6b2aa4bf | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/a20f47d36d7bdfefe9d707d0f147cb9bd3bf052d | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/21f5e1ea4f37e1d174604d6da78c0e916c89f1e3 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/512b58a6971a68ee9b9c3f8f59ff97e5ea359645 | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/77dbb6bbbc0ea9e9bcdd22b10011ef9728c20d54 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/24e880086c87d40b5d79a90d805acc75b33d484c | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c1b4e81e092674e1259df7fe8423bffa22922f5c | ORPH
microblazeel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/19adb2ada438727acfa972506dd3167e39167441 | ORPH
         sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8d5f8b6ab2e5e7bd2c6ef4e44adc8b856a4e8e5d | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/8d62d64acee2ac238a992fa76dd78beedcd1b89f | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c8fca19f61a46bb48b91c42af536ccfd63094eee | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5e2f72acea88f355df018620279264db40a2f946 | ORPH
         arc |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/0aa7f6a808daef40d9e2ba682b4c87ce4f6418bb |     
      xtensa |                 libepoxy-1.4.1 | NOK | http://autobuild.buildroot.net/results/b96b02edb3c9bd2b2ecb93d3e9b891bcbf1672de |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/d15099a7f04cb10d725d1a9554cee04e53b528e7 |     
    mips64el |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/c063717574c67552ed73a0834bf4f6b5d0ed7b8f |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/49751802c0ab95087590694e536a0d3bc3b9e452 |     
         arm |                   nodejs-7.9.0 | NOK | http://autobuild.buildroot.net/results/8653d78a190df1e691f52a911d8153104c46226b |     
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/075953a8943dd0fc46739217490f4e986b2cce2b |     
      mipsel |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/6b8ab6f7cbda87d267ca5fa94ade82deef731638 |     
       nios2 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/9cf4bb953e30f190ed7f6e14f4aa5e3919d16dd7 |     
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/9fa5017c3786ca5e77708031ea2354b5f5fa6594 |     
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/829c26be2328e1dd22fda21d00aa9692313cf599 | ORPH
         arm |                 protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2e35e5a4b8169b2c1e6bb816384d007f3972d525 | ORPH
        or1k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/e15bad6fe7802326914a5349875394fd7447fbdc |     
        i686 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/2872ed2385c1deb85567ba8e4b467fad8526d56c |     
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/d31bbea6d5cec990f2518f1ea0639b19fdc2855e |     
      xtensa |                syslog-ng-3.9.1 | NOK | http://autobuild.buildroot.net/results/a7cc90bfb76ddfcd47b2f92a20b70444f73bcdce |     
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/035ac798d2917db9367525a5b50c7afb28cfe280 | ORPH
      x86_64 | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/1803062af4a689d752afb1d7bdae5adb1cdc7f9c | ORPH
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/54a7b506f72980267bda828e818bdb51087c49e2 |     
     powerpc |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/eb0b7f31fdafb528cb263b5ee74bd3d3b7f3f96a | ORPH
      xtensa |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/9a9c844943c6e676d8dac9fe3c57f3496d922e14 | ORPH
        i686 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/d097bf94da09941352c689b8d01ab16ece2c1c85 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c57e887f13f898baa7631bd7c096b4fb611633b9 | ORPH
    mips64el |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/ca4f57acd9c6b5af1eee848eb346e0b819710f10 | ORPH
     sparc64 |            uboot-tools-2017.03 | NOK | http://autobuild.buildroot.net/results/c74078aa799b535ba8b204d34f59c0e48d8e6da5 | ORPH
         arc |              util-linux-2.29.2 | NOK | http://autobuild.buildroot.net/results/1312db1075fd036b542e6f652bc86047ce228997 |     
 powerpc64le |              xcb-util-wm-0.4.1 | TIM | http://autobuild.buildroot.net/results/0d0ea45fcbff01e44882eba9b603374503409a7d |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/508621d473bcf97be09a2dff4380aa1118c8a689 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/36362094a4a92dc9ef75757790771e4e4ff27eb3 |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/209856c63374931888ad3274d71298a2aefc629d |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/821c5b426f9aff3ee0e13517b8070cb70498b76a |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/920645bfe5a2dc702bf13194df841192d5192061 |     
     powerpc |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c7af6a255983e64497c33fe23b2e5f222ca91522 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/3ba145ac553de8735fb1d5ecfcdfc85a0867d2bd |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/bfe4c227333e7c042fb835148b735f318edbb45a |     
      x86_64 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/dda40cecaf399c555f335a9882cca2edd4d8ea4a |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/42a91248f976b69115200218593633527e73975c |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/2a90174f46a5d8088a2cac95ef4ac482820ec761 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/53b46f02b518813b8ed4e02803dcfb0ce4bcf34d |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/4433056d34bda71590f1c671e44d7b9338582412 |     
         arm |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/c0f1ee33757fcac15371d9eadb5bf1a7fb971b01 |     
        i686 |                  xenomai-3.0.4 | NOK | http://autobuild.buildroot.net/results/795bcd5288fb6cdff9cc3f7fa31d66a94b51461f |     
        m68k |                  xorriso-1.4.6 | NOK | http://autobuild.buildroot.net/results/430a6b548fcc311f20ea71cecaa11fafac1d5a19 |     

-- 
http://autobuild.buildroot.net
