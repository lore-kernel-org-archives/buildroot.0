From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 10 Jan 2017 08:30:05 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-01-09
Message-ID: <20170110073005.3999920653@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-01-09
================================

      successes : 165
       failures : 91 
       timeouts : 1  
          TOTAL : 257

Classification of failures by reason
====================================

                collectd-5.7.0 | 26
                      nmon-16f | 9 
                      mpd-0.20 | 7 
               sdl2_ttf-2.0.14 | 6 
                  fbterm-1.7.0 | 3 
                    flac-1.3.2 | 3 
            lttng-libust-2.9.0 | 3 
             berkeleydb-5.3.28 | 2 
                   cmake-3.7.1 | 2 
                 libnss-3.27.1 | 2 
               openswan-2.6.46 | 2 
               qt5webkit-5.6.2 | 2 
             rabbitmq-c-v0.8.0 | 2 
        riemann-c-client-1.9.1 | 2 
                   assimp-v3.2 | 1 
czmq-5205ec201e97c3a652c17e... | 1 
                espeak-1.48.04 | 1 
                  ffmpeg-3.2.2 | 1 
                  guile-2.0.13 | 1 
             host-nodejs-6.9.2 | 1 
             host-nodejs-6.9.4 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvm-unit-tests-5731572b2ac2... | 1 
                 libraw-0.17.1 | 1 
             lttng-tools-2.9.0 | 1 
make[2]: *** [e_4758cca.o] ... | 1 
                   open2300-12 | 1 
                 openocd-0.9.0 | 1 
                 openssh-7.4p1 | 1 
                   perl-5.24.0 | 1 
python-libconfig-b271c3d9da... | 1 
                     qwt-6.1.3 | 1 
               tcpreplay-4.1.2 | 1 
               trousers-0.3.13 | 1 
    xserver_xorg-server-1.19.0 | 1 


