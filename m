From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 24 Sep 2015 08:30:17 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-09-23
Message-ID: <20150924063018.00A16102391@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-09-23
===============================

        success : 211
       failures : 55 
       timeouts : 0  
          TOTAL : 266

Classification of failures by reason
====================================

            shairport-sync-2.4 | 18
            micropython-v1.4.5 | 3 
               util-linux-2.27 | 3 
                directfb-1.7.7 | 3 
             bluez_utils-4.101 | 3 
       kompexsqlite-v1.10.12-1 | 2 
             lttng-tools-2.6.0 | 2 
                    ruby-2.2.3 | 2 
              drbd-utils-8.9.1 | 2 
                openntpd-5.7p4 | 1 
                  ltris-1.0.19 | 1 
sconeserver-3b886c3dda6eda3... | 1 
            gst-ffmpeg-0.10.13 | 1 
                   redis-3.0.3 | 1 
                 sudo-1.8.14p3 | 1 
                coreutils-8.24 | 1 
                     nut-2.7.2 | 1 
              libethumb-1.7.10 | 1 
                   mpd-0.19.10 | 1 
                  apitrace-7.0 | 1 
             webkitgtk24-2.4.9 | 1 
                openssl-1.0.2d | 1 
                   systemd-221 | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  libssh-0.7.1 | 1 
                  mono-4.0.2.5 | 1 

Detail of failures
===================

     powerpc |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/a9c4ed838fae31cb680ff5e19bf03dd7e2f85094/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/03c5659b75798df17a0a1ee442d2e31ee37f7d15/
         arm |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/80c20a7b4c4c21eb7feea00436aa9fc363aa1053/
      x86_64 |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/147fbdc5c49135aa3b8886e9285c6e6e47c28df5/
         arm |                 coreutils-8.24 | NOK | http://autobuild.buildroot.net/results/a0bf0e89af8f04b4d38ab7d8ed14e5e69032e770/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c4f118556301ea4d025fe692cd9d9a385ebbfaf9/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/ed1b93705833a54ac4f44e874859a96c835f6ebd/
      x86_64 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/bae5fae7e4adbfcc41758bb5c8a56f873a13491d/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/a420b619e49daf961a6cc8e4fbea91dcbff32d09/
         arm |               drbd-utils-8.9.1 | NOK | http://autobuild.buildroot.net/results/cfec49ff6991b93c53e9ae56c740ebfff465f8a0/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/d303501fd9bdcd7a47ea95c6538da48ed9d398af/
      xtensa |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/1925937405bbc1a0628d4ae96f98e603527b6ff9/
         arm |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/6279ca81c5dd620fc8796f5cea10db86cdd468b6/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/6b367c6c7e68123f93444ee7226b15240c25c85a/
         arm |               libethumb-1.7.10 | NOK | http://autobuild.buildroot.net/results/7a9e7e34e9f3ebf2c6989f7000edbc59cee71490/
         arm |                   libssh-0.7.1 | NOK | http://autobuild.buildroot.net/results/ae6e4ce05a5107b5a3869be36ecbe476f4fb8a06/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/1a03c6bd8eb6b113a1c51c43c441973e9161a206/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/7a132e6a64787e40cf365df5d943c5b945fdd98e/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/63fee84b33c0136718660986d94273971bf00508/
    mips64el |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/ab2e8ac6cccc1090e4fcb5d8d18786243352c911/
         arc |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/648a7b66d989db5aa6815bc907505678de3ffaf8/
        bfin |             micropython-v1.4.5 | NOK | http://autobuild.buildroot.net/results/b6441946c4c31d895dc5ecd4690be6e2cc1c4b5f/
     powerpc |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/2c743e538e19cc7b98a351957f571f0a50cb7a7f/
       sparc |                    mpd-0.19.10 | NOK | http://autobuild.buildroot.net/results/8a17d1658db10684f4963855c835a6fba98e4a58/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/fa4c647ce58b91b863d8de5bf9d44b2060a1cf1c/
        i686 |                 openntpd-5.7p4 | NOK | http://autobuild.buildroot.net/results/14e48e7139efdd4ae0a4bc8ef95fc1c1222cd09e/
      x86_64 |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/8a065648d56cd9ee38a88ebac8ef967f3371b6ce/
       sparc |                    redis-3.0.3 | NOK | http://autobuild.buildroot.net/results/494085478e2e1e2b028a76c791fbcea5aa6da168/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/30b61a113027393125d343ad1cb6217a7152bd57/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/3e17cc4ecba7186bc25aaf151aac6b028fc76695/
      xtensa | sconeserver-3b886c3dda6eda3... | NOK | http://autobuild.buildroot.net/results/2c9dd9ffa63c15e9db6583e0f4964dd52a02a384/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/71f3d0b9843d9bed517c7327ccf473c3ecf9015b/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/7760a326f6747c0677d584a2fd0cffd9f59ee2ee/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/6e11db212fe7e114cee5ce0d889be09b81788635/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/35687ed1bc629bd8b63e94736de9e4863e511490/
      mipsel |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/0a427dbea5de74df6ffc4862e8821709409ac0c1/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/ab32342ceb5cfdb436c80e49792710152de4307b/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/8c125c0febf100ab4c6d6e88c9e6310426f594ee/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/a4d113564b7e04fb4ab3ac2350edb1913413025e/
      x86_64 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/51794af61625f0a0f8f049f278c2351ea9c426dd/
         sh4 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e097216216499699c6fc79d05755146e65a562c2/
        i686 |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/d3bd98ffa1b1289cf5770a7e765628d548f7dea2/
    mips64el |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e48295fb510bd0605963bab59b3b176c2b0b19b0/
         arc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/da5ca40af6b080a0680bffa38f602bb13dd46a0b/
    mips64el |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/401fa92bff45ba4746cc7836625f1cdfc8a6f563/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/4bce74dbf845f6dc6a5c9cdd744af1262ca7b602/
        sh4a |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/96ec194b13efb4a772411b120af1e2f3b1c9885d/
         arm |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/e3972c5d506b1b4282910a0f2fde109ebb7543f6/
     powerpc |             shairport-sync-2.4 | NOK | http://autobuild.buildroot.net/results/2ed636a3fec7346bd1e97d03d51355595883824e/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/b81d95906471bbb61b4d35cfd68a3ebaeaafb456/
     powerpc |                    systemd-221 | NOK | http://autobuild.buildroot.net/results/16d136e5669d275cb13036c7fe8de1482973a689/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/96cc4c8c2daef78ee151a59053755f3fb3fc0b16/
     powerpc |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/cf8cb4777b8016ac3b978b54e641f370c454a0d7/
         arm |                util-linux-2.27 | NOK | http://autobuild.buildroot.net/results/826e97770e31456aa616f04deef66cc98aac96a4/
    mips64el |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/4f53d63c337a5af64371632c71d00fb82f908df8/


-- 
http://autobuild.buildroot.net
