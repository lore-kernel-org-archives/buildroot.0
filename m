From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  9 Jan 2017 08:30:10 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-08
Message-ID: <20170109073010.B5F0820779@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-08
================================

      successes : 170
       failures : 74 
       timeouts : 2  
          TOTAL : 246

Classification of failures by reason
====================================

                collectd-5.7.0 | 18
               libglib2-2.50.2 | 9 
               sdl2_ttf-2.0.14 | 7 
                    flac-1.3.2 | 6 
                      mpd-0.20 | 5 
                 gnutls-3.4.17 | 3 
             lttng-tools-2.9.0 | 3 
                  fbterm-1.7.0 | 2 
             host-nodejs-6.9.2 | 2 
                 libnss-3.27.1 | 2 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
                    cups-2.1.4 | 1 
             i386-linux-uclibc | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
                lmbench-3.0-a9 | 1 
            lttng-libust-2.9.0 | 1 
                    mosh-1.2.6 | 1 
                    mpv-0.23.0 | 1 
            netsniff-ng-v0.6.2 | 1 
                      nmon-16f | 1 
pifmrds-0bf57f9ce0d954365a3... | 1 
                     popt-1.16 | 1 
                    qemu-2.7.0 | 1 
        riemann-c-client-1.9.1 | 1 
               tcpreplay-4.1.2 | 1 
               upmpdcli-1.2.10 | 1 
           xapp_xdpyinfo-1.3.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/7752d06e43b80cf63b8c3c1b1ba779c5fc4af86b
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b5073a07a90121e4335f3269e206da0001ebc622
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/0eaaca3c1bcb2f7cf19555ff3ed1b66745a0f193
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/eb0dfdd8e37b6b7bf973ce6d7a0ffad4c8720f75
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cc1b314e2f55bccafd9c1b884be16db2ea6ee492
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ba31b967204c1099727c7c2764e830e4354ea42a
        sh4a |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/dce8c6ff733bdb265e4813eed9a24fb510700f09
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/fa30ed471058da4a54c934d8ae860c924c9b510e
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f25ee4919efe6191ee2d0164d504f0b44bca9ade
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/757778fe99f1d9af7302f0cbcea131a6d0913f59
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/881e5cd71a9c4f314a36cf6c60f5c21a7d95503d
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3791b57cb11c92cd3532fcb51a9df594d2c67d61
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/80d58d852d08ea0b879b16d05a3bffb17ce594da
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8ce33d5c7605e274906d9b29e02a4b9dcb5edc64
        i686 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/559e8363abb504121af4fa1ca1e0c2ea9f68102e
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c7c1ad2b6f820b696b4d5a76baa5eafc61908db1
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9f1a8d44dbfb3ebaf997995767d85acec6120b3c
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/f458cf77e485e7705aec2a92e34109e15a49ecc2
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/80c6f66498b56fbf227a2eabfc95b8c691fe3154
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/3bf7f384481d0f5f0bf986668fea27a21d498842
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/0f251c7484d76713ec7816688bd2f9305be3fdd8
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2582545ae970a1052a3aba644a359c83623074ff
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/2793edc8b77ea97cd67486b57cf5613042573f26
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/dc9c5f943aa8be827df2ba30887e54a67d6fbc47
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/5851bcfe06e3479673638c1064c4a2b00f4972d2
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/67cdfdd2a3312e133efcb5d95a679b258df15b0b
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/799e145540975c43450b7b449408ca48034c1c2c
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/fe01a36e2ea550f53e063c9f4dc523fad473b96b
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/c1fdc79fb563e5f280175ed1925728d881a05718
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/628e5e3e3a99e898ccbfbafbe1a89171a6041a50
         arc |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/a603cfd6012c6400c2b38cd39df0f4abdcebcb09
         arm |                  gnutls-3.4.17 | NOK | http://autobuild.buildroot.net/results/8d5d5348d22873084583f72dd9474e65add2199e
        i686 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/f9eeff3017796d4916321993c156d681bd1ede72
         arm |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/05c85464b57c6695cd57e1f1e4a90c058a3deebe
        i686 |              i386-linux-uclibc | TIM | http://autobuild.buildroot.net/results/fa4971f02028aa8a4ebbcd7fbdb3e0979eaaaa87
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/859f996795f35addd96ca8714337ba3faddd1f0a
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/2312bf5ac26d764800965ebfa7185d68709b2ecc
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/e6915542892baf623416c5d331f0dc43aa4c1954
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9a3f24c583fe6d26eb05af87141e1042ca378ad5
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/8e55f13777da4443df33eea562ea1148f3cae4dc
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9579b4cf1c42d2a26cc9ffad680b501c1a5a2891
         arm |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/a5d361176a8c3cbc1808806846c807a5dedcc9f4
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/246dabe7abd7467555039013b3fd9ca54efa1cae
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/9c24a894fd06f37ed09d852a7eb98c864af3e962
         arc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/a186ce93fe62cff9b5e535d5f2b6bfd4e02cd541
     powerpc |                libglib2-2.50.2 | NOK | http://autobuild.buildroot.net/results/b9d2468c3af8cd8f75497c2d1571aa0ab322ef2b
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/e2c8216251ead489a2df974461b8cd5a50e16708
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/57ad095a785b5beb1c1a49440073100c3f684ec9
        m68k |                 lmbench-3.0-a9 | NOK | http://autobuild.buildroot.net/results/9be7d797b3a087c994dacc1afddb414b74accefd
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/0b015194410c91311e9b92d7f97c1d1f8a59ba35
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/04e375329a8fa3ba324de22441da72cdea7dc61c
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/9347697b6a94a35f817f689a7418d5214dbc5f44
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/8a3cf45ee337f57a7c1824705453482a8076ebca
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/9a51f6d0cfebb45541597660a5045c4b3fbe22ba
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/0316a09635e8778a5dc06c570400a9757582d0f0
         arc |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/27c37cb6770376b18cea1e3002efef49323f64b8
      xtensa |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/a85bf59cb1d16cf50663db4654fa85dfeb41dfc8
    mips64el |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/1e96fc63ed95c28d94b2f220d3b5c59a7e9f2d67
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4ae14132a43b3a24ec35d6f8bb6d661f04ccea49
   powerpc64 |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/59bcfd6190d7066b1ea1810c1fbaa3fcbf251eb9
         arm |             netsniff-ng-v0.6.2 | NOK | http://autobuild.buildroot.net/results/adc59a602cfa5c7c0fbc6e6cd93790fd5b20b76e
         arm |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/dc2906a8255a888977a4ad186a1921a92c08201c
         arm | pifmrds-0bf57f9ce0d954365a3... | NOK | http://autobuild.buildroot.net/results/76137a6dd9ecab741ab1d0e90c8ee1c35a46429f
     powerpc |                      popt-1.16 | NOK | http://autobuild.buildroot.net/results/411f6eada514e1cf5c851ddcda50090f84ea5fba
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/5a0f5adf7ac7e8fa8a2ca87fe1a7245d07790790
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/687190a192172e6f04fd7e928ebc29e5f1d7ae93
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/82d53310a27bc110d2a24cc3bf81d7273b8375fe
        sh4a |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/258792cbc7633f5f1428fc3bc14d78456b99b06f
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/b62f9557755e9e04f134d21bafe729847071cbde
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e7c050b553bb2047943f3d4ea9d3d3b6f25d78da
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2eb9431c23c8ee6c31c226ac300cbd6535e7b495
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/157a65199dbe295ef16c76fed1263ae72497ff3a
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ad17787ff35190c2db9eb47e7185e3d15ac77f51
      x86_64 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/c8edd775616c4fd7e0629861bf268d0ebc17e556
         arm |                upmpdcli-1.2.10 | NOK | http://autobuild.buildroot.net/results/a54c82b74eb558740092e3b844b2d56f67c3c8ef
      mipsel |            xapp_xdpyinfo-1.3.2 | TIM | http://autobuild.buildroot.net/results/10e527b454dc9eddfb282da91d708159cb96ce5e

-- 
http://autobuild.buildroot.net
