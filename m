From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 29 Jan 2017 08:29:26 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-28
Message-ID: <20170129072926.E4A5721D36@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-28
================================

      successes : 139
       failures : 35 
       timeouts : 1  
          TOTAL : 175

Classification of failures by reason
====================================

               sdl2_ttf-2.0.14 | 5 
                 sngrep-v1.4.2 | 5 
                    mpd-0.20.3 | 4 
                   ortp-0.27.0 | 4 
               openswan-2.6.46 | 3 
                    ruby-2.4.0 | 3 
                  fbterm-1.7.0 | 2 
        riemann-c-client-1.9.1 | 2 
                  guile-2.0.13 | 1 
          janus-gateway-v0.2.1 | 1 
                  lcdapi-v0.10 | 1 
                 libnss-3.27.2 | 1 
             lttng-tools-2.9.3 | 1 
                 mplayer-1.3.0 | 1 
python-libconfig-b271c3d9da... | 1 
zbar-854a5d97059e395807091a... | 1 


Detail of failures
===================

         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/d5d9705eea16f07848a313d9c83f491569734c5d
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/230a2d3c33385ae42101c96d13cc5abaa21877e8
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/a2e866b7b0c34e2b69f2fb817f8161531526000c
        sh4a |           janus-gateway-v0.2.1 | NOK | http://autobuild.buildroot.net/results/89005444f3dee9002881b5449cd137a32a286e27
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/f8f4e6708372cdd122df5fc741d310c80087d1ab
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/7d5954a5856352e58dd48e530082b9986e00b3e8
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/6093aa2de58afe140bd52f1b5f465b6663d2b2cb
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/71126c6718b864c06e2fdf1c7888c016d0c6be44
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/62db87ea34de97971798929050e8578db1ae7d5b
         arm |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/d2026ef1dd06df3d04dbf24a7aa75e3066635439
       nios2 |                     mpd-0.20.3 | NOK | http://autobuild.buildroot.net/results/3860d05fa021720b8f61de74b4f18bcd106682d3
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ac84e46bea0c16ca41ed4f83ffaa99c74db083b5
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/9565b91012118d17a02dfbdb56c133554e1a3e5c
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/430e5be3819a1424cbed25d3166dce75267d6d5b
microblazeel |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/d4dbdd1648cc536da6932800865668edbe685ea6
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/8fb4635e253f2175d37796cb3109f7d8125e5a4f
         arm |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/77f78feed127364a393c894d87e5bc0172ac6cca
     powerpc |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/70984c248a544dc0f4d12bfa255711b3ae41570f
        m68k |                    ortp-0.27.0 | NOK | http://autobuild.buildroot.net/results/cd6b1920a1f6a14fce815a34ee9bf52c921653f4
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/322d8ed53ddf19c6d4553dd2654fda1a6ebfce60
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/fc80326880fb19cd6fbd6c0073916373a52ef873
        bfin |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/68ba30a2692884f30ca97aa5f9670e3389541600
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/2aa668247b6925ff1290182a67092156b5bcc1b2
      xtensa |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/74eafbd635471956979899633b3a51b738de17a8
      x86_64 |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a42758dcfe5cd83ed34e645a9a6203fe59e8f1c2
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ba68fec555d128b673106c893e7bae41e26884aa
     powerpc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/db87a00a7cd1f8d1627fa4a39a0f67e9328b2b0f
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/be9d9d0d75dca62d9edb28c1e4d81f7f33b30ea8
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/f09b7e33d3ab115d3f720be4476cb1171100f1af
        m68k |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/d92be55947d3aa87a4ba1a5e40070aeab9fe0a8b
         arc |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/5e4a4929f5547a82a104a1590fd27cb0773fa3ca
        i686 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/4ad1fa53f4aadd320ee0528c25c2032298601fb2
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/b7674ffabd6227356a9cf8bf943a260778bc8808
      x86_64 |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/3a4751fcc6184d562df80d1cd6bf53e788e21392
         arm |                  sngrep-v1.4.2 | NOK | http://autobuild.buildroot.net/results/6993c398649469e25f2491fdb8f1ac9b6d6d8c3c
   powerpc64 | zbar-854a5d97059e395807091a... | TIM | http://autobuild.buildroot.net/results/23cd6b3c7d8fd1355eaad224cb46c5bf46294781

-- 
http://autobuild.buildroot.net
