From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 12 Aug 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-08-11
Message-ID: <20160812063024.CD3C31030F3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-08-11
===============================

        success : 193
       failures : 61 
       timeouts : 4  
          TOTAL : 258

Classification of failures by reason
====================================

                  ffmpeg-2.8.7 | 4 
                     gmp-6.1.1 | 3 
              lirc-tools-0.9.4 | 3 
                 rpcbind-0.2.3 | 3 
      kismet-Kismet-2014-02-R1 | 3 
                   cmake-3.5.2 | 2 
               tinycbor-v0.3.1 | 2 
      trace-cmd-trace-cmd-v2.6 | 2 
                 mono-4.4.2.11 | 2 
                   ncurses-5.9 | 2 
make[1]: *** Waiting for un... | 2 
zbar-854a5d97059e395807091a... | 2 
               qt5base-5.6.1-1 | 1 
                     pcre-8.39 | 1 
           quagga-1.0.20160315 | 1 
openblas-f04af36ad0e85b64f1... | 1 
                 weston-1.11.0 | 1 
                  stella-4.7.2 | 1 
qt5webkit-b889f460280ad98c8... | 1 
          sane-backends-1.0.25 | 1 
                alsa-lib-1.1.2 | 1 
                socat-2.0.0-b9 | 1 
                     mtd-1.5.2 | 1 
               linux-pam-1.2.1 | 1 
                      qt-4.8.7 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                  connman-1.33 | 1 
               trousers-0.3.13 | 1 
                    norm-1.5r6 | 1 
                upmpdcli-1.1.3 | 1 
                wayland-1.11.0 | 1 
                     xen-4.6.0 | 1 
                 mesa3d-12.0.1 | 1 
                 jack2-v1.9.10 | 1 
               mosquitto-1.4.9 | 1 
                   lldpd-0.9.4 | 1 
           igd2-for-linux-v1.1 | 1 
                     vlc-2.2.4 | 1 
                 liburcu-0.8.7 | 1 
                   fwup-v0.8.0 | 1 
               wireshark-2.0.5 | 1 
             rabbitmq-c-v0.8.0 | 1 
                 lvm2-2.02.162 | 1 
             spidev_test-v3.15 | 1 
             libxmlrpc-1.25.30 | 1 
qextserialport-ada321a9ee46... | 1 
 make[1]: *** [all] Terminated | 1 

