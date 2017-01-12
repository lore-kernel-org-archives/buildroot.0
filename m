From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 12 Jan 2017 08:29:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-11
Message-ID: <20170112072936.E6D7420795@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-11
================================

      successes : 149
       failures : 45 
       timeouts : 2  
          TOTAL : 196

Classification of failures by reason
====================================

               sdl2_ttf-2.0.14 | 7 
                      mpd-0.20 | 5 
kmsxx-bd5f6471e619a6ba2987b... | 4 
               util-linux-2.29 | 3 
                  fbterm-1.7.0 | 2 
             host-nodejs-6.9.4 | 2 
            lttng-libust-2.9.0 | 2 
                 openssh-7.4p1 | 2 
                   perl-5.24.0 | 2 
                 synergy-1.3.1 | 2 
             berkeleydb-5.3.28 | 1 
                    gdb-7.11.1 | 1 
                    git-2.11.0 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
                  lcdapi-v0.10 | 1 
libasplib-f7219142e790a329b... | 1 
 make[1]: *** [all] Terminated | 1 
                    mosh-1.2.6 | 1 
                 mplayer-1.3.0 | 1 
   python-beautifulsoup4-4.5.1 | 1 
python-libconfig-b271c3d9da... | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.6.2 | 1 
        riemann-c-client-1.9.1 | 1 
               tcpreplay-4.1.2 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/2fcbfbc24472e2962774a1e23d5a06a4eb6fc6dd
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/11d69f8224326fd0061f7d944326243b3a930cf8
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/b05bf665be31b24fbc63068e2cdb905d04a8f595
      x86_64 |                     gdb-7.11.1 | NOK | http://autobuild.buildroot.net/results/03a7122919177f3361eee97e884f558ffec6f6b0
microblazeel |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/6be94fe2542f3ac9fb785dd22f504e25c2a7802e
        i686 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/1ac387cba93d00978b55d97357816f5b84b8cb16
      x86_64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/45efedc1e798cb01cd47059fd7527c9b6f496f0b
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/40d7ed51966428bc05876216ad9552588edadd16
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d24666c25b0c10580c3a9ee1fa5fb6bc7b82cb69
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/85747ce3d39844f0eb49100a56bf38c1288b4c29
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/e1908ea0e7be05fee7e3d780de7ba8fee0e9089e
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/0ad52ba4f3f68def099bf5d45bab310dfc935d4e
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/4828daa4fc6ede3bc6a3ea0a462b4e2501b05eea
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/14f0704c88a8d4e5bee06468cc2ba053e1f71ae1
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/d89e0477382b22a7050cae4cc0c87acee48858ac
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/f853579da79f1bd62c4903ea3f294e6e230c152b
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/6bc9272dc24d6abe61554b548c623cb6b9e52186
microblazeel |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/7bd3957f752651b41dca5513d3fe2587c021de1b
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/ac5121b7718f7be08d8ee34b38a6d7b65ee2ac2d
   powerpc64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/be98103fd952b9ebf2edbf8cfa0f247e656ac4b1
        mips |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/2e3dbcdea34053675a0139c1911b6da1a6670e2c
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/affbe2fcd922c59d1e24e4d391b4128755f43d1a
     aarch64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/1cc097c5022bd3161dc03b0866cb04075c944a64
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/9f062dc51daed5c5047faa8d79ecbd4e228f2572
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/7b072c679cb225fd3aa065280e31e934ad6b9c94
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/f8595b1d2d6c58429b7c6634b973dfd7e989b761
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/160f0e1470d24bd6f8caa52f1ecb9f352417112d
         arc |                    perl-5.24.0 | NOK | http://autobuild.buildroot.net/results/94cbf28b1cc4efa49b0dfb6c982156133624bb00
    mips64el |                    perl-5.24.0 | NOK | http://autobuild.buildroot.net/results/6ee1f2c3d9c2dc07515ca814477f2f0780be87a0
      x86_64 |    python-beautifulsoup4-4.5.1 | TIM | http://autobuild.buildroot.net/results/5c37a57e977afe1a749e499208457c905c41c3dc
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/4b148a8c0220335493c1e0321d67ece00dbd4daa
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/83e1bfe6810eb3025f1b12a78eb9b7a1d1280416
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/f34a66034ed4fcba8ac4a277c3034069e9fc151a
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/f5b43b6d8e29cfb0eb07e0d04ca0c6bf50d20117
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/015ab134ec8269d721b1e6cb4988b484d6fbdc51
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2f41731554b0dc8492a43ac61d3157e2e7f69744
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2fcc252cc49a6899dfe6d7c8be1cf6f95da16f3b
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/4ef2d2c5bac3d45fea1e7d78124f91271d2150db
      mipsel |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/21bac90fbb9e7e2825e1158a61420b04e2b364a4
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5aa8cb1d4537f9f06fe168217d1bbb407b46cf93
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/53769b3025de4c5a53277a79d0afb8361b8a80a3
         arm |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/a601cc0338f6228d1422a71ddbcf563aecdb2cdf
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/95457f43690706431b9b68c9ba7f01ec7f2be41e
         arm |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/582aa4677a64222284bdf76e63735f483f28c9c6
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/3a2f228e0fa7b5cc28a13d49f48f1a6aef8d9d7a
     powerpc |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/99e96069f652d511c6212a5bb6be29e68fb1747c
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/2dc5721aef93b7b410153bafad78248fac3db941

-- 
http://autobuild.buildroot.net
