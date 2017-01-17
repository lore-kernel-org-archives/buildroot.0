From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jan 2017 08:29:35 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-16
Message-ID: <20170117072935.23FAB20BB2@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-16
================================

      successes : 156
       failures : 67 
       timeouts : 0  
          TOTAL : 223

Classification of failures by reason
====================================

                     tslib-1.3 | 12
               sdl2_ttf-2.0.14 | 10
                    ruby-2.4.0 | 5 
             berkeleydb-5.3.28 | 2 
                    cups-2.1.4 | 2 
                 jasper-2.0.10 | 2 
                  lcdapi-v0.10 | 2 
                 libnss-3.27.2 | 2 
            lttng-libust-2.9.0 | 2 
        riemann-c-client-1.9.1 | 2 
                  boost-1.61.0 | 1 
                  cppcms-1.0.5 | 1 
         docker-engine-v1.12.5 | 1 
                  fbterm-1.7.0 | 1 
           host-nodejs-0.10.48 | 1 
             host-nodejs-6.9.4 | 1 
                       kmod-23 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                  libsvg-0.1.4 | 1 
             lttng-tools-2.9.3 | 1 
              mosquitto-1.4.10 | 1 
                      mpd-0.20 | 1 
                    mpd-0.20.2 | 1 
                 openssh-7.4p1 | 1 
               openswan-2.6.46 | 1 
           oracle-mysql-5.1.73 | 1 
                   perl-5.24.0 | 1 
python-libconfig-b271c3d9da... | 1 
             qt5location-5.6.2 | 1 
               qt5webkit-5.6.2 | 1 
                     qwt-6.1.3 | 1 
             rabbitmq-c-v0.8.0 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 
                xfsprogs-4.8.0 | 1 


Detail of failures
===================

        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/8e22bc893b971ef3f3aa577fc0abec93417c9119
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/01f37975348ee89d823e561c6045a593b8b41968
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/cc7a5870bbce8f3b2ae20a197b8e8a257132af06
        i686 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/cfcbf252588b5fff7af3510d1a1eea2e14138ddc
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/35e24fdedc2d38a524bea34d796c25eeb0ad234b
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/effd3884e515871ee6fa09059357a067edb3a40d
         arm |          docker-engine-v1.12.5 | NOK | http://autobuild.buildroot.net/results/a9de55aad0aa1ad6abb3072068840b531147bd26
     powerpc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/c89c303ff4a1bcf2780f11d5878a2aea93f20624
         arm |            host-nodejs-0.10.48 | NOK | http://autobuild.buildroot.net/results/2bee603ee0c43599b237f8a216571b94760803df
      x86_64 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/1d6bbef2cb0c8c2e00b6d7511814ff9ddb2e3073
        m68k |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/975c4db1c8644569125167e900a87aa85e405dd1
      x86_64 |                  jasper-2.0.10 | NOK | http://autobuild.buildroot.net/results/4f4a9c6464963dd1c633a542f6cf933c96f35c03