Detail of failures
===================

         sh4 |                    assimp-v3.2 | NOK | http://autobuild.buildroot.net/results/ac99580e651fecf8dd3eabad70b04b368cbd0c38
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/a3b787ed5d11756119be3dcc7534260a6fa88755
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/780621ed3c8b24b037996876043b7f2d4eba1f48
        i586 |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ed1c5dafed70e74dead0212b14b50d2da19e8c21
      x86_64 |                    cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1588b45b55f6926d0967b578abf568ce78e4233e
     sparc64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7784a63f98a8549806d459e4346197ffb1358af4
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ad57faa8ae2d0cd6fd1978bbbbb387bbeec534ba
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/74f769d024f6989f326a625f8297c28656f872ce
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9436c66f508fee98ee137a2253d113d88f89b466
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/bdddb0d3a6d436517702a8921b0d7e5523d25c32
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/78b340a16a790e79ea780c6097306c62fc6c9d5e
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/22010f494e946174a79cc31c55d131332d5163ec
       nios2 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/9a73034d7f2463da34e8b5df60e032bdee7294b1
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1a268451636bd193c6591e9f372ab34aa3be4e58
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7be6c545ae1f40ef193bff568cdff5c7e64565ed
     aarch64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/cdea80d441d9861924384d7715fdcd62ec3a848c
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/3b8fe5851b9932772bb68dbe10ec40c38373d9ea
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/40017d229a41f07b5db4f72ef44fefeb0b42b345
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/8ddf4e59a2420e59473b7fe7d42ff34a2a8b449d
      mipsel |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c83cc1e18cb2057fdb99212553623856580a5c74
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c2f4e08b86a4a65f087862a006fc2ffefbcb5df4
     powerpc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/7758efd09e702d191b3b126a7c19f57a80e7f5c8
       sparc |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/43146270801d92964858a90a12865e777ce9d339
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/b0222da3a612f2b7a403a038f124a4ff64e0e7e0
      x86_64 |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/33af43ea07a18c63fe6dfd961d2cda05d6d3f187
        mips |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/971827ca03ce13a081d2211d16001c4459962d03
        m68k |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/a3c2b2dc14a164a9620737c4a4baeb164359b71b
    mips64el |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/1e7a528bd609a470983e55c7dfaa4eb71d8c60ca
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/ca6870a978875dc562ba412eb06dc60a5b5f9799
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/803cdfacff9787f29c90ef68c16a1844acafb848
         arm |                 collectd-5.7.0 | NOK | http://autobuild.buildroot.net/results/c9497afce48dd0a7f5aabb372ec7c2175a003f7a
         arm | czmq-5205ec201e97c3a652c17e... | NOK | http://autobuild.buildroot.net/results/21df1e6ccdc2ab7a79cff5f7095e7f67fddfd5b1
       nios2 |                 espeak-1.48.04 | NOK | http://autobuild.buildroot.net/results/eee15a6ad7c552ab46f78e476e4b150ed9b17bf1
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/78dad26382323c477f673f345cab0a84d0c7741b
         arc |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/eee8888c721bab8a516702ed280bafa58be08e87
         arm |                   fbterm-1.7.0 | NOK | http://autobuild.buildroot.net/results/b39b5a1cd0a7f1f3a08ee7afc421cf0866703af9
         arm |                   ffmpeg-3.2.2 | NOK | http://autobuild.buildroot.net/results/1482e102a4b477a23872a1314b4390a79087397e
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/b643824d797050d7c001a3b72598158d8f1c6128
        i686 |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/a2f2d7b4e9e7b57bc8691e3ec29ecf818be3f79b
        sh4a |                     flac-1.3.2 | NOK | http://autobuild.buildroot.net/results/607af1735c922882a4a0314aef3681dbe4d26c6d
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/17e5d25a872eb4431f58e26403b9563fb4e14d0a
      x86_64 |              host-nodejs-6.9.2 | NOK | http://autobuild.buildroot.net/results/823646e9fe8263e9f636f805033ab56b32bc6b3a
        i686 |              host-nodejs-6.9.4 | NOK | http://autobuild.buildroot.net/results/5072c6d67f1abb1e8702743bb9d3f63d23ede086
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/bcfd698b1e3c41bc4d0b552e5803212acff1b0b6
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d84f17ccc1c8b2ba5b2218a601154613697906f3
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/f7ab16d98293b00908178688d22b89c959530136
microblazeel |                  libnss-3.27.1 | NOK | http://autobuild.buildroot.net/results/ff2bc24d0e2620030ffb9a6a48d16bac3754dd16
        i686 |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/50d8f8bc4e37929064d0b2eb4686ee072764800b
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/e1f09f7a8709a3e03ff36df8b9ed18ce09fec4e5
         arm |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/a81ac677e06011b5938717a38fe325d4f4bcc016
        i586 |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/2c045be0d2a4f5ad8cdc080fc3b06d329f098537
        i686 |              lttng-tools-2.9.0 | NOK | http://autobuild.buildroot.net/results/15f74232c51180095298c0d44760b747ee5b47ff
   powerpc64 | make[2]: *** [e_4758cca.o] ... | TIM | http://autobuild.buildroot.net/results/03aa3c7ada88679eb0530b0ec37ee11bbca40b8d
      mipsel |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/ce4df4041a329397663a9db836362f2c0a79484c
     sparc64 |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4d5e6f588cc6d7ed63e20ad3d4d46372ed4d7d3a
      mipsel |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/55ae498b7e926dfd07154649328e2c9e70abf0a7
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/d878beb1e3f60e26a294292b09d6470fdbe73aa5
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/dd4e7546616f2ede8471476affbbd9130b0f1e0b
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/4f61623eb61d3fb50b1b093959c39736cdd4459e
         arm |                       mpd-0.20 | NOK | http://autobuild.buildroot.net/results/6b97403e70caa12c32494b1c82ce61d3e4e456f6
         arm |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/c21f8a4a00f00c45ef266dc9664ff1f7f0e66826
         arm |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/24bef6c059c5efe86906b5eebf0a75d31a4f25b3
         arm |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/5a35f6a8e5b2f464b44bf513b9aefa191510f9c1
     powerpc |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/fd8f0fcb037aa91ce9c86bb052dec5b46df06a38
      mipsel |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/1f864de8e7add966e1a081f96fbb4e3f0d259118
    mips64el |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/a50c45c2310700fc0c39a24bfcc13a01ccf076a1
        m68k |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/25a0e9d7418cefe1506887a86473a47cc81d2994
         arm |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/669a9a64f40fcae7916f1e4a04a3bf2015379123
     powerpc |                       nmon-16f | NOK | http://autobuild.buildroot.net/results/70ce1aa234e321884469d04282f80750bcf9abc8
        bfin |                    open2300-12 | NOK | http://autobuild.buildroot.net/results/7fe0d0a3e7ed0430852dc42b718dd037557207e8
 powerpc64le |                  openocd-0.9.0 | NOK | http://autobuild.buildroot.net/results/d7b1754d1e1d26439cd71bc2e9f1f6858ab142ec
        i586 |                  openssh-7.4p1 | NOK | http://autobuild.buildroot.net/results/acc4e27bb358a40082f3e0944a46fb0736cd7ce2
     powerpc |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/bf298ffbb1c419a197062028510e85c9cec383b4
      xtensa |                openswan-2.6.46 | NOK | http://autobuild.buildroot.net/results/b69c1d5c1010cb2f30929f85d47371730ff7e037
         arm |                    perl-5.24.0 | NOK | http://autobuild.buildroot.net/results/8340542b05f3fdcf8d7a6943c4e61e250bb82817
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/dc6301f862e3cbb165de74c0ac19a2d418e4dea8
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/e7ca91c0d12fe9b382e721c518e12cea24f24cc0
         arm |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/93d2c1af89601769160bde3629c574efa432af3b
         arm |                      qwt-6.1.3 | NOK | http://autobuild.buildroot.net/results/e6068bddcaa14a311f8936c5ca1df950c5e8da30
        m68k |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/fc4710ba8d326e22428536acbdc05919f10d32b3
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/5ba4f0dafba45e03efc3e8c06f354588d0aaea25
      xtensa |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/f05736049492ebf6643a2aa68e0471a5603b8cb2
         arc |         riemann-c-client-1.9.1 | NOK | http://autobuild.buildroot.net/results/c30d523da61fa1959ffbc6939844185f2f8a78f5
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/ccd9775de55ed1c6f62d9a60b0026946d4f62b82
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/fda4250c18517fa898481c134729bc995e3b231e
    mips64el |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/12547d704e64be8073caea7c95362e48a49f3729
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/6f4d0ffc53ec3a346ffe368f3fc4cd2de0a5d849
         arm |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/82bd78ef2c997750ecb8823e7a15ce973b93472e
   powerpc64 |                sdl2_ttf-2.0.14 | NOK | http://autobuild.buildroot.net/results/2fe3f1dc2cfca96c3ca364bdbae095bf2ab639ea
        i586 |                tcpreplay-4.1.2 | NOK | http://autobuild.buildroot.net/results/59a4d955887b3089b4d5f2572350d1a2b51f2ad8
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/5eb4164f855412c1ba730b0bb5bd1138845f7e48
     sparc64 |     xserver_xorg-server-1.19.0 | NOK | http://autobuild.buildroot.net/results/bdefe3dc26454dd845fe5ee3e7609688844c874b

-- 
http://autobuild.buildroot.net
