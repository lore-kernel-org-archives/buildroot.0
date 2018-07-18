From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 18 Jul 2018 08:00:43 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-07-17
Message-ID: <20180718060043.A904B20884@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-07-17
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  22 |   1 |   0 |  23 |
   2018.05.x |  19 |   2 |   0 |  21 |
      master | 162 |  36 |   1 | 199 |

Results for branch '2018.02.x'
==============================

Classification of failures by reason
------------------------------------

              procps-ng-3.3.15 | 1 


Detail of failures
------------------

         arm |               procps-ng-3.3.15 | NOK | http://autobuild.buildroot.net/results/2274df53aef9fdef7266311e119b4ecbac2bb152 | ORPH

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                  samba4-4.8.1 | 2 


Detail of failures
------------------

      x86_64 |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/2c3d042100916e62ccf4254a58d3a98c73f0890c |     
         arm |                   samba4-4.8.1 | NOK | http://autobuild.buildroot.net/results/02e8c3ee1cc41b10316cb2e61584ca2cc04f7c2d |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

             gnuradio-3.7.13.3 | 12
                  boost-1.67.0 | 4 
                   bind-9.11.4 | 2 
                    brltty-5.5 | 2 
     docker-engine-v17.05.0-ce | 2 
linuxptp-303b08cbf55096aba5... | 2 
               mono-5.12.0.226 | 2 
               pulseaudio-12.1 | 2 
                chipmunk-7.0.2 | 1 
                host-libsodium | 1 
                libmpeg2-0.5.1 | 1 
                 opencv3-3.3.0 | 1 
            perl-net-ssh2-0.69 | 1 
             qt5wayland-5.11.1 | 1 
                  samba4-4.8.3 | 1 
          shairport-sync-3.1.6 | 1 
                  zeromq-4.2.5 | 1 


Detail of failures
------------------

     aarch64 |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/b8da651e8fb3263b2ddbe203510360fea985e700 | ORPH
        or1k |                    bind-9.11.4 | NOK | http://autobuild.buildroot.net/results/3ed5db37463c0d77f4e53d5f1ce3be510cb52b14 | ORPH
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/31cc15a4cf32a2e34c92fae4f64e7d97969f50da |     
       sparc |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/56a8c39d7b5fafb1817c797eadcbeeea2acbee43 |     
        i686 |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/52c21a8f23416ca9ade802b11d02d04203ab017e |     
         arm |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/fd969314261641dd8afadf63feac0cfc6df39cc2 |     
    mips64el |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/67972a605ecc47b0dd5e24c4d90682657870bb2a |     
        i686 |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/8a4130460467bbb9d7a2437fbf22242a2720b800 |     
      x86_64 |                 chipmunk-7.0.2 | NOK | http://autobuild.buildroot.net/results/d1268b168f570d3b6f4831f995bed3000cd566ec |     
 powerpc64le |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/55278a6ea354a13e8d03cae8dbe3799c69b5cbf0 |     
     aarch64 |      docker-engine-v17.05.0-ce | NOK | http://autobuild.buildroot.net/results/9ae625680a377f5cd06072b8907ad61aefc8b462 |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c36c0169fc062afea4f013ebd930e3f9892364fc |     
      xtensa |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f98383c23b7c39351f92b6cc9c0ec804e34cb59d |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/398ce4b55393b9c076c7b41eef88d332ed1eb379 |     
    mips64el |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a1109d52666f09ce38e53aeaf163b3c5612012b8 |     
      x86_64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/f65eaae4219ee2b8e79388ed501abd472aa7ee2c |     
         arc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/b5b99596e055309c16eaa1d5b2323286e88403c0 |     
         sh4 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/0d4682ca1c7a07fd4474737b548ebcdeb9c29386 |     
     aarch64 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/acc79a0a7b16f9ce65cf5683c70a06e4966ce2ed |     
     powerpc |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/48afa8b000b719a008891624ebd82444d87033da |     
         arm |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/a493a0ef2f1120687d0bcabc43662ea6e4d31194 |     
        i586 |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/c19a25ba375723ca465599eb6fc662b81c19a5db |     
microblazeel |              gnuradio-3.7.13.3 | NOK | http://autobuild.buildroot.net/results/d5fa9ca369988ff496ae32b61bc3e773ce9b4bc9 |     
microblazeel |                 host-libsodium | TIM | http://autobuild.buildroot.net/results/4065d84079bff2cc2e67dd7f2ca83c3c3e543da9 |     
     powerpc |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/33071e14baf28d68bd4610bff12be3399ecafd91 | ORPH
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/fcd6030620f5da3471e85ab4b9249b23eb252ae8 |     
        m68k | linuxptp-303b08cbf55096aba5... | NOK | http://autobuild.buildroot.net/results/0000c4b34621f27157ed252e1d16a93cc24c25b3 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/232960051b882a4cc29913d381bb6bf6d1a582b5 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/6122749c78ab7fe321ce6083d957f5cdd63821fe |     
     aarch64 |                  opencv3-3.3.0 | NOK | http://autobuild.buildroot.net/results/4961f28328c7d8a417af1cb4a0c6bb7f86214e06 |     
      mipsel |             perl-net-ssh2-0.69 | NOK | http://autobuild.buildroot.net/results/6ee18e7dd17f168c52f79e49cb5e94cf3aa3df1a |     
      mipsel |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/c67d7eb5c35ac3cd21871fd0669c76de74e3e34b | ORPH
    mips64el |                pulseaudio-12.1 | NOK | http://autobuild.buildroot.net/results/ff2afc603237c47e21b9b7101b10ca47459aa725 | ORPH
         arm |              qt5wayland-5.11.1 | NOK | http://autobuild.buildroot.net/results/3b5788a00dd9630ab19e4386d50f5da37158b03e |     
     aarch64 |                   samba4-4.8.3 | NOK | http://autobuild.buildroot.net/results/46363cf4bea7124694175ebfc76158894d8abf9b |     
         arm |           shairport-sync-3.1.6 | NOK | http://autobuild.buildroot.net/results/806867ab1c6f42ad1b34d44844efc57272d48235 |     
        m68k |                   zeromq-4.2.5 | NOK | http://autobuild.buildroot.net/results/83464a892df58e5c43bb5f8d2d2465f2fd61eae9 |     


-- 
http://autobuild.buildroot.net