microblazeel |                        kmod-23 | NOK | http://autobuild.buildroot.net/results/21db8ce908f10da6b33dc614b0fd0183cfade599
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/809f23c15449c5312d827ff1bb39f647bb7d9d81
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/bbbc91faea4d5b7e5b897b97624c98e6437789c8
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/b792e15f2afc369d1d4e55754de2cd17f45d7806
        m68k |                   lcdapi-v0.10 | NOK | http://autobuild.buildroot.net/results/a54c77de1f6139c2b99c9e46ab64f2767d17062f
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/8608954b2d7974964b813509a626030cedefd37e
microblazeel |                  libnss-3.27.2 | NOK | http://autobuild.buildroot.net/results/93b02d444a4d4fcb0d2653b90424880399cb05d5
 powerpc64le |                   libsvg-0.1.4 | NOK | http://autobuild.buildroot.net/results/83b139e800eb5e49fd192463a40060821b0d55db
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/ed50dcdf6b69e50a82fbc13172660b5e8f3b0c3d
      x86_64 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/68292d1d8fa51c8d7ed9ad8f54146eb1d61986b1
         arm |              lttng-tools-2.9.3 | NOK | http://autobuild.buildroot.net/results/70b7bd428fdc3158e2ae717469b2a63348b22345
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/445f377ae70397b5f675f541977900e8986b79a4
       nios2 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4202b489de85a59b8edea32e9ae77f77ed02a3e1
         arm |                     mpd-0.20.2 | NOK | http://autobuild.buildroot.net/results/25a7bb3d6e884a20ba9199e1f1af50c6f0f5a5ba
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/1d8cdf05c7e4186ad331411d84e69edb6b8b63b2
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/de2465d7cfe8832b59f0fb745e00b89ffa6f9f65
       nios2 |            oracle-mysql-5.1.73 | NOK | http://autobuild.buildroot.net/results/36ea8587b94bc530b1cd341063b44aa2148d0fa7
         arm |                    perl-5.24.0 | NOK | http://autobuild.buildroot.net/results/d1f133ca3693b6653eed4fc513effc0bbdcfd9c9
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/20641b1f499153a31cad7ea26593048f8c1d76ed
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/490ef2c4187684bf78f4f9c8cd1b4cea2639c5c4
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/59df12a46f78660882f1f3562111770d6729b202
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/49e39456113b78f6cf7b7c7a21e3e5d1565f0326
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/822e2ab5cc8af26233a696a61a8b8cabb00073f4
         sh4 |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/d26a4013a09e65d5ad3e4dcb1e6ed620a8c3252f
     powerpc |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/84bc5d90f4ea6e82d86261b2e4c389d91ce398cc
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/d8e2084d8767330c57a379a15b43f80e1b36ed6b
         arm |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/3a091a9a8c2ff283b77db9360b11f8cc09e37f40
         arc |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/a05d4cb5669de5dfc05a25f697862358b9ee568c
        m68k |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/5b53b72f07566154910cb4bc640c43ad247bb461
    mips64el |                     ruby-2.4.0 | NOK | http://autobuild.buildroot.net/results/2514183d7c5221c9c5dd9944909d96a6cc4c7e79
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/5221c6501a641924e5c62789f03b579620d941e0
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/73c8d1a8b1f42d650aa5f535b6b9632d4fe8490e
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/842c787e2ea27938048d3e97f88a468c2dab39eb
        i686 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/34fc5518ae6a824199524004d7f5b472cbce9567
        mips |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/80b7dfbcb2e337ac857740c853e0d7b684595d3a
        m68k |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/98adc5e74df8b05a4de8a7f3a70b90da06a05246
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/d9f1fe2c2d06296707faa50fa0d31708e7d65738
         arc |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ee82a817c6b4b623514848e0e3dddb894e82b4a3
     sparc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/e839c33fb7867b1b5dbe514c39e9f03699639ade
        bfin |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/baaf6c82e7b1d961c4ce01b53910da33e411cec8
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/4fb1b220232fe3ab9cdfc3a481155719fe316cf3
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/f10dbe7c2b792463e1b0c4237e41ee1ca926750a
microblazeel |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/1dbdcedb42e703f536db7ca5762b1011648fbfcf
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/f1a5033631a3e93ad6973aca18299f336f672a96
microblazeel |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/059f03d968375295791c5a27b19ced735abb02a7
        i686 |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/e4266e17664240e4fa90ffa7ace7f8b454e7c7a4
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/df18018dd9c3506f1c0f463852b017761f42bd6a
         arm |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/63a1ddf3be5feef261a0d964158523e24e9713b7
      xtensa |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/af668bfc70c94ab0a151f5c6eb130ab88b7c2e1d
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/1712120ac402d3f75a08e929f3eae2b50c307ad7
    mips64el |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/f2e4d5d20b98a1dac906ff39469c2aafe7cd8ff8
         arc |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/b3a5ebaa7d39ecf92542ebed9f7546154ee20e19
        sh4a |                      tslib-1.3 | NOK | http://autobuild.buildroot.net/results/fdd1cc228f4d3db8187f662515d8b9967461327b
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/03ff83d7982506442b0b48b5e5bfa6e44b25962c
         arm |                 xfsprogs-4.8.0 | NOK | http://autobuild.buildroot.net/results/33295a58e193e8d25ef237865b2e2aba7574fddf

-- 
http://autobuild.buildroot.net
