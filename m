From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 11 Feb 2020 07:17:58 -0000
Subject: [Buildroot] [autobuild.buildroot.net] Daily results for 2020-02-10
Message-ID: <20200211071804.2F6EC852DB@fraxinus.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Autobuild statistics for 2020-02-10
===============================

      branch |  OK | NOK | TIM | TOT |
  2019.02.x  | 13  |  2  |  0  | 15  |
  2019.11.x  | 14  |  9  |  0  | 23  |
    master   | 109 | 94  |  0  | 203 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                   erlang-22.2 | 10
               libglib2-2.62.4 | 9 
                apr-util-1.6.1 | 8 
host-sdbusplus-4212292bcf13... | 5 
                 mesa3d-19.3.3 | 5 
                    parted-3.3 | 5 
                 rocksdb-6.6.4 | 5 
                      bash-5.0 | 3 
              host-grpc-1.25.0 | 3 
        host-gutenprint-5.2.14 | 3 
                oprofile-1.3.0 | 3 
                       unknown | 3 
                    brltty-6.0 | 2 
                 mono-6.8.0.96 | 2 
                 opencv3-3.4.9 | 2 
                php-ssh2-1.1.2 | 2 
                  brotli-1.0.7 | 1 
                  cairo-1.16.0 | 1 
                coreutils-8.31 | 1 
                  gensio-1.4.1 | 1 
                gptfdisk-1.0.4 | 1 
      gst1-plugins-base-1.16.2 | 1 
          gstreamer1-mm-1.10.0 | 1 
           host-doxygen-1.8.17 | 1 
            host-mfgtools-0.02 | 1 
           host-nodejs-12.14.1 | 1 
              jpeg-turbo-2.0.4 | 1 
kvm-unit-tests-kvm-unit-tes... | 1 
                   libnss-3.50 | 1 
               libupnpp-0.17.2 | 1 
               mongodb-r4.0.12 | 1 
                   ogre-1.12.0 | 1 
   openvmtools-10.3.5-10430147 | 1 
                php-amqp-1.9.4 | 1 
                php-yaml-2.0.4 | 1 
        python-alsaaudio-0.8.4 | 1 
                   sdl2-2.0.10 | 1 
                      tio-1.32 | 1 
toolchain-external-codesour... | 1 
                     vlc-3.0.8 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
  powerpc    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/5ef69b24d14268acd2e00f0474ea18b71938cbdb |     
    m68k     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/7fad2fe61456f4104c116047ab83bb20ecb508cb |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/a2e6a5f3123bce98b17a21225c5ac86b1f07c371 |     
   sparc     |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/3b141776167b455beca41feb5de7efa3289517e1 |     
  aarch64    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/31e4c9fb0fe5f5833d9ab5e1c5f249a82a6d9813 |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/8d421993ea9c2c01c9518f6dfd32a9380351804a |     
   xtensa    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/908318d757102e7e38925c4649d3deffb4d04e3d |     
   mipsel    |         apr-util-1.6.1         | NOK | http://autobuild.buildroot.net/results/c3f3c12518bb75eee9204acccd4e281da7a49e70 |     
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/57f86cbdfd07c3bf492083184b26227c5edbb015 | ORPH
microblazeel |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/54a717b98b4fa9a4a501645995d3b3bae354aecb | ORPH
    arm      |            bash-5.0            | NOK | http://autobuild.buildroot.net/results/06d8c9590aaaa6c551b8f164d717ba1352851570 | ORPH
   xtensa    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/4bd2726db4eb679d8ee388c66da513eaaca8d1a6 |     
  powerpc    |           brltty-6.0           | NOK | http://autobuild.buildroot.net/results/644cf1753095f8ec12f2c3640d9e24ee02d930f6 |     
    arm      |          brotli-1.0.7          | NOK | http://autobuild.buildroot.net/results/366bc191b9500edc774883a2f7bf19a9cb8d9d2e |     
    m68k     |          cairo-1.16.0          | NOK | http://autobuild.buildroot.net/results/5a81b571d62c0ac1c0cfea4692d949d68e6dc172 |     
