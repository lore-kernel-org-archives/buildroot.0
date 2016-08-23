From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 11:34:11 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-22
Message-ID: <20160823093411.5E70110952D@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-08-22
================================

      successes : 158
       failures : 43 
       timeouts : 1  
          TOTAL : 202

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 6 
                 lvm2-2.02.162 | 4 
                 jack2-v1.9.10 | 2 
                  lshw-B.02.18 | 2 
                 mono-4.4.2.11 | 2 
                     php-7.0.9 | 2 
sconeserver-bbb384404575f8a... | 2 
                  squid-3.5.20 | 2 
                     vlc-2.2.4 | 2 
               domoticz-3.4834 | 1 
                   evemu-2.4.0 | 1 
filemq-e59951489045825d6fc5... | 1 
                     gpsd-3.16 | 1 
               libepoxy-v1.3.1 | 1 
           libfreeimage-3.17.0 | 1 
               libglib2-2.48.1 | 1 
                    libiio-0.7 | 1 
                 mesa3d-12.0.1 | 1 
                   ntp-4.2.8p8 | 1 
                  openjpeg-2.1 | 1 
               openswan-2.6.46 | 1 
                 php-zmq-1.1.3 | 1 
                poppler-0.32.0 | 1 
                  prboom-2.5.0 | 1 
           qt5location-5.6.1-1 | 1 
             rabbitmq-c-v0.8.0 | 1 
                  thrift-0.9.2 | 1 
               tpm-tools-1.3.8 | 1 
x264-3b70645597bea052d23980... | 1 


Detail of failures
===================

     powerpc |                domoticz-3.4834 | NOK | http://autobuild.buildroot.net/results/538a2e4f24fd3d8f2c5666d2382e53f9fedc8c89
        m68k |                    evemu-2.4.0 | TIM | http://autobuild.buildroot.net/results/4c60d5583d31a6a55f3e42cb7ad88920828f4f52
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ca4decb3f7f92d40a7fbae9ac052acaab0d10e7d
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/875fd3ff9b84b3476fa23d0a551d14dce54f53a0
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/c5b700a1a59bde8860fd75bb7d2ffeff256ce3a3
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/8d28d3e428ce9fad05e920d26e5eac7c5d4be1e6
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/84dc409a6c50746cdac5f8bc5f4d91bfff534af5
         arc |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/0f4e898659812940b08008de73d081d8b5964173
        m68k | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/8430ab5edf0af5485a247083797e7f0f6cef5a17
         arm |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/1a07085c2427b6be76bfa47ec29db83d255fb469
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/90ab9bc6085579205613e6dd2c4ba22eac48df2d
        sh4a |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5a593cc7a27058a680fe1a0b6a16b41e1fef22c9
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/876ae3dbaa397ca710c1f2e41df28d22164de2a9
         arm |            libfreeimage-3.17.0 | NOK | http://autobuild.buildroot.net/results/396b79872b9c5a90182e8b1b2f9cb6df7a28b68c
microblazeel |                libglib2-2.48.1 | NOK | http://autobuild.buildroot.net/results/b9c1b0dace44d6ba7d28f09acddff4c9b16f92ae
        bfin |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/fa08b36540e8eff2f198711ce41c8cef2e8cf0ba
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/4b8abf9de3a644bde235f1c71d3b512c83fd9143
         arm |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/08681f8db5d0ba9ce0cd132eb1f448304ddee209
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/3d4df873a3d4fa199e03d8aa8694eafeac474e5a
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/407ccac95d02715ef9059b9a1282e21dc465af98
         arm |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/07e25821bb7538f765af1f9c9513998e86f3ec5e
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/ea39becf5561d1fd4c9535ee1225b8ddc859bafe
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/09e037c628ca2a27d8eb832dd070f50ec7ebb72a
      x86_64 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/da31257aaf7e0f1d7f837fcacdc1d1b4af11e630
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/ed1f7e685b80a0f1313ff97a4c5c62cd5064bfa5
         arm |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/c353ba4ab2448b0a3e72d757b29a5b2bd48eb77d
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/049d959237e696c85e3b3c5d3d716f1f45c35016
         arm |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/7aa5a3694b517e3825841da8d6497ea663e67090
        bfin |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/8c0f1a6fca6804b27279ab74e3b31a0415eb1751
        m68k |                      php-7.0.9 | NOK | http://autobuild.buildroot.net/results/c05df2d782103cebf5fa33f2f82c59df46bca280
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/0635d1bca96c9de883d83328c1359587cace767c
        m68k |                 poppler-0.32.0 | NOK | http://autobuild.buildroot.net/results/a801670a63023da16f32a64366efe32bc805a777
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/903576fa04dddcb2a0c9376563da51813e1ff5cc
     powerpc |            qt5location-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/344444aa86c5a11bded97d3b19bf3fc26ccd711c
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/919a6658680d933da32fd812d6eac26c74c083a2
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/5f7875a4ec4faeed94651a5f4a9962725264a14b
     powerpc | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/f1d161c53190797e97c78247e8cc8a6cfa46dcb3
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/76e32ab5b29169d8b667e9f30cd0114f8f6aa3fb
         arm |                   squid-3.5.20 | NOK | http://autobuild.buildroot.net/results/8d084d1818f915a6090f04957613175855cf671a
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/969944d6973bba2915f37e16f86a4d70b891f51b
         arm |                tpm-tools-1.3.8 | NOK | http://autobuild.buildroot.net/results/830fc20c68a0653afa5567edffc2ededc4e45cc6
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/6b1fe1eb20c9993b05d0b2ba796ca77976cb2447
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/907b1f35b8a0b3372249bf5443af8e4ae9af290d
         arc | x264-3b70645597bea052d23980... | NOK | http://autobuild.buildroot.net/results/51071b790866b0c7083de3a94ad2a427009096af

-- 
http://autobuild.buildroot.net
