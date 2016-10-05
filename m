From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Oct 2016 08:30:26 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-04
Message-ID: <20161005063026.C70D3102AD3@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-04
================================

      successes : 157
       failures : 111
       timeouts : 3  
          TOTAL : 271

Classification of failures by reason
====================================

                upmpdcli-1.2.2 | 16
               wvstreams-4.6.1 | 11
               libglib2-2.50.0 | 8 
                alsa-lib-1.1.2 | 6 
               linux-pam-1.2.1 | 5 
                     vlc-2.2.4 | 4 
         docker-engine-v1.12.0 | 3 
filemq-e59951489045825d6fc5... | 3 
                      qt-4.8.7 | 3 
                 uclibc-1.0.18 | 3 
               wireshark-2.2.0 | 3 
             ctorrent-dnh3.3.2 | 2 
                   glog-v0.3.4 | 2 
       host-erlang-rebar-2.6.4 | 2 
                libsigc-2.10.0 | 2 
                 lvm2-2.02.166 | 2 
                    ola-0.10.2 | 2 
               tcpreplay-4.1.1 | 2 
                  trinity-v1.6 | 2 
                     xen-4.7.0 | 2 
               audiofile-0.3.6 | 1 
             berkeleydb-5.3.28 | 1 
               bootutils-1.0.0 | 1 
                  cc-tool-0.26 | 1 
             freeswitch-1.6.11 | 1 
                gptfdisk-1.0.0 | 1 
                 jack2-v1.9.10 | 1 
                   jamvm-2.0.0 | 1 
kvm-unit-tests-0b04ed061003... | 1 
                  libcdio-0.93 | 1 
libcec-2c675dac48387c48c7f4... | 1 
                 libdrm-2.4.71 | 1 
               libepoxy-v1.3.1 | 1 
          libmicrohttpd-0.9.50 | 1 
           libvncserver-0.9.10 | 1 
                  libvpx-1.6.0 | 1 
            live555-2016.03.16 | 1 
                     lzip-1.15 | 1 
