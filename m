From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Jan 2018 08:00:14 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-01-21
Message-ID: <20180122070014.D5074206F0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-01-21
===============================

      branch |  OK | NOK | TIM | TOT |
      master | 249 |  34 |   3 | 286 |
   2017.11.x |  30 |   3 |   0 |  33 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                  boost-1.66.0 | 6 
         libcpprestsdk-v2.10.1 | 3 
open-lldp-036e314bd93602f73... | 3 
                  ffmpeg-3.4.1 | 2 
               host-efl-1.20.6 | 2 
                   gconf-3.2.6 | 1 
                 gnutls-3.5.16 | 1 
                   gupnp-1.0.2 | 1 
host-gdb-arc-2017.09-releas... | 1 
           libmemcached-1.0.18 | 1 
make[1]: *** Waiting for un... | 1 
 make[2]: *** [all] Terminated | 1 
make[9]: *** [do-all] Termi... | 1 
                 mesa3d-17.3.2 | 1 
                 mplayer-1.3.0 | 1 
                   pcre2-10.30 | 1 
                  physfs-3.0.1 | 1 
                 qt5base-5.6.3 | 1 
             qt5location-5.9.3 | 1 
          qt5xmlpatterns-5.9.3 | 1 
                 rings-1.3.0-1 | 1 
                    sdl2-2.0.7 | 1 
                   systemd-236 | 1 
              webkitgtk-2.18.5 | 1 
              wireshark-2.2.11 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

     powerpc |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/6a62f40cc8e4ebd78b577beb8a354197688117a7 |     
        or1k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f285b50d485d1b712c4bbaf8f0d9feb948f66f68 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/bfe81e4b02adf032c457a6a42a856cc6cf1f9b27 |     
         arm |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/8adc3e753f5dbf20c903d3922ab51a0d891de1ee |     
        bfin |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/0c45c6a6af2dd7498e105fc8a4a27a83b9afad55 |     
        m68k |                   boost-1.66.0 | NOK | http://autobuild.buildroot.net/results/f1e304b5a7942d08e59b0da3c90b58b76e59f9d4 |     
         arm |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/e77741f541fbc735663ce6eb38046171334cd932 |     
    mips64el |                   ffmpeg-3.4.1 | NOK | http://autobuild.buildroot.net/results/065d29fb7ea18508e9b395ba63ea68407665771d |     
         arm |                    gconf-3.2.6 | NOK | http://autobuild.buildroot.net/results/153fd72832399e353d1db2c3adde68d45197ada5 |     
         arm |                  gnutls-3.5.16 | NOK | http://autobuild.buildroot.net/results/293bf433733949b4cfda7aceff94cb9cec999ee3 |     
     powerpc |                    gupnp-1.0.2 | NOK | http://autobuild.buildroot.net/results/7742de4b0c8d495f6954a0d8ea42c7b92e50ca08 |     
     powerpc |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/a54d237a28f6946960ddf69a31b6bb6a33df0dd1 |     
         arm |                host-efl-1.20.6 | NOK | http://autobuild.buildroot.net/results/cba4637aa850d8ed2f17e5fa98f539ed6a00148f |     
         arc | host-gdb-arc-2017.09-releas... | NOK | http://autobuild.buildroot.net/results/18118948108bf53c0d587e574efd3a15c29a25a0 | ORPH
microblazeel |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/abf058948c9e4e9a50d42a05689b76bfb54a02e2 |     
         arc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/53591fbe47db0e8c32e60e49f7f9501b74e5630a |     
     powerpc |          libcpprestsdk-v2.10.1 | NOK | http://autobuild.buildroot.net/results/e55ffc5c835dc16e5f5b384357371a28b2509c56 |     
         arm |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/ece8cc6097753cc6244cd089c33b393823e0c123 | ORPH
      mipsel | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/699a2a76bc6702a4bfd7b8f1557178365570a465 |     
         arm |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/c9177894869f902ad16caf10b2ef8bfe85a92a4c |     
     powerpc | make[9]: *** [do-all] Termi... | TIM | http://autobuild.buildroot.net/results/91b357531166ae36ffe9ca87878308a1facabc88 |     
     powerpc |                  mesa3d-17.3.2 | NOK | http://autobuild.buildroot.net/results/24187f348e853d99156f7d3198b1435dc3b10f19 |     
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/b5e9db8ea19dd03ebf811193f28bb6300af626c4 |     
         arm | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/ff897db163ed9e2364d1d05fceca0f5a3a74b637 |     
        i586 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/f7e94ae1c2aa6b3f6567d1f567a66329974834e9 |     
      x86_64 | open-lldp-036e314bd93602f73... | NOK | http://autobuild.buildroot.net/results/8a43938d9c0391a846757a54cf5f956b64470865 |     
        m68k |                    pcre2-10.30 | NOK | http://autobuild.buildroot.net/results/b340f83d92ab07eb074604f73d637f5854478701 | ORPH
         arm |                   physfs-3.0.1 | NOK | http://autobuild.buildroot.net/results/a3453ac297dd47476aa7611f3632a33d3bfc802e |     
         arm |                  qt5base-5.6.3 | NOK | http://autobuild.buildroot.net/results/fb0d3d449bb80aa646791a50f589929e3989c70f |     
         arm |              qt5location-5.9.3 | NOK | http://autobuild.buildroot.net/results/6fd05cb3aeefa5e80af3a063eb181427d99b0133 |     
     aarch64 |           qt5xmlpatterns-5.9.3 | NOK | http://autobuild.buildroot.net/results/cd0a64a419ce0ceac996b060b10c3b490d142ccc |     
      x86_64 |                  rings-1.3.0-1 | NOK | http://autobuild.buildroot.net/results/cb6f73a21cded5cb7cd82f8af2a7645e3d8f7fce | ORPH
         arm |                     sdl2-2.0.7 | NOK | http://autobuild.buildroot.net/results/ce09bc14a0ffdf0cfff105303bc43a390c08b681 |     
         arm |                    systemd-236 | NOK | http://autobuild.buildroot.net/results/36abc471b972ab698100d8ec2f584f4ee2b8715a |     
      x86_64 |               webkitgtk-2.18.5 | NOK | http://autobuild.buildroot.net/results/57b77520d3a3fcfa683406e223771d0ccf8733df |     
     sparc64 |               wireshark-2.2.11 | NOK | http://autobuild.buildroot.net/results/466fb3d7fd17f05399df1f9fe226eb502adae8eb | ORPH
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/f398ff06f0fa690af9532fef4fdd4d528d5c0cb6 |     

Results for branch '2017.11.x'
==============================

Classification of failures by reason
------------------------------------

         network-manager-1.8.4 | 1 
    trace-cmd-trace-cmd-v2.6.1 | 1 
                   zmqpp-4.1.2 | 1 


Detail of failures
------------------

    mips64el |          network-manager-1.8.4 | NOK | http://autobuild.buildroot.net/results/e1464adf0069952ef0561a0a9b501d26bd409c4a |     
     sparc64 |     trace-cmd-trace-cmd-v2.6.1 | NOK | http://autobuild.buildroot.net/results/0b8d0578372b03ce8ae51604aeb7d04659c231e7 |     
        or1k |                    zmqpp-4.1.2 | NOK | http://autobuild.buildroot.net/results/35269a50d4c59f3b5098309c43af2d7c99316233 |     


-- 
http://autobuild.buildroot.net