microblazeel |         coreutils-8.31         | NOK | http://autobuild.buildroot.net/results/c80106f5918549838f4ba0e3e016f244268f45e3 | ORPH
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0ae388a88aa4b90f977ce3f498be5f28e7709304 |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/3c8faf90af810bb61b0c8f183f3f0d6d8ea52e69 |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/19d84459f55c0811c06aeebb50bdd28db716ad2f |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/e0cd2acb709494ccff91d821f2f3a6f5681bbbbc |     
    arm      |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/88b2fca67869889fa59f784c64e9e06ba0487caa |     
   x86_64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/ccaae186c31fb0ae628e1e138c584c8c2889217d |     
  powerpc    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/a5ddeca0b6d84dc3fb0a4e95482dd05e9291889d |     
   mipsel    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/462e969b72abfcf7fe0d58774f13ff904f5f1b27 |     
  aarch64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/5a267b81dffd7d188d19363e4fb0c6a1e3a181ae |     
  sparc64    |          erlang-22.2           | NOK | http://autobuild.buildroot.net/results/0b065537540abc839d20c659901a81e254a96377 |     
    arm      |          gensio-1.4.1          | NOK | http://autobuild.buildroot.net/results/7391d7505466a99e75f4a20e44b3d997ecc37b8d |     
    m68k     |         gptfdisk-1.0.4         | NOK | http://autobuild.buildroot.net/results/5286ab9a96473493d3057ba1ca2b8b4ab4d59b14 | ORPH
    sh4      |    gst1-plugins-base-1.16.2    | NOK | http://autobuild.buildroot.net/results/dfaa82289417a041d159db04500689e658ed53b8 |     
  mips64el   |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/857ba0a533ebd8a7b35c83281e484d2ddf746cf3 |     
  mips64el   |      host-doxygen-1.8.17       | NOK | http://autobuild.buildroot.net/results/ccbb816187ab5b9c3dba919df936c8728a9b9f3b |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/05e225d2f5834ce8fc4a8f9f43b6d7f67d5b89c2 |     
   mipsel    |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/5525cff321c9201234f71bb20dfa39fb6b6c812b |     
  mips64el   |        host-grpc-1.25.0        | NOK | http://autobuild.buildroot.net/results/e60c62b1215efc0c3567d810f4593f295e3b8a80 |     
   x86_64    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/6e4821faa0c91c08bf40c089eead2e94061f113d | ORPH
   mipsel    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/62b858a06623753394b503082cc57dc0c21e2fa3 | ORPH
  sparc64    |     host-gutenprint-5.2.14     | NOK | http://autobuild.buildroot.net/results/d2f17ed8d23690ba09d46490bbc05139e0c00e40 | ORPH
    arm      |       host-mfgtools-0.02       | NOK | http://autobuild.buildroot.net/results/ca4498ad21a96ba2a38ca2467dadffdbb516355b |     
  aarch64    |      host-nodejs-12.14.1       | NOK | http://autobuild.buildroot.net/results/58714a019f57d1d36d1c8e28cf3adca82ac5991d |     
   nios2     | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/a8e83bbb02278281e63e38a5ece47093db9f803f |     
    arc      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/889985024307889c56a5f8045e10694537c2b7a4 |     
  mips64el   | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/f3c578d5e268a0e56013a75f6421aeeb1161c8ad |     
    arm      | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/9954597211b32eae8be60aed17243786e0399642 |     
  sparc64    | host-sdbusplus-4212292bcf13... | NOK | http://autobuild.buildroot.net/results/c405020be78d6cf0a80703fdccd88bc2d5d69694 |     
 aarch64_be  |        jpeg-turbo-2.0.4        | NOK | http://autobuild.buildroot.net/results/5b7ce0a8f8d1f485bd7104ac2b40257bb17b284b |     
 powerpc64   | kvm-unit-tests-kvm-unit-tes... | NOK | http://autobuild.buildroot.net/results/b66467ad7c00815c1aeeb7ffe62328e7a236270a |     
   xtensa    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/e287440aaef9226e00724712a7ed5c8c706fb70e |     
  powerpc    |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/07b99049e445638b70ca093ac618459b47c87680 |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/7b3c1678dda0c4f1017f15faebba8a69ed7f016d |     
    m68k     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/3ad02346db4d5dff9521da841bcaf7a55f5de029 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/275a5641d5f1ee5db0254d084b47cce9532b32e5 |     
    i686     |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/4039fcff46ffdbf02f0d17b2b1bde3fdf05375d4 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/274a34e588ee0a9a3a0ee6c7bdd3608e055070d4 |     
    arm      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/2190baf633bfb4b8c0f01628484e752c0c4eabae |     
    sh4      |        libglib2-2.62.4         | NOK | http://autobuild.buildroot.net/results/5c0dd5f392ec8cb92a1241b46fdd6158f8d32936 |     
  powerpc    |          libnss-3.50           | NOK | http://autobuild.buildroot.net/results/425ba828d30c2bd55ce9f4f00e67bc10d9de2867 |     
    arc      |        libupnpp-0.17.2         | NOK | http://autobuild.buildroot.net/results/1552d2a9f95c4f3e8f6798527796cda793bada9f |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/3dcd92963d8d3c68596d11c7db20d63a1e9c8081 |     
 aarch64_be  |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/2fa06dfa77afd222b8c4abd22036ab9e83536c33 |     
    arm      |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/bd45e537472ddfed8b69093ea6149f2f34902dc3 |     
    or1k     |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/be37927a1137d8ee53d25cc83f5c27897295da6e |     
  aarch64    |         mesa3d-19.3.3          | NOK | http://autobuild.buildroot.net/results/e653f774ee78115c3a0e7efd780169b48b4ff4f2 |     
  aarch64    |        mongodb-r4.0.12         | NOK | http://autobuild.buildroot.net/results/aebe81c8ab525d482e332d03a50444eb6fdd9ab7 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/b60fd29bbb4a12167b2b8c54e2ecc1aa78d8a357 |     
  powerpc    |         mono-6.8.0.96          | NOK | http://autobuild.buildroot.net/results/eb5318462085382c7e155bd906a10fc92aed1c38 |     
