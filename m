From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 31 Oct 2016 08:30:36 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-10-30
Message-ID: <20161031073036.59AFC1048EA@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-10-30
================================

      successes : 165
       failures : 71 
       timeouts : 6  
          TOTAL : 242

Classification of failures by reason
====================================

tvheadend-50a370707aedf5c12... | 6 
kvm-unit-tests-5731572b2ac2... | 5 
                     vdr-2.3.1 | 5 
                    owfs-3.1p1 | 4 
              bridge-utils-1.6 | 3 
make[1]: *** [libavfilter/s... | 3 
                   ser2net-3.0 | 3 
                   assimp-v3.2 | 2 
                  guile-2.0.13 | 2 
            gupnp-tools-0.8.12 | 2 
                 libnss-3.27.1 | 2 
                    mosh-1.2.6 | 2 
                    mpv-0.20.0 | 2 
                  openjpeg-2.1 | 2 
                    php-7.0.12 | 2 
                      qt-4.8.7 | 2 
                 weston-1.12.0 | 2 
                     xen-4.7.0 | 2 
             berkeleydb-5.3.28 | 1 
                  boost-1.61.0 | 1 
          chocolate-doom-2.2.1 | 1 
                  cppcms-1.0.5 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
         docker-engine-v1.12.2 | 1 
                ipmiutil-2.9.9 | 1 
                    lftp-4.7.3 | 1 
        luasql-sqlite3-2.3.0-1 | 1 
make: *** wait: No child pr... | 1 
                 mesa3d-12.0.3 | 1 
          motion-release-4.0.1 | 1 
                   mpd-0.19.19 | 1 
                    mpfr-3.1.5 | 1 
net-tools-3f170bff115303e92... | 1 
                    ola-0.10.2 | 1 
                 opencv-2.4.13 | 1 
               polarssl-1.2.19 | 1 
              ptpd2-ptpd-2.3.1 | 1 
                    qemu-2.7.0 | 1 
                 qt5base-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 
                    ruby-2.3.1 | 1 
               tcpreplay-4.1.1 | 1 
             tinymembench-v0.3 | 1 
                  tremor-19427 | 1 


Detail of failures
===================

        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/335bf1f9ebf626f76866ae52561ac25cb787646b
        bfin |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/4ed8da6df11eb9b3d73ab2ac595d0d1dcb1b8dd5
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/0fba41a84c7489b857ad806626d521f07f7cd0a8
         arm |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/e663ef7104dcfe6d34ce0a76350d499215598a27
      x86_64 |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/a00dbfa9159cc6543dca14a94f3f0ad6b4756209
         arm |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/7ba6d5f4075bb263f852efad0ba58f1d03871bd4
         arm |               bridge-utils-1.6 | NOK | http://autobuild.buildroot.net/results/e1fa4ae5044330c9976e7a5d8e267540889f3c0f
      xtensa |           chocolate-doom-2.2.1 | NOK | http://autobuild.buildroot.net/results/2a024d75ea444d82fa8010cab76c8655b81b20d6
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/9530a681488ea263666ad7a487931ad80015af8b
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/bc8180656b4a56180181c12bdcf9cdd2fa9df240
      x86_64 |          docker-engine-v1.12.2 | NOK | http://autobuild.buildroot.net/results/e9e7d90a56dca5e49c9c4b34d761660c19607721
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/e64cc142eedb4b52d61eb165e34a72527b5841ff
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/b647ec2c11f1aa8a5740f587a6a9d795acbfa4d1
      xtensa |             gupnp-tools-0.8.12 | NOK | http://autobuild.buildroot.net/results/329851daa060f23c55f996c1b0f323d41f85ccb2
        mips |             gupnp-tools-0.8.12 | NOK | http://autobuild.buildroot.net/results/1d1bd5c944cf5db09833f6dcddc258e2cbc05495
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/3287062ac554c85609425c81483c1624864bd48e
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/1faf35e16cd8d3073c290d03281fecbda2ed0804
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/2e0368b7ac6b94313b045770284408535d74b055
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/22d705ee0203872ab3378376d26f46433c8fd19f
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a96a768d22cfbba053ef0da7001048ac628c10a5
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/0114ba3cc4b7d8d9950565492b5172a256d122ed
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/be07ca79962cd51bdd9fcc6f36aac1808b2abbc4
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/6d5a4c4b4608d917bf54ec4010e50b93639975b9
    mips64el |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/ece8cdbf88095747a5f163068ba5c86b06bf9735
      x86_64 |         luasql-sqlite3-2.3.0-1 | NOK | http://autobuild.buildroot.net/results/c25b0e63679cd83bd980ae1070912b6ff72bcc0e
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/e3f693cbe64f98dcdec42cdbd386c031618be80e
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/19cb3b118f8821d192e93f5271a108d0a48f5c32
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/49bab253b9958fb5ab25a5b44591857f84f8213d
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/fe9566ce8a875c8c7661526341e1e8841ecab110
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/266a08bdc0f85f0bccb32e61f987f0245fbad8d4
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/3620ad0f3933ff1cc9e79fa732b881baaea29f93
        i586 |                     mosh-1.2.6 | NOK | http://autobuild.buildroot.net/results/8eb76e3360aa8c5116804bb1b1dbd5d43a90129f
    mips64el |           motion-release-4.0.1 | NOK | http://autobuild.buildroot.net/results/592672b8826f4c731c50d29725da964d876573c4
         arc |                    mpd-0.19.19 | NOK | http://autobuild.buildroot.net/results/bb16544bad333c8707db7d16b9ce93c8f55632ab
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/fc1c5ef251d6201679a0e49e9dbb625cb72d3a5b
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/154be97146d025df6b4a5b2b900def90a1197e09
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/b3ae14f32eac988dabf5418030a1eee165939e4c
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/7b269cd4a47de7ac19317522e451e7581508b005
    mips64el |                     ola-0.10.2 | NOK | http://autobuild.buildroot.net/results/c57db4b7c4d9578a6eba46ec61ffe7a8062d9819
         arm |                  opencv-2.4.13 | NOK | http://autobuild.buildroot.net/results/845f5e906fda3e87a2fc439a62baede44842283b
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/84e40cd49e91d98b4ad34ceb6c549743ede8fad7
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/ee5ca41aadae0dc90090e634f62cfd26881c486e
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/10604853eedbdb4f929eb8360d8eee1ce3fd14f7
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/85caaa39cf4636ec4492bd807494111f089dc732
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/0fd72018458a8c9b3f927c90dbe59c30f6cae93b
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/d45b746ba19df08d7de38a8a9a8c65f6af295e90
        bfin |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/27f11410255de22cca506f712f795bc75bd11741
         arm |                     php-7.0.12 | NOK | http://autobuild.buildroot.net/results/a77557cb9b75c755eecc56752029177c0abb0c40
      mipsel |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/65f08a095621f3f9e739acd81f7ad905b6646990
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/ccf816f305f09c91e882dbcc44543606fc135e5f
        i586 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/0dce5d9241dee3e8c00952bb4445f0499d4f5ab0
       nios2 |                       qt-4.8.7 | TIM | http://autobuild.buildroot.net/results/aaa52586c252b45f043b64582870f347e5ae0480
        m68k |                       qt-4.8.7 | TIM | http://autobuild.buildroot.net/results/83f919e4b8fd73feeb06562d20ac70d61429a4dc
       nios2 |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/af47434f893cdd6c731883f979394dcc4a3c31da
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fc175ada9be3533537752ab1ba9b476509240390
        i586 |                     ruby-2.3.1 | NOK | http://autobuild.buildroot.net/results/b55ff08ca0d663e6772855f1411764afbcce8877
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/dc6e5c1f9457416489cb8c381cba23c9ffc5f352
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/e1ca1ebe9f2e1e1eb38bbd4bde12a75fc87b0675
        i686 |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/a5897129a7a72c61aebaeb15da1f50c723fa0403
        i586 |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/d74c4097ffdbd3ca49cc7951e504d16624aecb0c
         arm |              tinymembench-v0.3 | NOK | http://autobuild.buildroot.net/results/6ea64865a92f23e1a0b0119763413eb965d5ddd0
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/cb6c560bf31834aadbe3d13a118b31ea8190159b
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/c6a4a02a1ee245f61ec781e1c499e3fd25ef664d
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/8aa9fdce0e3f5e73d300327d2bab1b30b737132d
        i686 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/a380508c844a0df8b105e9d5bf7181e167688b0c
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/b27367e60a73f796e2811c7fff1d468af77f4eb7
         arm | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/68f5b156be508f910ccfb1ac4f5adba338586f3f
       nios2 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/d16f9f96dbd3b857f06d1f4be378796bd4a7836c
     sparc64 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/a9d924e8d20e8a8e4f71c9302fa73fb8feb65876
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/2804a151fc198c274bb5f2aef09ff90207e9eaf4
        i686 |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/f5ddb83bcefcfdafd58885b8ebd3bb874d3edba2
      xtensa |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/50dead01b050cef4bf600837ef884f05f09a3398
         arc |                      vdr-2.3.1 | NOK | http://autobuild.buildroot.net/results/af4b1dfd997cee7f05fdd822f868e39fb91a6ec0
        i586 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/4d44d1d1923ba087f3be3720e5d7b4e73fc2085c
       nios2 |                  weston-1.12.0 | NOK | http://autobuild.buildroot.net/results/58c3a5acc4d52b2fd2112ec53b1e0a66224327d0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/25e8ce82063956b5e482608c53a93f33d0ff78ef
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/c470a1b2e0f8f12f2f32c37bcdf9cd9dcc721e1f

-- 
http://autobuild.buildroot.net
