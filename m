From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2014 08:30:15 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-09
Message-ID: <20141210073016.44F67101C84@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-09
===============================

        success : 257
       failures : 145
       timeouts : 1  
          TOTAL : 403

Classification of failures by reason
====================================

                 libusb-1.0.19 | 26
                  guile-2.0.11 | 14
           libusb-compat-0.1.5 | 12
                libexif-0.6.21 | 9 
             libxmlrpc-1.25.26 | 8 
                    liblo-0.26 | 7 
                  sispmctl-3.1 | 6 
                  thrift-0.9.2 | 4 
            host-libusb-1.0.19 | 4 
                pinentry-0.9.0 | 4 
                  perl-gd-2.53 | 3 
                 python3-3.4.1 | 3 
              libsvgtiny-12121 | 3 
      host-libusb-compat-0.1.5 | 2 
             bluez5_utils-5.25 | 2 
  toolchain-external-undefined | 2 
                 cdrkit-1.1.11 | 2 
                collectd-5.4.1 | 2 
               w_scan-20141122 | 2 
                  python-2.7.8 | 2 
       opentyrian-2.1.20130907 | 2 
               wvstreams-4.6.1 | 2 
             armadillo-4.000.4 | 2 
            modplugtools-0.5.3 | 1 
                    bwm-ng-0.6 | 1 
          libcdaudio-0.99.12p2 | 1 
ltrace-0896ce554f80afdcba81... | 1 
                  prboom-2.5.0 | 1 
                directfb-1.6.3 | 1 
             fxload-2008_10_13 | 1 
                     rpm-5.2.0 | 1 
                 openocd-0.5.0 | 1 
                jasper-1.900.1 | 1 
               lighttpd-1.4.35 | 1 
                    ruby-2.1.5 | 1 
                   slang-2.3.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                      mtr-0.85 | 1 
               qt5webkit-5.3.2 | 1 
     x264-20140930-2245-stable | 1 
           python-pyzmq-14.3.1 | 1 
                bellagio-0.9.3 | 1 
             host-thrift-0.9.2 | 1 
jack2-ab409a65df95bc261ff72... | 1 
           libmemcached-1.0.18 | 1 
                 gnupg2-2.0.26 | 1 