powerpc64le  |          ogre-1.12.0           | NOK | http://autobuild.buildroot.net/results/8fabf8d270b9257c3a9db6a2f17f1c08ec9428d3 |     
    arc      |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/dc56eb539b4cf4435150d19b7b04b1a3f5770ebc |     
   xtensa    |         opencv3-3.4.9          | NOK | http://autobuild.buildroot.net/results/18a43712dae9f23b03b55a61859e72a659b62850 |     
   x86_64    |  openvmtools-10.3.5-10430147   | NOK | http://autobuild.buildroot.net/results/59e3030bd79c2767c7a02ef7632ed9905a7dec77 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/bd3d02c6649a1596b99fc2b8463a7e36e7387973 |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/8229ff9ea38bbfe7ccfea1fe6281f2e433601fcf |     
    arc      |         oprofile-1.3.0         | NOK | http://autobuild.buildroot.net/results/23e078c831729922be21ba9844d54480cc09826a |     
   xtensa    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/c8ead3b9c8f3d92a88c7d20da0ffb27c6f9a0002 |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/e79ebc1b6ba23b4a537ac300536874dc8f821402 |     
    arm      |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/acef25ca8a9b0884077bb3325ddb58be838cbeca |     
  mips64el   |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/90db3ba178044bf13e15fb50a831ca57bbb56069 |     
  powerpc    |           parted-3.3           | NOK | http://autobuild.buildroot.net/results/95697cfe35b63499c34e39c1feb839c2bdb2d84e |     
   x86_64    |         php-amqp-1.9.4         | NOK | http://autobuild.buildroot.net/results/05ff4292632d81ae6e648ee8f2b0bcebcbe4fe0b |     
   x86_64    |         php-ssh2-1.1.2         | NOK | http://autobuild.buildroot.net/results/84892fc394a481c8047867277fbd8d04892f1373 | ORPH
   xtensa    |         php-ssh2-1.1.2         | NOK | http://autobuild.buildroot.net/results/dddae10015a568782ebbdcd5156caa697a2e8421 | ORPH
    arm      |         php-yaml-2.0.4         | NOK | http://autobuild.buildroot.net/results/bc4ad3a634e6d584bbb06100b0adbd9955673ab3 | ORPH
    arm      |     python-alsaaudio-0.8.4     | NOK | http://autobuild.buildroot.net/results/72de548c989da8a3fe34073b3fb8d5377597ab91 |     
   nios2     |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/3538d7238eec7c94942679ef68effada516edd65 |     
    sh4      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/bb22260f17425e864af05dd8b9ea2c07ed841cf3 |     
    sh4      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/639dc5fc97da8475758274eac548b1d72b6beda2 |     
    arc      |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/b9a56c4cd860bf657441ec9022f9d28ab1a4d643 |     
   xtensa    |         rocksdb-6.6.4          | NOK | http://autobuild.buildroot.net/results/34707d544c37aafc859c14c035d6c0828150f53d |     
    arm      |          sdl2-2.0.10           | NOK | http://autobuild.buildroot.net/results/7f7712c5bd47de4a3fcec1e0d0526fd5a3ecd532 |     
  sparc64    |            tio-1.32            | NOK | http://autobuild.buildroot.net/results/33a398850cae2b1add5304b707e93aee2078abab |     
    arm      | toolchain-external-codesour... | NOK | http://autobuild.buildroot.net/results/005362daa4c4744cd41cd1982c4d5295af0bc0f4 | ORPH
  aarch64    |            unknown             | NOK | http://autobuild.buildroot.net/results/a26f97d3348115407aaac0ac204c1e8a4c6384cd |     
   nios2     |            unknown             | NOK | http://autobuild.buildroot.net/results/69c206b578393c9eef8304825e62046f561ffeaa |     
    mips     |            unknown             | NOK | http://autobuild.buildroot.net/results/09f4ed637c07e62907170168d5450e969c3f44aa |     
 powerpc64   |           vlc-3.0.8            | NOK | http://autobuild.buildroot.net/results/ef2a52e5721e039946abd8070157152f7fbfc401 |     


