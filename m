From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Jun 2016 08:30:25 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-10
Message-ID: <20160611063025.BB4F5101778@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-10
===============================

        success : 235
       failures : 121
       timeouts : 0  
          TOTAL : 356

Classification of failures by reason
====================================

gsettings-desktop-schemas-3... | 14
     python-dataproperty-0.3.0 | 13
           host-gettext-0.19.8 | 10
              e2fsprogs-1.43.1 | 10
                  boost-1.61.0 | 9 
             bluez_utils-4.101 | 7 
                gettext-0.19.8 | 6 
               libsigsegv-2.10 | 3 
                 lvm2-2.02.155 | 3 
sconeserver-bbb384404575f8a... | 3 
               libepoxy-v1.3.1 | 2 
                  openjpeg-2.1 | 2 
                flannel-v0.5.5 | 2 
                    mpv-0.17.0 | 2 
                     gmp-6.1.0 | 2 
                    cups-2.1.2 | 2 
                beecrypt-4.2.1 | 2 
       gadgetfs-test-undefined | 2 
              micropython-v1.6 | 1 
               host-gdb-7.10.1 | 1 
                directfb-1.7.7 | 1 
          sane-backends-1.0.25 | 1 
                   erlang-18.3 | 1 
                  cairo-1.14.6 | 1 
python-libconfig-b271c3d9da... | 1 
android-tools-4.2.2+git2013... | 1 
              gnuradio-3.7.9.1 | 1 
igmpproxy-a731683d1a65956fa... | 1 
am33x-cm3-11107db2f1e9e58ee... | 1 
                 mesa3d-11.2.2 | 1 
             netbsd-queue-1.70 | 1 
                wayland-1.11.0 | 1 
                       unknown | 1 
                cifs-utils-6.5 | 1 
iputils-55828d1fef3fed7f07a... | 1 
    xserver_xorg-server-1.18.3 | 1 
                 php-zmq-1.1.3 | 1 
                    lftp-4.7.2 | 1 
                     fbset-2.1 | 1 
                xfsprogs-4.5.0 | 1 
               openswan-2.6.46 | 1 
                  connman-1.32 | 1 
                iproute2-4.5.0 | 1 
                   open2300-12 | 1 
                blktrace-1.1.0 | 1 

Detail of failures
===================

         arm | am33x-cm3-11107db2f1e9e58ee... | NOK | http://autobuild.buildroot.net/results/a25d14b411b65e2da267e0db59b5d6134df84271/
    mips64el | android-tools-4.2.2+git2013... | NOK | http://autobuild.buildroot.net/results/615737331df30276f63b87368f42c2db97db172f/
        m68k |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/054d7ba6e5105acdb69fb00a7a171251f89fbc69/
         arm |                 beecrypt-4.2.1 | NOK | http://autobuild.buildroot.net/results/670dcd3bbab42218821f54ce8b0751704a36ec5a/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/41996c7f10617e9ad4cbce06c349ae35701d99fa/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/500825ad1da2ab02d869bea83cc5668da01bc267/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/4cb5cf66174901fbf912afb87255b5655d97c55d/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/04c3c54a88ce62683e814ff50279dd046550454a/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/2ddf17fd49282dd870c3a35836dab23d15ae110a/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/c059ed1bdcf65c684d7230b48486eecc1484dc25/
        m68k |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/79cb9b6f079f46896b76aa6b55972b338435626e/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/911fbffefc264b1b2e36941f67b045cb2a03950a/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/76535a1418842e2f580f147c7285f00d448de98a/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/b5b273789667a7a0963ef3cc5b8d62ad85709442/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/14715ceddc32cd6ecda2946750f093a415308386/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/90b6ed1d09b0ffd6f6602881ddbf6c60e9bf793c/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/f1e40966d092ff397aaef1467648b22a102df339/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/34e667c5cb4e2c1745f015392c2d73add7f1fc3a/
        bfin |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/eeaeae666772bd11dfff7f972b78159c45ce0efc/
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/4a4f641950ae591dd33e7cd3e91ee4826aaf30be/
        m68k |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/1706261ca5be20af73a55a3a6afab2e4946ac03a/
        m68k |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/050e56da205134a6281a539a461ed4b7d8a8180c/
        m68k |                 cifs-utils-6.5 | NOK | http://autobuild.buildroot.net/results/caed184afc1d96c0fb1ca4f2490031104b4c26e5/
      x86_64 |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/274df421a3cd75291013e4acc1718ff838e0ec47/
      xtensa |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/231648e6e9f28803a02a3616408bed60ef4b4c82/
         sh4 |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/1d35cad63c27745547fa5388f34221124cc7b04d/
        m68k |                 directfb-1.7.7 | NOK | http://autobuild.buildroot.net/results/c073c069c98009ad967097120bd153dd9d2220cb/
      xtensa |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/212cb5c7cf16810a9e0003c295270bfc906bc4aa/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/df6b0c324dfd33c180c228017243c13e8e396861/
      x86_64 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/9f949b3b2cb86541a865d98038cd83eccde3ec33/
    mips64el |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/ccdbe68cb2c448c3b4caf6c306992590a106425e/
        m68k |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/66f773cdf601bdabed780c918ac52cec13641e17/
        sh4a |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/27930e0faa76fa07e33d53b704d11494665d8421/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/55c0c71153f90561a0a76bb5a45be70440c12cea/
      mipsel |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/77c97dd47a80572e286fbf67c9fb8e3d2704e253/
        i686 |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/6918830eb686cf04f65788d017cb689178bff11d/
         arm |               e2fsprogs-1.43.1 | NOK | http://autobuild.buildroot.net/results/94fee1f904ac3dc97ed13f3a8a763738364593dc/
       sparc |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/2abedc17f26e4d22febf8ec79be04068c9e7fc5c/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/73fddb944b1b24bf28379f9e3f326dc3e1197d50/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/b81ee77fa4867120dd081ebaa1e3e66d1b12f586/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/0ac1eb13ed7d4df737bd4d01bdf8078f33a308c1/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/956e3e00b288cd5070c76de1b3151c4335a35243/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/3e2e1be129d0cfe7191dbbd7c2b486a54ef76e61/
         arm |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/6f746858206a4befd5803e6ae8dabc82c04e5523/
         arc |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/6f4a479f6cf24c87a0da9b89fe73360a311d1d53/
         arm |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/1cc924bececb324de29f47193cfbd0a3c8479bfc/
         arc |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/0d65ec1e0e3f70d316db7000a8cd92125937fed4/
