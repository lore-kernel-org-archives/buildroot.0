From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Oct 2015 08:30:16 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2015-10-27
Message-ID: <20151028073017.9F44210272E@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2015-10-27
===============================

        success : 146
       failures : 81 
       timeouts : 0  
          TOTAL : 227

Classification of failures by reason
====================================

                   mplayer-1.2 | 8 
                 sudo-1.8.14p3 | 6 
               lighttpd-1.4.37 | 4 
              swupdate-2015.07 | 3 
                directfb-1.7.7 | 3 
                busybox-1.24.0 | 3 
liquid-dsp-df5a459fa05dba41... | 3 
                    ruby-2.2.3 | 3 
             python-spidev-3.0 | 3 
                  mono-4.0.2.5 | 2 
                  ffmpeg-2.8.1 | 2 
                pulseaudio-7.0 | 2 
         conntrack-tools-1.4.3 | 2 
                  c-icap-0.3.5 | 2 
             lttng-tools-2.6.0 | 2 
                 mpg123-1.22.4 | 2 
       kompexsqlite-v1.10.12-1 | 2 
                  vsftpd-3.0.3 | 1 
                     rpm-5.2.0 | 1 
                pinentry-0.9.4 | 1 
                    sdl-1.2.15 | 1 
              host-perl-5.22.0 | 1 
                mongrel2-1.9.2 | 1 
                 iperf3-3.0.10 | 1 
                  libv4l-1.8.0 | 1 
                moarvm-2015.05 | 1 
             host-nodejs-4.1.2 | 1 
                  monkey-1.5.6 | 1 
            gst-ffmpeg-0.10.13 | 1 
             ipsec-tools-0.8.2 | 1 
                ipmiutil-2.9.5 | 1 
rpi-userland-b864a841e5a459... | 1 
libbroadvoice-f65b0f50c8c76... | 1 
                  qemu-2.4.0.1 | 1 
           host-openssl-1.0.2d | 1 
freerdp-17834af7bb378f85a3b... | 1 
                     lsof-4.89 | 1 
              strongswan-5.3.3 | 1 
             irda-utils-0.9.18 | 1 
                openssl-1.0.2d | 1 
                  boost-1.58.0 | 1 
                      qt-4.8.7 | 1 
                  guile-2.0.11 | 1 
            mesa3d-demos-8.2.0 | 1 
                  libssh-0.7.2 | 1 
                  ltris-1.0.19 | 1 

