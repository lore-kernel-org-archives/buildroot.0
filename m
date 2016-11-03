From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu,  3 Nov 2016 08:38:22 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-11-02
Message-ID: <20161103073822.4751E106F87@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-11-02
================================

      successes : 239
       failures : 60 
       timeouts : 3  
          TOTAL : 302

Classification of failures by reason
====================================

      docker-containerd-v0.2.4 | 4 
kvm-unit-tests-5731572b2ac2... | 4 
                    owfs-3.1p1 | 4 
                 jack2-v1.9.10 | 3 
                    mpv-0.20.0 | 3 
                    cups-2.1.4 | 2 
libasplib-f7219142e790a329b... | 2 
                libmpeg2-0.5.1 | 2 
make[1]: *** [libavfilter/s... | 2 
                    mpfr-3.1.5 | 2 
net-tools-3f170bff115303e92... | 2 
                privoxy-3.0.26 | 2 
                  stunnel-5.36 | 2 
tvheadend-50a370707aedf5c12... | 2 
                alsa-lib-1.1.2 | 1 
             berkeleydb-5.3.28 | 1 
                  cppcms-1.0.5 | 1 
               domoticz-3.5834 | 1 
                    ffmpeg-3.2 | 1 
                     gpsd-3.16 | 1 
                  guile-2.0.13 | 1 
                ipmiutil-2.9.9 | 1 
               libcap-ng-0.7.8 | 1 
                libcurl-7.51.0 | 1 
               libepoxy-v1.3.1 | 1 
                    libiio-0.7 | 1 
make[1]: *** wait: No child... | 1 
                 midori-0.5.11 | 1 
                  openjpeg-2.1 | 1 
                   patch-2.7.5 | 1 
               polarssl-1.2.19 | 1 
              ptpd2-ptpd-2.3.1 | 1 
python-libconfig-b271c3d9da... | 1 
                 qt5base-5.6.2 | 1 
             qt5location-5.6.2 | 1 
          sane-backends-1.0.25 | 1 
                   ser2net-3.0 | 1 
                  tremor-19427 | 1 
               trousers-0.3.13 | 1 
x264-72d53ab2ac7af24597a824... | 1 
                      x265-2.1 | 1 


Detail of failures
===================

 powerpc64le |                 alsa-lib-1.1.2 | NOK | http://autobuild.buildroot.net/results/7682e6d0dee24a010f8dd41712a882588033c6db
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/58efae1a0ff5c9c89f7c9865a6cfcbe25276cb53
      x86_64 |                   cppcms-1.0.5 | NOK | http://autobuild.buildroot.net/results/420f3e741bdc7c7ccf4fc619788dfc0c0a4aef28
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/74f66fa239f6c6c782cd8e77e00d6da02d21c636
        i586 |                     cups-2.1.4 | NOK | http://autobuild.buildroot.net/results/7bb345f848948a214e93ba00c7587305ab163b4c
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/378cb1aa7b83cf0c034def52cdeef184984fe012
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/a8b72b7846a3a909bdd49632467f0266ef58aaf5
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/97b75dea66160044c7b89666359f21714dd1b4a8
   powerpc64 |       docker-containerd-v0.2.4 | NOK | http://autobuild.buildroot.net/results/2550f510fb30462069a8d629c38d860bd9e5a4f7
        sh4a |                domoticz-3.5834 | NOK | http://autobuild.buildroot.net/results/60b6b8c58f05e4c6832a03a68cd8f0f529ddbbb8
         arm |                     ffmpeg-3.2 | NOK | http://autobuild.buildroot.net/results/46807776380ecb8f31c3816e0ec248b952ce5400
         arc |                      gpsd-3.16 | NOK | http://autobuild.buildroot.net/results/63d06c071c2038ab72492689ca8f031cd68bc233
         arm |                   guile-2.0.13 | NOK | http://autobuild.buildroot.net/results/baeb69104d0770e6eeb34dd3d088fffce81c8a02
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/803798e7df4ee5a45a103aa16125ede702a8e61e
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/01893144e2dca18dc24245ec628d164c51cb7dcc
         arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/636c79159b5e99f41586cecbd344deee1580874f
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/b15c0ac5c805e3fd10e4aaa5a7489984a1df8a21
        i586 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/d7d0a203ea2477e1805327c73ceb486be8fe0aa4
        i686 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/c95d9c63c72f68057fdb2c5abcb0b452e9fc7f01
         arm | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/f7fe2ccd8e199444628991433c25fc9208ce4d3a
   powerpc64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/2a081c4dc9a4a28ff7deed2e7c53dc8a29a89ac1
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/e2d85064d2da098c1aa1920a3fd163a8e60199f3
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/39f60e5cfd432d78b9a34ab05b4bb127b910c49f
         arc |                libcap-ng-0.7.8 | NOK | http://autobuild.buildroot.net/results/4eb670af5a372819ea90f562a2ce6017232b63dd
     powerpc |                 libcurl-7.51.0 | NOK | http://autobuild.buildroot.net/results/18a24a523a1e16faaa9bf368d2b31a34572cdfaa
     aarch64 |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/891899ca2f356861f8dc6edb94946a4f6d034374
         arm |                     libiio-0.7 | NOK | http://autobuild.buildroot.net/results/ebafec7063c30336bd46528ab91dc2f512db4f53
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/d163c35a5d6eaac52c004efc56aeda5b1f9ee252
         arm |                 libmpeg2-0.5.1 | NOK | http://autobuild.buildroot.net/results/e51f91f4862547e03d9040663d0a9b7a9df8bbd9
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/51c9773213f42a394ac4af75b4b05fdb365f628c
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/21dcf0fb7b6c32185e24c78b85dcacf1509404ac
microblazeel | make[1]: *** [libavfilter/s... | TIM | http://autobuild.buildroot.net/results/815cd5f06317c5c6eee1dad31862ff702c86df6f
      mipsel |                  midori-0.5.11 | NOK | http://autobuild.buildroot.net/results/3f44557090bc80d5e8f905eac4d5ccbed4e47752
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/69c8822f4cb2567188599628d0d664239df82a35
         arc |                     mpfr-3.1.5 | NOK | http://autobuild.buildroot.net/results/41b1aee3a0fdd32abd16f9360f205fceb17079b5
   powerpc64 |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/77f00633b0b25f001cd4ca54ed3a12aee301c287
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/f452d0f1c6d2298aa3b610865de612a7523e2845
        m68k |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/6713fc32161456d98f2b88c60756e85d3cb6df93
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/dce499da84b2a41bab946d5109a283ccb85c8b81
      mipsel | net-tools-3f170bff115303e92... | NOK | http://autobuild.buildroot.net/results/2658c04f65e9160a091a74f2a85669b2a769713a
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/82e13d6ceeced3c5708e074edbdac774e20df990
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/d014f0d9b979327d5a2ed025538d9436b80bd15d
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/267813ee1f5e837aa0b12211e059a8564fbaa6b3
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/ee765abc3f1da06f81bf64d7ecc55ad3c77a1fee
      xtensa |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/2f8d2dbae6e286c686b2ffd28999d346ad0d7b23
         arc |                    patch-2.7.5 | NOK | http://autobuild.buildroot.net/results/362a02a55512e668e4ef2ae5a56d862d6bf03a7a
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/152b05eef8fc336cfd14b7aa065bebfae311069b
         arc |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/246f9f524c2379b8c5cbacf9de88c9f5b33f63f5
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/7cd1df89dbf5be186a6445fc0dd1f8e8c6751cac
        bfin |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/4591d730c84ec3a8b8b64ddd57a4d306eed81161
        i586 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/600eb409540069a2314e1ec2b76521ad66d4c08e
     powerpc |                  qt5base-5.6.2 | NOK | http://autobuild.buildroot.net/results/5f21bfec760c2b30631afb47caab2e1c50660585
     powerpc |              qt5location-5.6.2 | NOK | http://autobuild.buildroot.net/results/03862755902a97469af34e077abef5caf7b8d00f
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/db4fdf5ef77c0db50ecdf862edb52839b59b9d5d
         arm |                    ser2net-3.0 | NOK | http://autobuild.buildroot.net/results/20e28a34cf570cd1a0988a0e99711945711a360c
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/8ddee992601c1a503abc7542f0a30ddaf8b72115
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/08575f681449331e4166a79b0e416d96ee32397e
         arm |                   tremor-19427 | NOK | http://autobuild.buildroot.net/results/2a687853cf0bc832fef29f88de0d85bd495fe87d
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/b20dbfc68b97c7dd3fdd7a13f3978ec39cd33533
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/474a6c75b4fbbc2ae06d82aac851d794f793e206
      x86_64 | tvheadend-50a370707aedf5c12... | NOK | http://autobuild.buildroot.net/results/fc7cb3481d736c4993e3844c1c6a95c43b7ebe23
        bfin | x264-72d53ab2ac7af24597a824... | NOK | http://autobuild.buildroot.net/results/26fd6d3224fe303ef269f8f34f540c176ff62545
         arm |                       x265-2.1 | NOK | http://autobuild.buildroot.net/results/7be4ec28d3d712b7f30f4b1a8f25b9f35d3db33d

-- 
http://autobuild.buildroot.net