make[1]: *** [libavfilter/a... | 1 
                    mpfr-3.1.5 | 1 
                 mplayer-1.3.0 | 1 
                 opencv3-3.1.0 | 1 
                 orbit-2.2.3-1 | 1 
                   patch-2.7.5 | 1 
                    pppd-2.4.7 | 1 
               qt5base-5.6.1-1 | 1 
qt5webkit-b889f460280ad98c8... | 1 
                rsyslog-8.19.0 | 1 
                   sudo-1.8.15 | 1 
                    tiff-4.0.6 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/a13c30ef2567f0f1600199d80d3cb7befbd2f5e0
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/c90c7fd99e2d14168190188d50d3b6f28bdb4016
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/ac7284dd31939b7dda93982c41768404b67c31b9
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/082bedbca7c5aa26057b5b0a9a93179ca351f24c
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/70689ed5c704cc70ec251d4248a73c448f2a4b0e
       nios2 |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/56dccb5b474aa9770facef2b751fd0b544a413f9
         arm |                audiofile-0.3.6 | NOK | http://autobuild.buildroot.net/results/ddff4caeff3342b71f2bf451f3860eb93a543577
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/09153051b69b383b3d47e0623909f87c3cf76b02
      xtensa |                bootutils-1.0.0 | NOK | http://autobuild.buildroot.net/results/502a10a576b17d4b2f1a20939a7bc6c540b137b0
         arm |                   cc-tool-0.26 | NOK | http://autobuild.buildroot.net/results/fa5b849a85a4ec001f490ee2f38feed8bb8b65f5
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/71bb35b98ccea6394dc5da3ebe4b302c689d7c2e
         arm |              ctorrent-dnh3.3.2 | NOK | http://autobuild.buildroot.net/results/16dc338ebe2e7edd331cf45499931fefc7eeb75c
     aarch64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/8c61c62588e8beb96d529fb3d1e1f024f48ef9a1
      x86_64 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/26928cbaa51793583d8506f2608306b8b6db1192
        i586 |          docker-engine-v1.12.0 | NOK | http://autobuild.buildroot.net/results/90f48e59bdd70216c38cdb418e4e64d47100630e
        mips | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/cf3ec0f40a419725cd4b5ea5b73d0b74fddf0ae1
    mips64el | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/739624a7968854146dcfc1ce59c9b7c78a65e397
     powerpc | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/6cc86ddfbf63c3c59f0399d20fb3d29a549f9e3a
       nios2 |              freeswitch-1.6.11 | NOK | http://autobuild.buildroot.net/results/9b186a0843a43e61f27b7b2e1548f4c5446f8b75
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c41a7e2dbd03f9ac0017692c2fff2f86b5a1a599
        bfin |                    glog-v0.3.4 | NOK | http://autobuild.buildroot.net/results/c7eaf6f05e5b66032fcc822ceec935295b651997
        m68k |                 gptfdisk-1.0.0 | NOK | http://autobuild.buildroot.net/results/aee05c4fe796b2f5e1ae0b850c9b753aa48f86b3
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/5fc2d205c0cfcb409eb732cca24511381cee317c
     powerpc |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/ed3f857f0b2e02eca57cc88451b5c85b8ed8fd8b
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/138b5fad4494af427d506e0730ad417eafe407d7
      x86_64 |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/eafca7da030a8f04457584d16565a055db47357b
      x86_64 | kvm-unit-tests-0b04ed061003... | NOK | http://autobuild.buildroot.net/results/ac553282ff3646bc97967f6f42c5a3943c80031a
         arc |                   libcdio-0.93 | NOK | http://autobuild.buildroot.net/results/09c2a00e66fa190d98192a7a9f685d5191fdac67
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/7d9a92165d94f4df3200a9ff6c38e01d7d92f4fa
        i686 |                  libdrm-2.4.71 | NOK | http://autobuild.buildroot.net/results/9f2f6b3d44b7be501c322af2bbd921bbc4fb3968
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/2b0b328b0622f33ca2a54aefcd3c241fc38f2e23
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c9c2a490d4fec5af6384e5ecd1bd36a33f54347b
microblazeel |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b19b3f9d72b872e3f965234bd9b8a9765cc80401
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/953af28952018bf058c8f48d596ce844f9b116df
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/547bb962c788ed91e0179d8b8be7cb62ea4ab609
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/83842718af307d29890bf36f4f17cd8f391bc874
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/771e110fef4b2b24d7c6d39cf749abfa5b42b61d
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5eb5df8b7c196558c28165280e4ffcdfa3c049b4
         arm |                libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1f6b203d1a9cac41d9e3addf1e4b62a96b61f801
microblazeel |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/14f63fec026b0232dac6166a1316b2731d846164
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/d468c72238f606f8381b2c43d27c3e1241a9ffde
        i686 |                 libsigc-2.10.0 | NOK | http://autobuild.buildroot.net/results/247d14f4a06625337f836a6ffe93cfd32bb8568b
         arc |            libvncserver-0.9.10 | NOK | http://autobuild.buildroot.net/results/730fb272e894b985289163328777cc976e21bef4
        bfin |                   libvpx-1.6.0 | NOK | http://autobuild.buildroot.net/results/01939b537f2fae0054391faf9309c168ed77deed
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/8bdbaaee22f40292f1bfd100e168ae8e11b4ee5d
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/11c3deef7478fc9614ffcebb5b627b7ab60626c8
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/45fe1568d11fbded80cc30216d528f30c7d9b50a
         arm |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/82db44158fda499db1302206fb59ac89d74a8375
         arc |                linux-pam-1.2.1 | NOK | http://autobuild.buildroot.net/results/df39b029e5a1cec4a3f98c983afe2210e5bdc964
         arm |             live555-2016.03.16 | NOK | http://autobuild.buildroot.net/results/a802fbd5008f948b3d7e8dd3f3770662981d4646
         arm |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/6d3382a202dcd888bfcf2d8ecbdd8b7e58e35901
      x86_64 |                  lvm2-2.02.166 | NOK | http://autobuild.buildroot.net/results/8caeb2afc7b78c7ad4a17513ca09e2409f27aa8f
        m68k |                      lzip-1.15 | NOK | http://autobuild.buildroot.net/results/ef6dbb94ea091b74c5f334189837dc760c912f33
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/8fe50a19b8de940c8adcb96994f717dacf70854a
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/df69465e625dd9b96ae560c68833df9ec04bd982
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/32b4800be3a74fbf209ece8854d6eee716beb1c4
         arm |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/82e59d3c180967a988c82aa750fec1628451547e
     powerpc |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/bc4a83ee78036e1c3d065903553bfdbef691e0d1
      xtensa |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/424be5cc20b503bf1284d226419468d1ed67060a
      x86_64 |                  orbit-2.2.3-1 | NOK | http://autobuild.buildroot.net/results/ea43b8f3dbc7582ca71d85817b3a27ca6218d4aa
         arc |                    patch-2.7.5 | NOK | http://autobuild.buildroot.net/results/a792139d0abc5331b93c14094bd0fc05d06fc0b0
      xtensa |                     pppd-2.4.7 | NOK | http://autobuild.buildroot.net/results/3e9c6bfc0a691fb9ffa62b748900d984572a1f0a
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/861ccc607f75794f8628ca1d465c217b5515c289
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0cbd71323d872ce3e367232a215de56e55904846
         arc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/b0fc88f7b6842845b5e4a53ccbd3befe44814e81
         arm |                qt5base-5.6.1-1 | NOK | http://autobuild.buildroot.net/results/07de04b7828fe02a883e10dd38a4f99055ca00b4
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/babb19a6eefd8419edc1a9cfc4f9920cdfc6b85d
      x86_64 |                 rsyslog-8.19.0 | NOK | http://autobuild.buildroot.net/results/bf6c4af4ac6026a2312b047874139bae80404907
        i586 |                    sudo-1.8.15 | NOK | http://autobuild.buildroot.net/results/d6653cdf9f87fc507fd961b96d2748e11f635eea
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/21a45d8a6970a195265cf8356390b3f00a5761a6
        i586 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/3b9528428e1bdd970b6f811bff14ca82966336f9
       nios2 |                     tiff-4.0.6 | NOK | http://autobuild.buildroot.net/results/9d49bcec1b38b055ed6f21eddcc20fbf1c19a11a
        i586 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/0145e85327e424e3c29499ec9db61cbcaee7610f
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/e73cedd71981b49620f5cb25bbce26cc0256d1d9
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/f7721d71192ce43da591c4108d44021a80b6e527
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/249ae30ff5f80bc1b38996afb4cda43c202ff977
     powerpc |                  uclibc-1.0.18 | NOK | http://autobuild.buildroot.net/results/ff9dd19fe24abb6c4ad516a481903defad5d3e70
     aarch64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c88961b45e1f1392b4ffa6afd6fae638efd93059
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/666489b757634126054c2a94a1d10f01dc95db2c
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/c3e82a0d55f2ea328014f53a2ee111e44172dda8
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/171b4420d655987a39a26e242cebdbfe3dc90e83
    mips64el |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/81bf5d32547690962ba233299b807b64fc61ec5d
      x86_64 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5985f185795db84acb3f3b0c8ba28ec3edeaee9b
       nios2 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/492a5c306118ce1d48529c5f500013001842bc82
       sparc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/62d900accfad780e9a3ae133a0a05957d439868e
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/3a9c1abfea9ca10d9bb4dcd5c5840dfe30fe9745
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/da2f2ee06fddf79b4e814f7ab903e3e53e4e5bc5
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/8915d8d78424f087223b379524d0d519a75676a6
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/92a9828ebd49e16bf3aa900f89339b29d0c07e90
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/5747b4382144d076e0203d6e430c8ec74c22670d
     powerpc |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/4cdac8685b0954a9ecd988f5f38b704d4342685b
         arm |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/9f04e8701c6f4d9724b659f58bcd97ee50b67be2
        i686 |                 upmpdcli-1.2.2 | NOK | http://autobuild.buildroot.net/results/cdb27cf691fbc7805c8fef4c4a4d7ba6706fe64f
      mipsel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/52f71ee7c95349bf6bb23542819ce7ee8580a97a
        m68k |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/f6d472af497cab25b0541aed109d4dd59865785c
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d19ec507404895ba43c6c976e1c9a1434ede0498
         arm |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/b5f23ab299f1c9d8374973f86daae5dc48cebceb
     aarch64 |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/64f18511cda6485944d72a648f394bd0265c647e
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/e7fb5af6007ed49adf88e95f1add7ab344ace5c3
         arm |                wireshark-2.2.0 | NOK | http://autobuild.buildroot.net/results/e9d8606c3ee9de48e7d45de277b5259b5176b991
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/12c9604e569f48ccb14e36f2021b26f7fd51ae8a
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/37c69a7387c885581798e20ca6299c8910552474
     powerpc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/018b10d4dd05247f8eac1af9485cf5ede2d94f0d
       sparc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/5dc1bf51cc5143d2c24758ea6159d5fca2e9b511
         arc |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/3c4878c7edfb924a70faf71a7ad735cea4c29e88
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/af2f5e8ae45a0b97ee21619db7962a09304ce43f
         sh4 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6a1b41d163b169c70a8376ce6b5c5224732a8a90
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/596acb9ade6b1d37757f590f150bd6b02efb535e
        i686 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/2689ebd5c3f375de32d0d9bf6c4290e13a3b977f
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/eb9350a4f15db23df763621c4d3f2a5cae73c949
      x86_64 |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/ef3a06fdeea145ae729e4c11504f28c12b45f516
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/a09b4f6348f88a73359f70ef2e4378a8d250e344
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/b8253a400aa8af944ebb40aaa66eece8e5b0bc00
    mips64el | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/500c3498a4a8a2453d0243d58b52b62c5e8d46fa

-- 
http://autobuild.buildroot.net