Detail of failures
===================

     sparc64 |                   boost-1.58.0 | NOK | http://autobuild.buildroot.net/results/2259345f1b0a7c1eea2b29bd88d38b8eaabba79c/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/dad42d955f83215d6f3c4cdb3bb241843868f6f7/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/68aff19aaab17097fc0cab5b99db99ebdd610786/
       sparc |                 busybox-1.24.0 | NOK | http://autobuild.buildroot.net/results/dc8fb19d102ba1eb7390b77cf082cf0bcaff6351/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/d1966ca3cb38c73a6fd4e20780d90615639deb23/
      x86_64 |                   c-icap-0.3.5 | NOK | http://autobuild.buildroot.net/results/1b86a9664e0660c18b68a523d6974429a2328c81/
         arm |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/4823752be13680f6d3fa8bbb2a2ca5bc9acc774d/
      x86_64 |          conntrack-tools-1.4.3 | NOK | http://autobuild.buildroot.net/results/0bcef18bbfca8507a428e7dfa3ec970188da4e85/
         arm |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/2a3d714ab694bb49c8882fa51541b02c1a1216b9/
       sparc |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/82b98ac365a2f8701e6c155c6b4f80d669682993/
        i686 |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c3af0ec6494df11cc302fd6c70ad936393dc2b9b/
        mips |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/262b6340081271db09b5eb03ae2df64b9824bea8/
      x86_64 |                   ffmpeg-2.8.1 | NOK | http://autobuild.buildroot.net/results/22fb33107615442f2d51840e3ea7ea7eae47c915/
    mips64el | freerdp-17834af7bb378f85a3b... | NOK | http://autobuild.buildroot.net/results/7f1f96dd71fa437c3d2b2c7a44f5322d0af44c28/
         sh4 |             gst-ffmpeg-0.10.13 | NOK | http://autobuild.buildroot.net/results/adb3b014330da537f9dc07bbb8173317c6299f07/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/38137ccf29023f38c540483a6655c4b8d6778abd/
        i686 |              host-nodejs-4.1.2 | NOK | http://autobuild.buildroot.net/results/1e2c4ed3d3b193b865bc1b3894b2f45e9b55c858/
     powerpc |            host-openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/dc1a97bb0c60a769cc6295cdfa008e51a8b787f0/
     powerpc |               host-perl-5.22.0 | NOK | http://autobuild.buildroot.net/results/c8e6bbe50ca71835bdde9503a9fe23ace8236a09/
         arm |                  iperf3-3.0.10 | NOK | http://autobuild.buildroot.net/results/34f91d11db6359ee1760e7594b4db559f68b4f83/
        i686 |                 ipmiutil-2.9.5 | NOK | http://autobuild.buildroot.net/results/878de031cf18c888c22ced83327d2cec1dc0a2a6/
         arm |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/71962d57db555c26a40fd544b1331836840279ea/
      x86_64 |              irda-utils-0.9.18 | NOK | http://autobuild.buildroot.net/results/0b0373ac87db229e4fb0ce022abf224f50b838ff/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/56fe240134f6fc4342fca9371d74a83b3a2ed62e/
     powerpc |        kompexsqlite-v1.10.12-1 | NOK | http://autobuild.buildroot.net/results/620bf4f238ef0bef6a4d8ae12585c95cf51d8cfe/
         arc | libbroadvoice-f65b0f50c8c76... | NOK | http://autobuild.buildroot.net/results/0a5717a239f05c2c360de605c650569cdae1be53/
      x86_64 |                   libssh-0.7.2 | NOK | http://autobuild.buildroot.net/results/9b511259ea0cdd1cbda30cdd0d9f608c47615507/
         arc |                   libv4l-1.8.0 | NOK | http://autobuild.buildroot.net/results/22f834585be84decc9af528f79ecd81addd809fe/
         arm |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/0812a59fa756977e517f8cb79457c5c23c282845/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/d5bc44ec4bc79bcae5f07c5b509029afdc21fc94/
         arm |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/f7f68b5956938e54811285db4979d253e32cd736/
      xtensa |                lighttpd-1.4.37 | NOK | http://autobuild.buildroot.net/results/b261e4d84ceffeacbf2b503117ee78b30144b2cc/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/d1f1875f0dd6d6a2f1c128125b6cdf4a72d227fa/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/31fb1bbb1ac48a0cb6bab5b7323e7edee3a16b3d/
     powerpc | liquid-dsp-df5a459fa05dba41... | NOK | http://autobuild.buildroot.net/results/982a75ae262d6db8af4b45513ccb66f5206eb0ce/
     powerpc |                      lsof-4.89 | NOK | http://autobuild.buildroot.net/results/fc6bc83f3e4fe757f73e2bc2cc9b7640ae0f064e/
         arm |                   ltris-1.0.19 | NOK | http://autobuild.buildroot.net/results/d54b3d9b33af68b203ebb66b09dc9686e80fa9a7/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/b351fb17222806e00f9df72a6179d1516625e126/
         arm |              lttng-tools-2.6.0 | NOK | http://autobuild.buildroot.net/results/d0b81ebea51f2ab281e6c56acb6688491f87dbd5/
     powerpc |             mesa3d-demos-8.2.0 | NOK | http://autobuild.buildroot.net/results/8b1b3b2744ce1d4f1bdfde7eb54e0d9d123b98d9/
     powerpc |                 moarvm-2015.05 | NOK | http://autobuild.buildroot.net/results/8d2c54a4e4a424c86c4335675f5e7c3b8360f169/
         arm |                 mongrel2-1.9.2 | NOK | http://autobuild.buildroot.net/results/c1bffa6259815429668b6610cea3ad41f0841680/
         arm |                   monkey-1.5.6 | NOK | http://autobuild.buildroot.net/results/f690cb1efece8a47fccdf3e782bbde4d1b2cd6b3/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/a7ad47b84d53a42053e49699e565ed85cb534248/
         arm |                   mono-4.0.2.5 | NOK | http://autobuild.buildroot.net/results/be694819eb35aee8cf273f0135a6cbd6a551b584/
         arc |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/8aebff7995e4090f9fdb0dbf77330733a882dea6/
         arm |                  mpg123-1.22.4 | NOK | http://autobuild.buildroot.net/results/c9304aac18487f1f006f28cb16b52a7f293088f9/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8899aea11fc1185cb8077fbac361cad65cb9e4e1/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/615e651038e1f73f17b5f274d89e11fc9d29278b/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5bbed30f03149067f64bba4be6b086215ff696b5/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/8fa0df0c7b80b319591db7017a849bc26bb8007d/
         arm |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c2bf9eef65c562eb39ff37587c1e4b5062e594e9/
     powerpc |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/a4c10e39c498bd2fcee3d3dd0d6bbf33fb63f445/
    mips64el |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/5f072e3bb7bee80fe3d0e420b25ed2db8a9284b5/
      x86_64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/c1134ffb0bef7a440dfb94fba3cfc8a202c0d923/
     powerpc |                 openssl-1.0.2d | NOK | http://autobuild.buildroot.net/results/3a20f8c42a96eb80351553e9e81dbb2c10e04545/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/186c11be986607bba03c0f865895338b0a6db5f6/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/11bf4ad858cea7695d6345ff8030e5abc023cbdf/
     powerpc |                 pulseaudio-7.0 | NOK | http://autobuild.buildroot.net/results/4d246bd8d7bb5ccf9ae85dcec86311a312b88ba0/
     aarch64 |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/5db75a6f19139a748aa19773960c8ed082f477c8/
      xtensa |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/63a2c1124ed7a071ff0fe0d3d9a65bfcfa52d771/
         arc |              python-spidev-3.0 | NOK | http://autobuild.buildroot.net/results/f4382dbd7d7c60810326a4d8c63043506510dca8/
        i686 |                   qemu-2.4.0.1 | NOK | http://autobuild.buildroot.net/results/7c12a2e0a67e370de21eb849e5181968fc8d8f6a/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/7eac07210668607d7437b345e9f9a402efbd6fd6/
         arm | rpi-userland-b864a841e5a459... | NOK | http://autobuild.buildroot.net/results/3475c7a806f82cdb1d226b77a2f0fc215836c80d/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/ff7ccb06f1cf856124ca189bab0def8b42a0f1be/
     powerpc |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/882b8c35cbb01734d0b5b673a01a9face8fb0bec/
      mipsel |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/4868b5c79df20ff5e03b319fb138baf9b1fa3321/
         arm |                     ruby-2.2.3 | NOK | http://autobuild.buildroot.net/results/4ae024e944c429868f23d1ae5be98cc64d570782/
         arm |                     sdl-1.2.15 | NOK | http://autobuild.buildroot.net/results/c09e13a2aa55b636e48dc92fc2e85781dec92a36/
    mips64el |               strongswan-5.3.3 | NOK | http://autobuild.buildroot.net/results/5082f2da64c7222827f0b93288d4d268b080efe8/
         sh4 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/174b961a9b042adb164a917f9fe3e4792083dead/
     powerpc |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a6e2dffa1402abe4d632298b50612d65e4f48d07/
      x86_64 |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/db493c413eae3d9d832471a767ee75986be7acf3/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/950750d5da5340d5caaeaace33951c9bc2d27fd4/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/8ea858ce978f26082a8a9d0cc01cd65bb80cc981/
         arm |                  sudo-1.8.14p3 | NOK | http://autobuild.buildroot.net/results/a978b411886b0941201ad0090c65f0b8f0f65926/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/6cac481f032cf7b96e80e7dd7a1479b842215c21/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/37c0cbab23f5b8a8574c5b3292dc7682aeff3e8e/
    mips64el |               swupdate-2015.07 | NOK | http://autobuild.buildroot.net/results/a730fd9bcf4c84545218b66835d93aa3f0549683/
     powerpc |                   vsftpd-3.0.3 | NOK | http://autobuild.buildroot.net/results/d0fbff1dfb2ed1145bb6ba6adec9642d5fd8d2e8/


-- 
http://autobuild.buildroot.net