Detail of failures
===================

         arm |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/91f882d7fff4f9e2d67b2e5834dee72f66d0b456/
     powerpc |              armadillo-4.000.4 | NOK | http://autobuild.buildroot.net/results/4ea7b8c87a74615e51c2d107a7affb809a6b6583/
        i686 |                 bellagio-0.9.3 | NOK | http://autobuild.buildroot.net/results/b563f5b4d3bb510d5c2623561109d15357541118/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/9e4610763a276a10d5d3a26cc531174acbbee968/
        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/2b1b371a42cbaeb0f47c903885f80bc6b0bd859c/
      mipsel |                     bwm-ng-0.6 | NOK | http://autobuild.buildroot.net/results/f22888d87659dda8ff75f25490eab0a68f02bc9b/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/55327fff5888392fce235b12f18e673b0f12a46f/
      mipsel |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/49de81d1ce83af37c51df2297b8d69b87a5db3b4/
         sh4 |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/a373ec2d6c81af6b93d6d413dbf8c1b1b2194b62/
     powerpc |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/3bdd9bdffb1d55414787d38fc2656d7a3391a957/
      x86_64 |                 directfb-1.6.3 | NOK | http://autobuild.buildroot.net/results/50509801f9d53d317862caa9b98b11d28b391225/
     powerpc |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/f3781b35190d3ad9a968f5919bb810c3e30c9b99/
      mipsel |                  gnupg2-2.0.26 | NOK | http://autobuild.buildroot.net/results/9aaca74dd3a1f82e12358530db4d5d17eb833f7f/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/ce415098a62b31770a39cfb5120d95bc8cc40e8e/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8199674fc7e4b364aa2fa7a5d0ff66820921830a/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f080848e2b2ae5b2666f5bac14cfcaa0a62ca2f6/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a777703eca5a200c2826bd4eb9234a64e32e1978/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/f3c329a60b4b24db2ba62850d4017308ae055036/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8cca19aa8afb978c1ffeb341878c42c3622fd931/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/cc4f6ce0053ebdf71615c27dbe08ccef791c0030/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/580ac37d94e8f1f04770c1fd04f72335a403aaa3/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/9023328ecaddd63c2d06ad1e3d4ed130d76effb8/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/d1294865124066e8e85f5fd62a39ed32fa9cab06/
        i686 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/8a45b79153ab1c62db2a477823bd412956e03827/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/db2f24975c3c433afea7faeaf908d5d461ef1052/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/858c7bc147799b8b772da8c8415db65df03bd319/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/a33b995ba1671c6f0e6d504193b4fadc388d74c4/
         arc |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/ef88a74c73fcb8df51b864b6b6cc60222998a27c/
        i486 |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e1dbc8bdd087c35286bd9d8a3d01e380b078e6f7/
         arm |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/892846ddcf152a3ba5d585b67e4005ab64913771/
        bfin |             host-libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/77d788ad74b84390f43b081a92cf1bc42638e87c/
       nios2 |       host-libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/8e78a413b573ec41abb4a076daead06b8f4d1d78/
         arm |       host-libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/7419c04290f4ba296b37011f44ec9b47320880a7/
     powerpc |              host-thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/b3f9c0abe7cc6fc3630c846fab07f88a5626cbdf/
      x86_64 | jack2-ab409a65df95bc261ff72... | NOK | http://autobuild.buildroot.net/results/6f110fcd375b0e769fe24683735aadfb0bcd880d/
      xtensa |                 jasper-1.900.1 | NOK | http://autobuild.buildroot.net/results/bdfc6bf645883b310ea2faa16a7ac3792d70e2b3/
     aarch64 |           libcdaudio-0.99.12p2 | NOK | http://autobuild.buildroot.net/results/83dfd31794fc9c35c3ec94de317d08df710fa833/
        i686 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/11554c38933896ff40283c433a44bfb667f44941/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/e23154aa699b8c27812b3f37bd6ed76430eccedd/
    mips64el |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/2c71d035621943d4c18608c5767ca5db926f4090/
        mips |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/eb673f5a4a97d09216e34caed4771c84d148c799/
    mips64el |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/779aabee2d648d8d14c62308dc77b202eb7b02f1/
        i686 |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/9bc2bdb7a22059e5bdd61aa1a5fe78611185fb60/
         arc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/160596b2aed350edcdb9cb594659afd1c9abaf01/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/80dbd1a180768dcb1f2612472593af97113721a3/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/00bffc6b1b43db86bf3e1615ab593026d84e7e85/
        i686 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/28fe7d2cbad256711056dbde433317a7e805b1a6/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/46d6ca0eb5263fd68ec55e21f57deadf06cfe8cc/
        bfin |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/b876b49ce477f5e05173cb9d5ad55852a3f56633/
      x86_64 |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/677b1080839e64193172fcd39cad58149bf0f0fa/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/c15d7eebf89dde0341c4d8b49461d7cae9c4d528/
         arm |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/251e4882ee16e3d400d6b44fc441a1e7aa74a8d1/
    mips64el |                     liblo-0.26 | NOK | http://autobuild.buildroot.net/results/8e478e7262f4f5f151d9d3d24450ca018af7c21e/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/d213e2cc21504a235f05e16f687d3684cbc258de/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/3dd700405055750262738f867eb5aa08531f5781/
       nios2 |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/f841fea90dc0417856b2c3ea9117da31e2c38dee/
    mips64el |               libsvgtiny-12121 | NOK | http://autobuild.buildroot.net/results/655aaed138ef4c231a54a90503be94dc2fece2bd/
        bfin |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/1257419a695f6637d48658819cea97a985f7a17e/
     aarch64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/fc465be74fa0fa8c4fd9209fbf9c88b2eb3adcfe/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/050b4e2bc6d7500158cb7dcf361e588b511636f2/
      mipsel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/837dc161522ac9b9417d96dafc2d2cf9327e0ec5/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/8048c32bc481b857de126f1e271526cb839f52a7/