Detail of failures
===================

        bfin |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/cc78d46f9bc6a49f05bb5e681da6d82b6dc1feb7/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/85f4fc1ce6033268b08991d1dbd5de6b84632e0d/
         arm |                    cmake-3.5.2 | NOK | http://autobuild.buildroot.net/results/e6df0bdab1e28b2c9e32d4f93d535dfb732e622d/
        i586 |                   connman-1.33 | NOK | http://autobuild.buildroot.net/results/5f825f077d815a5722317f26877e43956de8b49a/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/85cf7d66dc55ef8a2da43c676d808c34b5bf7c98/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/670a1b7e5e6efded9352f468fd323c0d34951180/
        bfin |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/ecd2dd4f391a84309508b151688009933811c376/
        m68k |                   ffmpeg-2.8.7 | NOK | http://autobuild.buildroot.net/results/e591d151b6a44ecbe178fba627b4dcbb91e05b79/
         arm |                    fwup-v0.8.0 | NOK | http://autobuild.buildroot.net/results/9a868f64e24f0bd5f85c10368e211a62501dcd62/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/f6bd60923f0979d9504862aa791497bb1f2f86c7/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/383fc0650eeaa6807f87adc339afb37a24443aa7/
         arc |                      gmp-6.1.1 | NOK | http://autobuild.buildroot.net/results/e7e1ffef561ee3057a99311f1f6b242a8c5a3816/
         arm |            igd2-for-linux-v1.1 | NOK | http://autobuild.buildroot.net/results/d045cee6338875f0c70276e9c1caa5475c059107/
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/c8297b367287d2ec69a96e9989f30cff57e9325d/
        i586 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/03d243f78440051e2fa462b9d0bbc7d6c349973d/
         arm |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/3bc69d8109ce57c45d9e7385f348bb50a1ea7dbb/
      x86_64 |       kismet-Kismet-2014-02-R1 | NOK | http://autobuild.buildroot.net/results/13a04da5af0d6ff306cd20a58113cc251a3c1609/
         arm | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/5e9963c1f11af40a6349da524fc128116a1d9e6e/
         arm |                  liburcu-0.8.7 | NOK | http://autobuild.buildroot.net/results/5dd28b7d27cf4f516be0000291e4d247536d7097/
         arm |              libxmlrpc-1.25.30 | NOK | http://autobuild.buildroot.net/results/3dda23059410866221a24025d90b25e8aba828e3/
        bfin |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/be50a8090f6f740410f5dc060fcd1dda50568d1b/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/b8f4e305066e88b0946ae36c4bfa5fdc9a4b4ee5/
        sh4a |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/d672e287b7cbba7d9935d60d8a0e819656a36d6c/
        i686 |               lirc-tools-0.9.4 | NOK | http://autobuild.buildroot.net/results/baa06208e98bc31c5d4fb612b49c475d2b553389/
         arm |                    lldpd-0.9.4 | NOK | http://autobuild.buildroot.net/results/bf6587c7125a8aff90c726b7f6d7e59ce071c73c/
      x86_64 |                  lvm2-2.02.162 | NOK | http://autobuild.buildroot.net/results/015bc60df8d7bbe721d63f35c5c95c255fa9d2dd/
      xtensa | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/77b2ee52d7a2167df9d7cd88d691048c1cb19584/
         arm | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/070a9f8d663adb8fdd7e0050c244cfd962963a18/
     sparc64 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/c55e12a6b48545e7826d6bd6e39020ff777aef17/
         arc |                  mesa3d-12.0.1 | NOK | http://autobuild.buildroot.net/results/a092a4c1ba5507bcfa81335077ab8c8cf97185b0/
        i586 |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/d164f008ed3c65c5699993d7e460a6b5b4c9bd09/
         arm |                  mono-4.4.2.11 | NOK | http://autobuild.buildroot.net/results/09bff0fea4499dd115b28fe06408b1b243252c72/
       sparc |                mosquitto-1.4.9 | NOK | http://autobuild.buildroot.net/results/70caa2e1d3e27109ec7a21689909386ea87038e9/
        bfin |                      mtd-1.5.2 | NOK | http://autobuild.buildroot.net/results/dc6cfd46ac18be09d63023979ae05b16ea1b4db0/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ea9cad2ea217e0652ad3d71d228028602161a8f5/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/ab29f4ef4729f9d0f095807cbb251fd4d5cc99b8/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/3c55c1f93480afc20545f40d2fdbbe83b0308efc/
         arm | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/df1cadb423addeb58fca7596d5d40414519e45c4/
        m68k |                      pcre-8.39 | NOK | http://autobuild.buildroot.net/results/36e1bbb1dfd25142cdb4c04cb1d43d88b184b513/
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/c6744ebee84af25787b5a4f1762ef75e48ce21f9/
        i686 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/379ad4eadf5af7e1d5b977bc229d3fcaba25b4fe/
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/963d7fc6b6bee38367d3fbdcde5bb2ca3663401a/
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/8afb540945f74ae3ea7dae5b1f95756b81cc6b59/
         arm |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/e9f17bb6e048c3dd3c65fc588dc5244fbbbba6fb/
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/37fba405d9a0e2876542f05d48bdda1da896b795/
         arm |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/f6481145636bdb2ba269816a06c459d807280cdb/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/d77454265c45539178c008c5d92509c441447675/
        i586 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/346c5b562c244ddb039db2f86f71d670a01ed9ce/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/7c3ba5b9b6b3e853808049cf04b37a062b6e6547/
         arm |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/6b0f0ff8cacb7dbd380feba04cb5c0110ff78c2a/
         arm |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/1284a36c70ff8a1412e2128266c6654b2aa5b2da/
         arc |                   stella-4.7.2 | NOK | http://autobuild.buildroot.net/results/7a73ed7dfc0dfff4413b2c6b79b56af3520a1d74/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/26c093fe5d00864abe5a8de664a57d31f60f5016/
        bfin |                tinycbor-v0.3.1 | NOK | http://autobuild.buildroot.net/results/c1def7e3fa1108b872a890c987a304bab4bc5a15/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/2b9d37372c22f21571c714bbe0f2dd8957517d19/
microblazeel |       trace-cmd-trace-cmd-v2.6 | NOK | http://autobuild.buildroot.net/results/b954a7a2253bebdcc45a5df60987ee6d80081b30/
      x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/ee013136f846a065b61ff7ccfa1b3f81a94bac7b/
         arm |                 upmpdcli-1.1.3 | NOK | http://autobuild.buildroot.net/results/2c10717a54812a5066a1647e686389b8ea810d98/
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/cb2e02bf1e93cca93a9a958d8387a4dea96c19a1/
        i586 |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/7edb7f03b92d154512a45d9059adcd72b01b8c1b/
      mipsel |                  weston-1.11.0 | NOK | http://autobuild.buildroot.net/results/5fbfd26d05a0ccaf4a70a100a7499cedea83ce6f/
         arm |                wireshark-2.0.5 | NOK | http://autobuild.buildroot.net/results/ffc921135c16c7017cd7a23c5e0c445757509abc/
     aarch64 |                      xen-4.6.0 | NOK | http://autobuild.buildroot.net/results/386908433a088ffcb34a9a9b0c5734a36a7a98e8/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/ba7f3a3fee917f161d667140c6a26e6714d7f801/
    mips64el | zbar-854a5d97059e395807091a... | TIM | http://autobuild.buildroot.net/results/ba15099653c6208e782cd6b42ea313b90df8620f/


-- 
http://autobuild.buildroot.net
