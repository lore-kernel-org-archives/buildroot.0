From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 20 Jan 2017 08:30:09 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-19
Message-ID: <20170120073009.7775920C00@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-19
================================

      successes : 151
       failures : 43 
       timeouts : 1  
          TOTAL : 195

Classification of failures by reason
====================================

                 hplip-3.15.11 | 8 
                    ruby-2.4.0 | 6 
               sdl2_ttf-2.0.14 | 6 
                  fbterm-1.7.0 | 4 
               openswan-2.6.46 | 4 
                  cppcms-1.0.5 | 2 
                     tslib-1.3 | 2 
                   assimp-v3.2 | 1 
             berkeleydb-5.3.28 | 1 
             expect-2014-05-02 | 1 
             libsidplay2-2.1.1 | 1 
                  libsvg-0.1.4 | 1 
            lttng-libust-2.9.0 | 1 
                    mpd-0.20.2 | 1 
                 openssh-7.4p1 | 1 
             python-six-1.10.0 | 1 
             rabbitmq-c-v0.8.0 | 1 
               tcpreplay-4.1.2 | 1 
      trace-cmd-trace-cmd-v2.6 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/05ae5bfb476543e58650072c4063f58841075ad7
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/af890f6ed91b20354374ccc697ddae069621a645
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9e9b1b7742204b050783a7a0b5be8ee179cae7a1
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/0b399a64e101edd5c8b3d35ce6e14540f33182f2
      x86_64 |              expect-2014-05-02 | NOK | http://autobuild.buildroot.net/results/232800d086e6c3986ce860251f37354b8132ccd9
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/f21694d8366b0d95914e481352df0ee29e849fec
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/08e8e6782b46119237ffe1a330588b48d322a287
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/ee4743c18b55ba469962e78ec7c77d49461b55ad
      xtensa |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/63bec88f1709555e07dd33c29bd1b65c6b95d4f5
     powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/d3b55375fbea16929ac52eb830496c53fda3c892
     sparc64 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/702fcda25ca3b1847000719063e62c53d13cdcc0
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/7c9e8884f94548786797ffd1909508ab79d2fac3
 powerpc64le |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/b8596b5b21fb1c95642f85d6623a116a7d653991
        mips |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/e35bfd0e1e5fed20728b18916cc2a20ba5205828
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/6ac1f0249462f8388787585df9c3279998dd83b8
         arc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/5e4fd2a2e8edc6ac8a09fc090313e71b65495276
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/485b6fc2f8f3aa6251a24b295d12ba64ba19f881
 powerpc64le |              libsidplay2-2.1.1 | NOK | http://autobuild.buildroot.net/results/5f17e384ebc9ec44875b05598353e505adca3155
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/8fa4a4d435658491f85de775cdd1552491b95958
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ae34cc156ad208c586e443d06935b98daefcfa8d
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/8d9e77ee3a2713026523cc0da0144c033a5f40a2
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/85468f6f95a3e1b6126601040f78a30699951aad
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/2f5d282ebdbcd6b0d7eb8405bf6a70bbb7050f91
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/0d36221d7e063147edfd05c01a5ace522076280f
         arc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/c0801f26f0898874b194b0f5bd1e37e7b3c54211
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/a439e7f6afa25dcaff0a159e9f44858f47e70408
        m68k |              python-six-1.10.0 | TIM | http://autobuild.buildroot.net/results/05f19861376b5bd88c125f70ae757a8370e8e30f
         sh4 |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9d2e1bd6ea95a07e22bdedf1ed8e742fd2b3770a
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/0b6d1ee0d3d90102b9a48427f8aaf5957a6c3c10
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/294b964b7b9cc49ff9119e0458172ead81b96a44
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/9408c66e6aae9762dfb4ac9037e08708b39a5183
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/03147a6a8c1e85c0d808b418713324baf513e49b
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/9b7571b05d99661bd9ed6bae99f31e20fc678e2c
        i686 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/f2ce155960b6a7c46d5f4f74d897173a557e5bf6
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ca3655953a5458989f36a61033364a3f9670d89d
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e885333a92562b971adccd5cd927698a4a52ad46
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/8c2980659734627d5486675bcb652d316bfd6ea0
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/9579f4d4ece44b9f519513d590ac61c27f28266d
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/76cdfc68bfc61f4d9a9ef0e1ae93290bd06a93cc
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/be2209a37208e519fcad0f2475e2501c90a81afb
        i586 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/f40451b7bf86495bfa431ff47e578791399972ef
     sparc64 |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/bd24f21cc1c15f49aaf540158c39629e7fe88a3c
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/28df38e2a042f1b5940bf35c18334ebf8810a348
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/c383cfee3673aa9fba36a86f1e68de63413c2987

-- 
http://autobuild.buildroot.net