microblazeel |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/3d774fa3933c66992c318cb512c5d6252a753e44/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/f09961874ffa8022c4acd2ed7695cff6d6ce83c7/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/2a37642e552c3462f944978809c125516fd7eafd/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/dd96c1f069c70a2f406f9557cf2c6bac7635aac3/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/fe2412b9622a58288fcdb2b73af2be1ee1edc834/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/bd3f39f25b4e94bb059e1f370e1bef753f7cd10e/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e6dd343f6d9f0fb469204ecb49c7b0de8eaf87c2/
        mips |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/973f41e683ffb8a742bb05ae04ef64edcd440293/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/e8da86ae005079d0be8fd435bec9b3d171174e0b/
        sh4a |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/97a0f61547e3b5e740ecbc05454a0be8192ea135/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/97dd72adb20286f465ccf86bd503d2ad5876a592/
     powerpc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/4e904e87f6db5123efddb95f4dab9745f67ab823/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/c3e3aa3137b0c6b0368ab14426c43b5e16d667fb/
        i686 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/37332f78a3a2fffc44bdc78cca3187114ddaef30/
        mips |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/228d4f437d24e08bf7d0822809cbe9315a64e097/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/3726de495d13a05351828b3a4045db3cd85b224a/
      xtensa |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/1c33f4e8fa1e8979f791b10e6a5a540494e784c8/
      x86_64 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/c6b1b6e377c4958c7891aa37ca8be90e8dfa0a83/
         arm |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/5ca3b8e73a6cb0bbe8760a775b8205e35d62add8/
        i486 |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/b790859af4b96312b20433e9d3a32fb3168759a1/
         arc |                  libusb-1.0.19 | NOK | http://autobuild.buildroot.net/results/0c9a07822d9f7442f12a731b32de61fc034cb3d0/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/fe84f4a6dc0f94b5c590ea88ae49e9f0b061d9a0/