microblazeel |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/43768e1f316fc6195eeba69fa8c752eb651caa03/
        m68k |                 gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/4ef853c4b2ff058c5624a74a0a967b6cbb214551/
        m68k |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/7996765a3e3b1abd014da941b714cb5f63406ac3/
        m68k |                      gmp-6.1.0 | NOK | http://autobuild.buildroot.net/results/3fc81fa9cca3c630e4d6975bf15225764bb3077b/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/ab612e889c17c76cf50dcbef8485b0ebf784f783/
     powerpc | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/85fb4e5ab77bfe4c5863062fc8971dde5c92eef6/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/efe7217f48266d2fb19af12503b4d38186cdba0d/
         sh4 | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/5a12796fc4f8497e3791edc3b188c420116091f7/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/87ed6fd71cf5fd16f7cd2c20262848d22bf64993/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/e0e709826dff680584c5989f17285258d634cfbd/
      xtensa | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/993d4f0b366ecd57b4c66b6e02ef371c9f0b2194/
        i686 | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/e082b45d125f47e4452758035896d93ce0581668/
        mips | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/849b60d7d5c71908add731ce06fc296ea43679b7/
       sparc | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/d70307363236829590958da176ae5d45958afa11/
         arm | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/c13de31283711c724d7909b9dd44799ff4817793/
        mips | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/33c1bb5c5be73a52cb3617be12fb862e5ee14799/
      xtensa | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/3d9a1182b5d638257b890aaa557177935e65c269/
      mipsel | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/3c2fc13c5ed8c679657113966958b3c74fba2791/
    mips64el | gsettings-desktop-schemas-3... | NOK | http://autobuild.buildroot.net/results/d2bf0a5e3d9eeeed5ee419cb293bd90b08c74077/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/ecb9cfe7db8997807bd699f355cb511040fc2e2a/
       nios2 |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/77b6c3a5ecf10151a575d5b9b7f17138e408c5b4/
         arm |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/b1546f3649449ef7a0aea4f6d86420d53f4b919d/
    mips64el |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/b738d1d88ae17eae8932bb730a591cbc59c1e7b0/
       nios2 |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/927fc5e7b2791565c3153e3941dfc42e578cad5a/
        i686 |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/92d8f2edb5793b7255b21a5b1c76114cdb688c75/
         arm |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/5556322a09a4d869bd3b54668ca18c885cdee29c/
         arm |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/651647e6b6921aad16a899c436f634373deb623a/
         arm |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/8c1cf12493458b89926f09c7a08db731587f3cc3/
        sh4a |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/c9a3cbf548bc592f062dc81fe5d4ad996cf8a453/
       nios2 |            host-gettext-0.19.8 | NOK | http://autobuild.buildroot.net/results/ff3aa6bc3343d1497ac06a42e87c9cc75de23789/
        bfin | igmpproxy-a731683d1a65956fa... | NOK | http://autobuild.buildroot.net/results/4ee081212614d86a3b2b74274f38825f7a5b3f6f/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/3a2d356ad957bbd1d87734c5fe908c540930c66f/
         arm | iputils-55828d1fef3fed7f07a... | NOK | http://autobuild.buildroot.net/results/c822010284e8f6eec908d22cac04fe2a7f251482/
         arm |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/2ce351279cacd45c5fd3257121ea3b58cbd8ea4b/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/1c9d59d48ca04c290e62f2248b5581e962b6f25e/
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/32b0636ca12ee8d3fcdbea1fe1c1e15461c6ef63/
       sparc |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/d72ce40c24b3c010f7ede80fe6912e9ef1583e1a/
         arm |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/9e763b103308df0048a76ac1b405fac27ce72b78/
        m68k |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/ab0108b22f7e463694b0cb3854b8b0a3d4009f96/
        m68k |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/ea472c218f6d339f0e6ea5aa6654e2072da4aa81/
      x86_64 |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/6ff5d7038c6e7fca97100ec22b127c335f1389c9/
         arm |                  lvm2-2.02.155 | NOK | http://autobuild.buildroot.net/results/f06a494988c73a84c6820c9b9b52c8bd814bfc0e/
         arc |                  mesa3d-11.2.2 | NOK | http://autobuild.buildroot.net/results/b594dbc2db1c9aca73d3d7df7753c102616df566/
    mips64el |               micropython-v1.6 | NOK | http://autobuild.buildroot.net/results/722ff0249ef6a8c1c6ecfc639107d8474307261f/
     powerpc |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/59dc51775bd16b74d1dd5d92739f16b876c21fa5/
        bfin |                     mpv-0.17.0 | NOK | http://autobuild.buildroot.net/results/e6cefe2c94aca787e7baa3c0bcd473a4449707f7/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/eb8d56ec9c99a601cfbe9495f706c0b49150f58f/
         arm |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/fcfe38ee3d308f953c3c4319e72fa518542c8358/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/b379684250c2872b3c0708438770d6638a878635/
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/abbd9b2556ac6dc42c3c0416ca3ab8f041570518/
      x86_64 |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/6d2602f607332b098e77d691e9a60bf07662b1af/
        bfin |                  php-zmq-1.1.3 | NOK | http://autobuild.buildroot.net/results/3a1685ff3443b3ec5ac706c1e7b8004402647c14/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/3986bc522f1c92458abfbb43f5383615adff0427/
        i686 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/a1a1bce6c1cd42c514e74bb77f1bbfe9e69c7502/
        mips |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/c112f862acd8e8d13250ddcd928616b2b14c76c0/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/0d88959f9f4f1831d92e61b716913a85d30dbac2/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/57c107bd5cc62799f141c053a014aba6f74734ef/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/2e46bca11d428ab961dd16ed4bdfa14f0c441d58/
       nios2 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/322830a50342eb2e4c9feb2215cc138a2c47db4b/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/d87f258cb461c325095567e3ccb42586ede99756/
     powerpc |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/849a3cd7af0a2817ad1680ab866b98c086730453/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/e3f7bda489f369e89856022858ef9b1d0a769982/
       nios2 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/ddaff36455ac5d48f47f5c75aa70287d2af31bbb/
         arm |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/84735f3b728e04ac677765bb6217740841b056b3/
       nios2 |      python-dataproperty-0.3.0 | NOK | http://autobuild.buildroot.net/results/7362a53ecd333bc841c2f8394a332834ed0c469d/
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/8ef940287d07c4dcf515e73634a9450316409d44/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/61f377ae8fa73fc62ff6e4cd4df0711758fc1aeb/
         arc | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/ec4600b9f935f44a1b6ebc794fe68f358df7eaa7/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/589d08fa93b5759172c621974fc1aa95aa3042ec/
         arm | sconeserver-bbb384404575f8a... | NOK | http://autobuild.buildroot.net/results/4ba0363eda07ac9a0a11c5b2c3d592099568d5a8/
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/8ba02097a11fcb8f4388fbf2080570ce079bfa2c/
         arm |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/f05cd2c392f57d31bcb8df26fa0d72c0a90eee25/
      x86_64 |                 xfsprogs-4.5.0 | NOK | http://autobuild.buildroot.net/results/f6c98e0d5a1c18bc63e1b4d5597b4d38a6cdcdc5/
        mips |     xserver_xorg-server-1.18.3 | NOK | http://autobuild.buildroot.net/results/b3b548d49e0aff9cf1d90b6fdacac14ce99e409d/


-- 
http://autobuild.buildroot.net
