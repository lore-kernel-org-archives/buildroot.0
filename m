From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  9 Feb 2017 08:28:58 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-02-08
Message-ID: <20170209072858.F0F7520C2B@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-02-08
================================

      successes : 178
       failures : 61 
       timeouts : 0  
          TOTAL : 239

Classification of failures by reason
====================================

         libevent-2.1.8-stable | 13
                 sngrep-v1.4.2 | 6 
                 qt5base-5.8.0 | 5 
               openswan-2.6.46 | 4 
                    mpv-0.23.0 | 3 
               trousers-0.3.13 | 3 
                     wget-1.19 | 3 
                  guile-2.0.13 | 2 
                 libnss-3.27.2 | 2 
                    mpd-0.20.4 | 2 
               qt5webkit-5.8.0 | 2 
               tcpreplay-4.1.2 | 2 
                   assimp-v3.2 | 1 
               bctoolbox-0.4.0 | 1 
                  cppcms-1.0.5 | 1 
             lttng-tools-2.9.3 | 1 
                 mplayer-1.3.0 | 1 
                  nodejs-6.9.4 | 1 
                 openssh-7.4p1 | 1 
                   ortp-0.27.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    ruby-2.4.0 | 1 
             util-linux-2.29.1 | 1 
                     vlc-2.2.4 | 1 
                 wavpack-5.1.0 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/a7c394eda5dab2ca139cf468f5b22debf2c7678d
         arm |                bctoolbox-0.4.0 | NOK | http://autobuild.buildroot.net/results/bdb658088df6850e3a88d5c66815816bede816ae
        i586 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/24f5402b0ef326e5cb342df566e25e7339494f65
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/83f717b103723852c68dc980003b5b5364a9b93b
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/554e39c8e901fb6076959a990f21a1bf60edba63
        m68k |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/83ee474b4bf1cb8cdac1ad0c60821c0d58eaee61
      mipsel |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/0ae813a3aa3f8c566ce8663aed29f02d3962d82a
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/71aa9f4a1cb369a23d6604a1ec7e927bc6478789
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/6cf139b6ae9a6a1f9106c6b719034724bc129f58
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/8ee50c7101d2ea5c65b283ee73ba3932a101fc43
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/b2e237db9ce8a39fedd7a66b2f5b57773654c584
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/94c38383c7537a44f7a88191e0c0689bd3afdea5
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/5ebfc7394fb359494586cfa3028cb0e30e389184
         sh4 |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/736cb0502b3e118dd5d0ac13583c31dcfa7f2d1b
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/269a3a76f61c65423ba703a85e94cc003fb75e4c
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/5a9e8467dfb0a1cab4c8e3f9ecf33b40f9690a01
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/57227cc5d1547202a9d36cbe3ac8bd24d7f0eab1
         arm |          libevent-2.1.8-stable | NOK | http://autobuild.buildroot.net/results/c3ede5fd99beb78ad8ec4ff3c21900ae94e24411
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/0c89aa3edfd860b205a4d91082eda4395f70cac4
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/147f6f5f898adee32e5723f481f8e6f1f34c7a9f
     powerpc |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/fca1f244d5833d1699aecb16b2b112129f850dba
         arc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/dce9b9fbdbe2c6d6400ecc7a5facd3a81163ed2e
       sparc |                     mpd-0.20.4 | NOK | http://autobuild.buildroot.net/results/cea2cf812aa392c9b11c25ce9d0b503d65596968
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/2f831a3743a7a6b9c72431e814c1ede5fd597638
         arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/c5b84f189fca25caa93142ed95158fa4d46fbdb8
         arc |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/6a21aa7fa75ed7becf56796978f7ef3d7c91a67a
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/76d85429147696b2c5645916d7cdaf199d3d5f91
         arm |                   nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/a2ede9663b22b1d0b7ef6487a9a573abf159a257
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/04a858c4cacc6f49a226d6b90a85298eb78bb9cd
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/977b487b09075702e78c955ff6464b5e3d26bda8
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/1729180aeb8f3d567bbdda4afaabad0b0f923c15
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9e3d7cd492993d87b820c56839d7bc3a49785b42
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/af46598a07d2e2c38ce9339d3f706c609c124927
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/2c4870c8aac8ff539c7d55f5288862e411d50db7
      mipsel |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/219162ba616289f799a5053c4dcc6b8574284283
        i686 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/1841e983b91305ab814274bdf382cd70e1c1c110
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/b5f59d85c9f175c9b0f6c11b47456fbadee25daa
       nios2 |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9d2efb3aece56dcb5d9ddbc3ca3e0ecaeff9b8a6
         arm |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/20307edcbcb9c44480e0b03c30eeefc3ad812aab
      mipsel |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/baef746129beb09e1643f6cb838e349d23841c27
         arm |                qt5webkit-5.8.0 | NOK | http://autobuild.buildroot.net/results/4a5bd7456bdc18e8467e2048b72682cd67a4b7d4
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/dd806bcd9011257f7f593fa5a4a29073a4225d64
        i586 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/dac660f96c7f85e933a6b82cf61edd429eeae9aa
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/e01780c382bfc7d91683a3a1f8f52f7452344d20
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/16953ec59a2ca436d867af5312546e1ce4def858
     powerpc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/8d4a90dc538b60817f888be2a894d87a4a1d1d27
        bfin |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6ad6e0d3cada397b69bc49649b12db7d211bfd1e
       nios2 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/4fea8f57e29bdd62ae66561a767a61e7db74b502
     sparc64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/27ab7cbe703dae99432068cd90bf7ab4977aef64
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/4e45c5b9176f52d2d7ac99b9b3c991794d750d73
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/f0bb523e0e2f39a5eeed7f69ea4e3cbcfd137135
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/39ee7c84cf573b902c4791ef2512cb3e15212c62
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/5ba7a3e2747f7c07b6d9aad19297e80a30edc577
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/f9912bcb086505037d87265cbe75144703cf0c56
         arc |              util-linux-2.29.1 | NOK | http://autobuild.buildroot.net/results/5389bb0f74d7e328580337c90fef822217cfba40
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f1ac64d4951db3957910c2754b7d4715328904c7
     powerpc |                  wavpack-5.1.0 | NOK | http://autobuild.buildroot.net/results/d9afbfe3c10ec3d553af0d68ce6c7185f608199f
      mipsel |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/c691630510e8f67c697c953d444406baf4ae47ff
      mipsel |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/fed53124d43c37629295ddc4cdc371f4dc862860
      mipsel |                      wget-1.19 | NOK | http://autobuild.buildroot.net/results/c8657563e63e1012a3ae3c0c47663a951e280022
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/05540d8d3172729c98babfe2f26833d87249713d

-- 
http://autobuild.buildroot.net