Results for branch '2019.02.x'
==============================

Classification of failures by reason
------------------------------------

         host-ti-cgt-pru-2.2.1 | 1 
            safeclib-v03032018 | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    arm      |     host-ti-cgt-pru-2.2.1      | NOK | http://autobuild.buildroot.net/results/6e45707f6336fdd3527e40d3296942577f4a28a1 |     
    arm      |       safeclib-v03032018       | NOK | http://autobuild.buildroot.net/results/4772095592b3c3c6570bf90c6976394d39dc9112 |     


Results for branch '2019.11.x'
==============================

Classification of failures by reason
------------------------------------

          gstreamer1-mm-1.10.0 | 1 
                haproxy-2.0.10 | 1 
                   i2pd-2.24.0 | 1 
           libwebsockets-3.2.0 | 1 
                   mimic-1.1.0 | 1 
             openjdk-12.0.2+10 | 1 
              python-pyqt5-5.7 | 1 
               qt5webkit-5.9.1 | 1 
zxing-cpp-0db7f855135222bec... | 1 


Detail of failures
------------------

    arch     |             reason             | OK? |                                       url                                       | orph?
-------------+--------------------------------+-----+---------------------------------------------------------------------------------+-------
    mips     |      gstreamer1-mm-1.10.0      | NOK | http://autobuild.buildroot.net/results/5543a6a29978fd67dab0d66f12011e6461accc74 |     
    m68k     |         haproxy-2.0.10         | NOK | http://autobuild.buildroot.net/results/7407ba1e35fcda77bd831a767baf4df95decd91f |     
   sparc     |          i2pd-2.24.0           | NOK | http://autobuild.buildroot.net/results/051ae4cb8cde68f4557ecbeef41ba01503a0ad13 |     
    arm      |      libwebsockets-3.2.0       | NOK | http://autobuild.buildroot.net/results/d8bd90dfa309b2d50dd02953d3b0f3abffdb2473 |     
  powerpc    |          mimic-1.1.0           | NOK | http://autobuild.buildroot.net/results/82fa7dc54aff353f52f6c16874b1bc6918380d82 |     
  sparc64    |       openjdk-12.0.2+10        | NOK | http://autobuild.buildroot.net/results/3c213e8816df12d031f0326afb3e221db62ee798 |     
   xtensa    |        python-pyqt5-5.7        | NOK | http://autobuild.buildroot.net/results/74017ac4258340d6f167607605a7767e6dac6640 |     
   mipsel    |        qt5webkit-5.9.1         | NOK | http://autobuild.buildroot.net/results/479599196498c3d6cd957d8a0c9f52d229fc45ff |     
  mips64el   | zxing-cpp-0db7f855135222bec... | NOK | http://autobuild.buildroot.net/results/3b95fdfd1dabee153c5504570574a7bc95f89835 |     



-- 
http://autobuild.buildroot.net
