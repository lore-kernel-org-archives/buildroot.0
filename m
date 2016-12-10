From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Dec 2016 08:30:01 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-09
Message-ID: <20161210073001.1615020C00@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-09
================================

      successes : 203
       failures : 40 
       timeouts : 1  
          TOTAL : 244

Classification of failures by reason
====================================

                dovecot-2.2.27 | 5 
uclibc-ng-test-189b47080068... | 4 
                  cairo-1.14.8 | 3 
             freeswitch-1.6.13 | 2 
                 libraw-0.17.1 | 2 
                    putty-0.67 | 2 
             rabbitmq-c-v0.8.0 | 2 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.2 | 1 
                   ezxml-0.8.6 | 1 
                  guile-2.0.13 | 1 
libasplib-f7219142e790a329b... | 1 
                libmad-0.15.1b | 1 
                 libnss-3.27.1 | 1 
             lttng-tools-2.9.0 | 1 
                     lua-5.3.3 | 1 
                    mpv-0.20.0 | 1 
net-tools-3f170bff115303e92... | 1 
                 openssh-7.3p1 | 1 
                oprofile-1.1.0 | 1 
                    php-7.0.13 | 1 
                   redis-3.2.5 | 1 
                 synergy-1.3.1 | 1 
               tcpreplay-4.1.1 | 1 
             transmission-2.92 | 1 
               trousers-0.3.13 | 1 
                  xl2tp-v1.3.6 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

        i686 |                   cairo-1.14.8 | NOK | http://autobuild.buildroot.net/results/99c1cec7d4e5c7637ab35a2b066219517471f5ed
       nios2 |                   cairo-1.14.8 | NOK | http://autobuild.buildroot.net/results/76e504c094fe1bf2640067adb56034deea0722f2
        i686 |                   cairo-1.14.8 | NOK | http://autobuild.buildroot.net/results/dc3517d6787c8ec6285db64dca25dd0a08ecc75a
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/ee04c19f329722fa80eb4ce4dc26dc721a282f1a
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/ede0ddf0c5685ece8443a9b1bbd5c63b4d98af33
         arm |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/9a542aa25d5592a197fe3c450e638d2c445f9137
        sh4a |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/2eb242296b021b050f7e19c6323fda61296a63d7
    mips64el |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/515f9293b1d4169cedbf2089fbd6732a25cbe8de
     powerpc |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/62e1d51326a2ee9d48b8a5e8f09ce123fd1ab496
   powerpc64 |                 dovecot-2.2.27 | NOK | http://autobuild.buildroot.net/results/67dd2bf9b1149c1be71a56e4bc0219b62bfb6e1c
         arm |                    ezxml-0.8.6 | NOK | http://autobuild.buildroot.net/results/c71cb96793eb8680d671eed3ef405ace73dbd1f6
     powerpc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/c8ddb55fb0348f652da890f8752513c402a6b94a
         arc |              freeswitch-1.6.13 | NOK | http://autobuild.buildroot.net/results/5ada0e2d178d4b61d15bd21dbfd6a09b28c6c647
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/ab1440315ce4d6d1a3f24ad04990f7f45721069d
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/b10485d54d198a910e8b94136d0f9ec8598643d6
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/29e58fba091b769ce2e0f61c6a581244e92901ad
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/3c03d607381e4bfcb47c0abd78f7c779d6067a54
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/455feb97743e7da6faf61cdacf50b82bbdd65bbe
        sh4a |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/bb6e18bfe82dc5afa991e08a759401e6eaef65d7
         arm |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/482a0e45b34cb631f0f990e5f32aa095a69ba40c
     powerpc |                      lua-5.3.3 | NOK | http://autobuild.buildroot.net/results/a1a469599c2c862b863c793883bb025e1d82a237
 powerpc64le |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/a971f39661c21299fea54133dc032d9332b302e5
      x86_64 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/e16ca2d6cc911436f8ece7e9f9f00e5b4906ea2a
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/b3e30197a76c1690742e75e8b95e5d59d13e0558
 powerpc64le |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/d19caeb445b7040cbd2e4ff62b7db9986e84b6ab
         arm |                     php-7.0.13 | NOK | http://autobuild.buildroot.net/results/51620704d263304f5d406ebeb3c97eaa09600f36
      x86_64 |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/85320f3b8e770bbfbec306685ad75b66e91bd6ee
         arm |                     putty-0.67 | NOK | http://autobuild.buildroot.net/results/492a7055408ed6b388982cece41e98d956ef85f8
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/37dbfbe1f10dc2f7ad7b25792764ad21db7dd9e9
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/1f1ad506401b68b1fbade858e2863a2031965680
       sparc |                    redis-3.2.5 | NOK | http://autobuild.buildroot.net/results/aeb73f4af8189f518ec7579b76c101674a113e16
         arc |                  synergy-1.3.1 | NOK | http://autobuild.buildroot.net/results/9babe0e62a6072b323aff9c6026acd792ffbf18a
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/cf6f4e4dc90c652d4f974b25a8f0a9e7a267d655
      x86_64 |              transmission-2.92 | TIM | http://autobuild.buildroot.net/results/141103ce832f308ef955a3677a9234b17610c575
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/631872f7e46ed905680da1803f1bccb2cfa64937
        i686 | uclibc-ng-test-189b47080068... | NOK | http://autobuild.buildroot.net/results/7388ffcc51a6686b8b708d7373427368d3755870
        sh4a | uclibc-ng-test-189b47080068... | NOK | http://autobuild.buildroot.net/results/926716ed127dea879c5b26c4d04dc7f0615c8f34
        sh4a | uclibc-ng-test-189b47080068... | NOK | http://autobuild.buildroot.net/results/737f1651a8bba7d3d815f46ec796955d09ba96bd
        i686 | uclibc-ng-test-189b47080068... | NOK | http://autobuild.buildroot.net/results/56a8d67a45469d2a478da8d7d1ad7c5fb5e6c0c5
      x86_64 |                   xl2tp-v1.3.6 | NOK | http://autobuild.buildroot.net/results/bcd81618de2f745a19c923c66d787b5182bb54aa
     sparc64 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/8c494de3c03224366690def2d71a9b168e11cbd6

-- 
http://autobuild.buildroot.net