microblazeel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/9ecdabbaa08d7e3c0e613d1d31047a001f927687/
      mipsel |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/f4705c07830628033a5abd1fb9695ee9a27ed230/
    mips64el |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/5f152ca1a02f4fc36cbd0ae637e586446d531607/
      xtensa |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/2bc6452569627e58466a93923482edfca4c03046/
     aarch64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/b81ae6eb3da7ebfdab79f7a283320e107f4528eb/
         arm |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/07d1ddf0e007a52cde2adca3e21495baf21a7440/
    mips64el |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/209407e6138379c8014e724d851797f6e11969a7/
     powerpc |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/0a0ce572072935c580cf2e32969e96e206d40e6c/
        sh4a |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/502a4002ae4632eceabb35fb7efc479c3881a3cf/
        i686 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/70854fbd4d6691233c62ab928c22b34260047a56/
     aarch64 |            libusb-compat-0.1.5 | NOK | http://autobuild.buildroot.net/results/552f134654b5fecffe35fc845b1a953608a09178/
      mipsel |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/1e1e920084fdd0fddb3fb8d163788a3137e37509/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/a8d411b26dcb919bad2929390236f1eebf8ed665/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/9a3b145fd279298a50abdaed22b8c16b4d43a122/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/949fd462c455fab261c9e24b3ee6c2af36528aa0/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/25ee1b56087b836d37468d3d85d977ca08ecc38a/
         arc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/939abff1a14ae8965543ec8d248734521a83ca5b/
        sh4a |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d68084ca5e3e9a3c11c49edf57e4da6dfd827461/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/23fd38985ab04c1aff9a259278921c5ab1df92b5/
      mipsel |                lighttpd-1.4.35 | NOK | http://autobuild.buildroot.net/results/39c027bf6b76a0f9c15a184f449dadacfaefe980/
         arm | ltrace-0896ce554f80afdcba81... | NOK | http://autobuild.buildroot.net/results/705feafd2319274dd5b558e254d084553f6122fe/
      xtensa |             modplugtools-0.5.3 | NOK | http://autobuild.buildroot.net/results/02b83ab852feaac3af8dbd2294f65945efdc816a/
         sh4 |                       mtr-0.85 | NOK | http://autobuild.buildroot.net/results/808c3c74cdbec6c8d19344ad8c074400dd3896e5/
        bfin |                  openocd-0.5.0 | NOK | http://autobuild.buildroot.net/results/66c1c691fa42cd3f5e0d5cb74ac43212adac7162/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/4c12d4bc554a9eb1646940ddc7feefedc2c61364/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/e902e6e6887210db69eb8fec89f9f820e355f0dc/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b7861dadf6e9f21ee0341ecc3762693a44b6b3e9/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/9c182df71c74e115d24f0395df9dcd8d78fb50a4/
      mipsel |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/f9227668581eb39ac51bc1c893ac5d4ceda9dd7c/
      mipsel |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/27877b7b12483f36a3f91f91afa49dfbc57c4f7b/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/0bc414046223c48be8786e3dca143cca86296984/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/f11b6535985fac7b6fb53e7ce10b9c5f6ed2bcfd/
      x86_64 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/0d17fae8c06b0a4a25d25bf2dba538c47530de27/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/a969fd15a652df96c2414cf0c5f2e345d38e6e6c/
      x86_64 |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/d665eb28f32edfb8827c7619e5475aed9c47b4f5/
      mipsel |                   python-2.7.8 | NOK | http://autobuild.buildroot.net/results/b5a2376294794fbc167ab90030256b1d9e5b1042/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/23686a9752a4a4b4dc4c928657f81728e113276e/
         arm |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/bec8675be47f0e50df6da3b0dc321f7673179f25/
      x86_64 |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f818db6021fd0b3c5b6bfe844bb1b3726f9c84b8/
         sh4 |                  python3-3.4.1 | NOK | http://autobuild.buildroot.net/results/f233c5c015c7a4455e6518b33c1d443796667196/
         arm |                qt5webkit-5.3.2 | NOK | http://autobuild.buildroot.net/results/6e4d5cbf2bbd8502795ee9e957470fb88a4ea19a/
         arm |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/77dcc8b379c2fe001bc247ad7929170c3510350c/
      xtensa |                     ruby-2.1.5 | NOK | http://autobuild.buildroot.net/results/a803e8c259ea327b175c4f858de153d4e04e6e05/
     aarch64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/56be5a9a273d299b9b6f49c15be28e7d88619a52/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/51ad929e76a4e736c3553942fa6543fae158aae9/
        i686 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/50267cc020022fe288506fa9d06369bbac1ce9b5/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/96d46eb44d7a41753f9fd152ebdae5fc95d94f00/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/f5db4ff819aab100af8b873a12ffc65f42f143ec/
microblazeel |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/d52ae37461af96be932d37a62321ddc3517187f0/
     powerpc |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/de3ee1b470c03b4fa159b3d620615f397f622eab/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/43ff4a076cdfd407148c0207dd6039aa17c91618/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/79bbd250fed0c4b317eae9204626fb5c62f2b317/
        bfin |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/067ea104bc1443d31ea635f52a3142f484219204/
      x86_64 |                   thrift-0.9.2 | NOK | http://autobuild.buildroot.net/results/f68d537e623f565000ca966372a7c0277f4e3888/
         arm |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/7cdb525284e51c4c94bcbddc81b29a0b4d5438c8/
        mips |   toolchain-external-undefined | NOK | http://autobuild.buildroot.net/results/cdac5dcc588cd6cd90541d6e1e23868f89120b07/
      mipsel |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/6735c7386c5f3300db072cf4b54a3696bc5b00af/
         arm |                wvstreams-4.6.1 | TIM | http://autobuild.buildroot.net/results/8241e21e40897e305263cf6a02c9292bf9fccfd1/
        sh4a |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/97b4c17a4845d487505995fbdce37f77c68f3533/
        i686 |                w_scan-20141122 | NOK | http://autobuild.buildroot.net/results/666acd49457ec452d9adbfef445e9a088be81031/
        bfin |      x264-20140930-2245-stable | NOK | http://autobuild.buildroot.net/results/56607c7612d767744278337b3f419f457d062f67/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/e44e9d26e5693ecfcefc08471af67af2a6535b33/


-- 
http://autobuild.buildroot.net
