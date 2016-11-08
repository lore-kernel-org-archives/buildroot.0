From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  8 Nov 2016 08:30:19 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-07
Message-ID: <20161108073019.811FA20D80@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-07
================================

      successes : 179
       failures : 69 
       timeouts : 2  
          TOTAL : 250

Classification of failures by reason
====================================

             core-dependencies | 12
                 mesa3d-13.0.0 | 7 
tvheadend-50a370707aedf5c12... | 5 
                 jack2-v1.9.10 | 4 
net-tools-3f170bff115303e92... | 4 
                   assimp-v3.2 | 2 
                    mpv-0.20.0 | 2 
                    ola-0.10.2 | 2 
                    quota-4.01 | 2 
          sane-backends-1.0.25 | 2 
                  stunnel-5.36 | 2 
                coreutils-8.25 | 1 
                flannel-v0.5.5 | 1 
                     gpsd-3.16 | 1 
               host-qemu-2.7.0 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
                libcurl-7.51.0 | 1 
               libdvbcsa-1.1.0 | 1 
                libmad-0.15.1b | 1 
          libmicrohttpd-0.9.50 | 1 
                 libnss-3.27.1 | 1 
                  lshw-B.02.18 | 1 
make[1]: *** [libavfilter/a... | 1 
make[1]: *** [libavfilter/s... | 1 
                 mplayer-1.3.0 | 1 
openblas-f04af36ad0e85b64f1... | 1 
               openldap-2.4.44 | 1 
phidgetwebservice-2.1.8.201... | 1 
                privoxy-3.0.26 | 1 
python-libconfig-b271c3d9da... | 1 
                    qemu-2.7.0 | 1 
qextserialport-ada321a9ee46... | 1 
                      qt-4.8.7 | 1 
qt5webkit-b35917bcb44d7f200... | 1 
                    ruby-2.3.1 | 1 
                     vlc-2.2.4 | 1 
                 weston-1.12.0 | 1 
            xapp_sessreg-1.1.0 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/fafa4dfaf17a5e0accdaf1a452e04275a75d074a
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ca8fcb3514cedf0893196c5941a551cc42b9de0b
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/256b45593cec82f09e56a8f4168826f861a93486
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/94855cb8e2f32451cbbcee419fe32031cf4f43ea
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/1100d7306e92618af4488d490d291426cfb0b729
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/c660234a123cc6ad3166464e5e94913af4698db0
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/2decd59a8bd772cce3247ac726d8d804dbe07d5c
      x86_64 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/b0d4830aef496e5b03bf892580ec78d30439f4dd
        i686 |              core-dependencies | NOK | http://autobuild.buildroot.net/results/c1e0617f5c5f72e92f3017a40dc7aab2ae02f993
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/94c1e719c596b52c234af23963949d611e177d53
      mipsel |              core-dependencies | NOK | http://autobuild.buildroot.net/results/965561fb04f6310606a3e8126b98506686efe036
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/4f69e7f28039f81e6c968eabcb3100950703a167
     powerpc |              core-dependencies | NOK | http://autobuild.buildroot.net/results/55f43125ef84153ba21b0c74ef561d7b9e8922ec
         arm |              core-dependencies | NOK | http://autobuild.buildroot.net/results/33d2cc7c22c053b5bf2b92e68a6b546142830b08
         arc |                 coreutils-8.25 | NOK | http://autobuild.buildroot.net/results/78a3594b5d11c5a3377f82bb6d5fbe98ee8623b3
   powerpc64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/6bdc841619ac22221a062f9a808b49d303d11543
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/72fda59a8c0993819d2759ed0ceef219ef124059
   powerpc64 |                host-qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/a5fbc7a77192244ee18551da1b50b0c833839d3f
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/5dc9feda88b3413cf3ea80194ac384ab9a9a4b4a
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/3683372b088e7fc871a183044b179a27de904be2
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/0e2722e3b4c9abad3bdc751c80b8c799232546e5
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/28fd2090d93436091b234cb1cfdd2e044c8d84e5
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/ea22c3303ac04ab82b1703ea72280f1bf9c2e1d9
        bfin |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/6a619474fd88cb3dd32d34fcac7140ed6fddf4a4
   powerpc64 |                libdvbcsa-1.1.0 | NOK | http://autobuild.buildroot.net/results/a3daedcf25365bf19c231330f7c35ec2aa407f29
         arm |                 libmad-0.15.1b | NOK | http://autobuild.buildroot.net/results/ea9cefc1344ff77171844c3290e8b1e6b0ec346b
         arm |           libmicrohttpd-0.9.50 | NOK | http://autobuild.buildroot.net/results/02df1e57b392a5ec7d4b812e9b0dd4f293c12160
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/b724dac0ec798e8f82ce29ece01aacd2c026c9bd
       nios2 |                   lshw-B.02.18 | NOK | http://autobuild.buildroot.net/results/8510dec09a9d4dac04fff40e462a20eb2bae2e16
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/36396249e649ab2270563082bc40db592a2bd36b
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/6bf5a7984591ccb9be726ca2e9d60c168ea76f89
      xtensa |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/53332964ed792dfc7658e5ef25516c5d7865394c
       nios2 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/495e93299e05702f6b6b5066457640b5bf4357c9
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/e91ec768fb9c71612a46caa5726def47c9cf8045
     sparc64 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/8d4dd83810afc60ba3eda3817959fe057fe97ab7
         sh4 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/de83826688f17081fc29e02a0fac6e7f4995aee5
        i686 |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/dbf25a5e9bbdab69eefe46146b4ed40868860953
         arc |                  mesa3d-13.0.0 | NOK | http://autobuild.buildroot.net/results/8c7c8507a1fb3af9ed75dfbda854e8f2fb214401
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ce12205cb5ad813e74845ce9308410c98812f4e6
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/2180a5ec3738ec1798af505f1f57ff56d9f72144
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/dfff20da3786334a2a683a6d855a9fa8c99ad423
       nios2 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2dc38ed12c89a93dffc9fa70d0fcfa4116f54112
     powerpc | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/555fa04597224015940d254950677dd47914f909
       nios2 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/f83fa261cc1da1e992c5f6df5f9cd0c4032148ff
        i686 | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/6deb21a06a533bf66b13be2ca3fed546734f3012
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/396662a5b0e49633644239adb40cef4b78ab9a77
        i686 |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/fa1edc70ce9987a3ba13a771d02cc00ae518788e
   powerpc64 | openblas-f04af36ad0e85b64f1... | NOK | http://autobuild.buildroot.net/results/eb7f278d6bae4a2b0161593a43f680457a8abaf3
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/7554e32912c91c42062cf395a9de847ee1a575ba
 powerpc64le | phidgetwebservice-2.1.8.201... | NOK | http://autobuild.buildroot.net/results/38ff864d7543b7850dfb3bde881b20148281ffe8
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/a4303b26aae7c12dde8c2e7e63d2d99477c0442c
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/d940a58382afcf690edcef4ff4465d67c2a114e9
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/9676b4c3109b3b46962fda2a2e6d334fa09af03f
         arm | qextserialport-ada321a9ee46... | NOK | http://autobuild.buildroot.net/results/96a26d5fdd0fbe302b7661fa7bc3dcf516afdce7
 powerpc64le |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/d92c06029baf06f90770aeec007f9151c21775cd
        i686 | qt5webkit-b35917bcb44d7f200... | NOK | http://autobuild.buildroot.net/results/29dad8425081d74510c612af19d11d40a3562450
        i586 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/442957a8ab21ceb52a90f1e3b4ea6812e7941692
      x86_64 |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/6866206600e95c75b24cbf770e7e4917cfdb7d26
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/10831143bd8836bd06935646388a84e1fe88d4b0
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/3abb2fc7af79faf73374b2ba8b500b1a8d0d26f8
      mipsel |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/fde2e1a2705e9ee89fb9dfe1ad330209f1531d8e
        i586 |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/a8d0cb29691b5a3d3ca4e5f9267df3006bda7890
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/85d6b78097ea8306e31eb76969544cc8a7862281
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/b245fe4de697db79177e13261ad9c396f6354c09
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/c85f204b5f329ea2b88f28f4aaec6d44ad037bb7
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/471a35de8c64cb1bd151c0149bc8b12b10a73919
    mips64el | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/645ff1f1a205dba5fe8d10411e33dc266bc32b6a
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/04181c408e5a2802855031a7a9cde7887260761f
         arc |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/3491d2c5635dc218b12d35e27e86b6d8d579c978
    mips64el |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/cc5b3275a6d268074ee8764f45c15982d79bc67d
         arm |             xapp_sessreg-1.1.0 | NOK | http://autobuild.buildroot.net/results/bb5428092ad1095d8d7283bd79afb293adae2d0b

-- 
http://autobuild.buildroot.net
