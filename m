From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 21 Jan 2017 08:30:11 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-20
Message-ID: <20170121073011.BCAAD20BA8@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-20
================================

      successes : 157
       failures : 42 
       timeouts : 1  
          TOTAL : 200

Classification of failures by reason
====================================

                 hplip-3.15.11 | 7 
                    mpd-0.20.2 | 5 
                    ruby-2.4.0 | 5 
                  fbterm-1.7.0 | 3 
               sdl2_ttf-2.0.14 | 3 
                 openssh-7.4p1 | 2 
                   slang-2.3.0 | 2 
                    cups-2.2.2 | 1 
            host-heimdal-7.1.0 | 1 
           host-nodejs-0.10.48 | 1 
                  lcdapi-v0.10 | 1 
            lttng-libust-2.9.0 | 1 
                    mpv-0.23.0 | 1 
                 openocd-0.9.0 | 1 
               openswan-2.6.46 | 1 
python-libconfig-b271c3d9da... | 1 
        python-requests-2.11.1 | 1 
             rabbitmq-c-v0.8.0 | 1 
        riemann-c-client-1.9.1 | 1 
                 sudo-1.8.19p2 | 1 
               trousers-0.3.13 | 1 
               util-linux-2.29 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        i586 |                     cups-2.2.2 | NOK | http://autobuild.buildroot.net/results/5b6bdca76ade4d5cf9557721a10eccb61c254da3
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/68673493b55e8e3c1a429b27573f95d1238430ff
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/97aed77f17dec7450d0e1322c28fdebbb4135185
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/6138140db905e1735f0487a37b033b414bec5890
      x86_64 |             host-heimdal-7.1.0 | NOK | http://autobuild.buildroot.net/results/294a05330c03b939bb18281a5b9693c3b3980825
         arm |            host-nodejs-0.10.48 | NOK | http://autobuild.buildroot.net/results/9c08e0b745fab671123facb4a46f60eec5afd718
      mipsel |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/4ba68d3e6764f395f3314c46c4d06b101c23479c
     powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/3455044679a497fbee72378e59178724305720d9
        i686 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/6b121dee390db0b2df5c154c4689ee2e0b5faafa
         arm |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/beea88e0848ccabcafe6b92c2a69074ed1114225
     powerpc |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/09554331ddc198efc37f7e2425d53b0d4a51177e
       nios2 |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/77260b09c2d14f7963f2e0c97127f71d6054e319
    mips64el |                  hplip-3.15.11 | NOK | http://autobuild.buildroot.net/results/a471956395086eebe65bdebf38bafbedd141f009
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/e145ca4a2a9e0e92b294376f495bad1de729440a
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/cf64cc4b3a2d18387cb71729f578aba993e02bfa
       sparc |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/1c5090fe361b08c60277e54be1bfa7e80d5d31d8
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/07621b958a3a35066790543586549aa41f2effa9
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/190f55c0c705965ac2d0c92fb328b41c6ac29628
       nios2 |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/7e093be87f157c4c57e06d3a1492b5dea8ac052d
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/7b12d41bee83ad20251dbc7026e0fc665d5abe0c
 powerpc64le |                     mpv-0.23.0 | NOK | http://autobuild.buildroot.net/results/ef84723357e2772aff822d23bdf5a7615c41f544
   powerpc64 |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/cb36832fc3134fe28407856943655da5c1cbdb4c
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/f57c5afab879552dd5e028075cfc04a9ed38c3c3
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/5caf072f833ccf91435f9fff50f27d58b5762bd8
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/826eb35869883f8d633cdc45bfc4460277e34c87
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/950058a7965929ee09451f346ff45921a4720088
      mipsel |         python-requests-2.11.1 | TIM | http://autobuild.buildroot.net/results/c6bb7d0f975406d13f2dd4b2b96b0a63bb18a0fe
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/818339cf74d15fb146b4eac6b027a2f37bb13c20
    mips64el |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/c2933afef41022a6231d0bdbbf7d560d01038649
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/97bee88a5c92b10e01f75d91a7cb112eca0e6ca4
        bfin |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b74fff6cba45c2d0cd3032da664e4004e929b09b
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/eb4999088ec041619c75c94a8b723dce07861aa5
     powerpc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/b7e94a174c679d424dc47496379d8c8affcda0b5
      mipsel |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/6f8e1099353e35c18dc9ea1dbe31cb8ba2310b0c
       nios2 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/be041a25d4c583e626d7c663649030f3c179cc12
      xtensa |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/485029c68e02f1b7c4a96f3cc8eb952cec7c20d6
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5c3a743533540baae6f0255e7c9577d8d7249a95
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/629c10165384e919f27c09c52ddf8212372da030
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/d5b5574e7d8ba1615bb5237b13117266ac3eecad
        i586 |                  sudo-1.8.19p2 | NOK | http://autobuild.buildroot.net/results/c63fbf5d2dc2e33d2fd5b4574789bc1540563870
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ddf7ba082de0cf37abd6a71320faae1d2eb7ffd9
microblazeel |                util-linux-2.29 | NOK | http://autobuild.buildroot.net/results/09618ee3f39349853189400d907304ba4e9fb325
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/0ffffcc3bef7db8e4dd7adfdf9c18bc1e02edf2a

-- 
http://autobuild.buildroot.net
