From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  3 Dec 2016 08:30:24 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-12-02
Message-ID: <20161203073024.3586721D20@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-12-02
================================

      successes : 164
       failures : 398
       timeouts : 0  
          TOTAL : 562

Classification of failures by reason
====================================

              host-cmake-3.7.1 | 135
              host-cmake-3.7.0 | 105
                       unknown | 50
        lttng-babeltrace-1.5.0 | 15
     toolchain-external-custom | 14
   host-lttng-babeltrace-1.5.0 | 12
                     efivar-30 | 11
              lsqlite3-0.9.4-2 | 5 
             berkeleydb-5.3.28 | 3 
                  dbus-1.10.14 | 3 
               openldap-2.4.44 | 3 
uclibc-ng-test-4ad1c23ae2eb... | 3 
                    git-2.11.0 | 2 
             gstreamer1-1.10.2 | 2 
             libxmlrpc-1.39.11 | 2 
          linux-headers-4.8.12 | 2 
            lttng-libust-2.9.0 | 2 
             rabbitmq-c-v0.8.0 | 2 
ustream-ssl-ec80adaa1b47f28... | 2 
                aiccu-20070115 | 1 
                benejson-0.9.7 | 1 
                  boost-1.61.0 | 1 
                  bwm-ng-0.6.1 | 1 
                  gauche-0.9.4 | 1 
             host-libsepol-2.5 | 1 
           host-wayland-1.12.0 | 1 
                ipmiutil-2.9.9 | 1 
kmsxx-bd5f6471e619a6ba2987b... | 1 
kvmtool-bed2bd9e1fbef581909... | 1 
libasplib-f7219142e790a329b... | 1 
            libxkbcommon-0.7.0 | 1 
liquid-dsp-1191179b786703b3... | 1 
                 mesa3d-13.0.2 | 1 
              mjpegtools-2.1.0 | 1 
                 mplayer-1.3.0 | 1 
                   ntp-4.2.8p8 | 1 
phidgetwebservice-2.1.8.201... | 1 
                    quota-4.01 | 1 
                     rpm-5.2.0 | 1 
          shairport-sync-2.8.5 | 1 
                   slang-2.3.0 | 1 
                  stunnel-5.36 | 1 
               trousers-0.3.13 | 1 
                     vlc-2.2.4 | 1 


Detail of failures
===================

         arm |                 aiccu-20070115 | NOK | http://autobuild.buildroot.net/results/f3b03787d623476ca80882f46acdde18d23be871
     powerpc |                 benejson-0.9.7 | NOK | http://autobuild.buildroot.net/results/1028c461ea08e015c37da214d16849e66e21bc25
     powerpc |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/f0a96f671644d9f9efcf245b354affdc84f7d7da
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/59967d504071e4cb75edbd264dea1dbbada7bef2
        m68k |              berkeleydb-5.3.28 | NOK | http://autobuild.buildroot.net/results/50c762e68d5882858b8d8d39893b1288cf23e6e8
     powerpc |                   boost-1.61.0 | NOK | http://autobuild.buildroot.net/results/615cd57e8a4f967dd83ea29b4debdde35bfc4bee
      xtensa |                   bwm-ng-0.6.1 | NOK | http://autobuild.buildroot.net/results/6eb96bcbcf315cac74bfe0c8ca535ece95a21f1d
         arm |                   dbus-1.10.14 | NOK | http://autobuild.buildroot.net/results/c946d3a630fd7d365cb2fa3699aa9711e9c93a70
         arm |                   dbus-1.10.14 | NOK | http://autobuild.buildroot.net/results/f9c7d8c1838f0c8657539edb2b48c43a0f122ef5
        i686 |                   dbus-1.10.14 | NOK | http://autobuild.buildroot.net/results/d1209d420ce842a9f400ef62a312541cadf1ef79
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/ca8d6898cd6678123c5c96b76f2e1c87c882237d
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/6112bac7c777fd17a37b76db79d684488083f297
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/7dea4275ad3dadfb78b9ea8e01bcf227cece3afc
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/6922b7e48a48b085ea38d1b71d1b9fbd1d47f93d
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/fb17ee5cf0abf7007f2789dedfb02d24790216d7
         arc |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/c97b35b672e4a866f2dc0b969ac4cdb37f0a0bb9
microblazeel |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/b17cbdd58e943454b7685dc6623f041196b472d7
         arm |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/febcbb8e97a6e072fe7ec44e18421c48d9639383
        bfin |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/d68f27d02f36e7cb50414ffb0ee4053d8fa80fae
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/2af1740ed09ca17b0422ff5225f576ebd915fcb6
        m68k |                      efivar-30 | NOK | http://autobuild.buildroot.net/results/ab2d342cc789cab620efb57d9fe846bcdfa238ab
 powerpc64le |                   gauche-0.9.4 | NOK | http://autobuild.buildroot.net/results/ce3465ab392c1510748202ce8b90dde8b1fe5051
    mips64el |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/0827f8b39f52ad7bdd4f5fcbec1b60b25232aaaa
         sh4 |                     git-2.11.0 | NOK | http://autobuild.buildroot.net/results/4e779266ac13cc73448e1aa7523dc70919ff500e
microblazeel |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/c1cd60d3f44f2938e5f42453d034ea070898f837
      xtensa |              gstreamer1-1.10.2 | NOK | http://autobuild.buildroot.net/results/c3a6662f0acfda179a58cdad9165f36826229826
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/7fcca09840bf3027cf75d901c9c0548a41136bfb
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/bf10bbc42c63091fa1c158145c98c9353e85902c
        m68k |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/152b2cdfaba508f45dabd1b88d69b0fe7787a358
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/cdaf659ba08c982a7f91e8752be28e868f5ef75b
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ff4cb8f7d3d017472b15957638d19f05ae8772ad
     sparc64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/42bdc0a9e7673da12b359216e28f3531c5471937
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/8d16a27c1464b33fe40a3481069549dc93ef3450
     powerpc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/e19f379bafc688e5553ce1aa592bd7e201a765cb
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/45b6657b535f38fa60206d5525d83424414f1f5e
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/9a75670a97f4ffd8dcc0f3b2956e15320247b9e7
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/26a9d4500d9f166f3644778cb615e994913df957
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/e67a3b7712a42ed07f3aaade2c1d8d8110f4328a
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/0371ee04c123c9eebf2e7f8c513f8607fe9c253a
     aarch64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/85658f3e0e1dccc7b5f575102bce54e55f843d93
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/393b4ab75057f50fc1f799a572d9732b31205c31
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/31538c28f5c217ed3427a529395208b407c5c2de
       nios2 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1256f493fa56aae09a3bc29bcdbd7d3f303de006
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ca170f27c6396d52ef646a5b037f2e37afedaf6f
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/3e80a04c8e06f51b593a3980a875ab63d7b68458
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/f1af897bbad43431f8c88c85c9c3193b20456d18
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/a02c074c53302621dca09ec8e2df4a0d91c6ec72
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/8e247e1ec3143c4f8b8a4c33b50f8ed19fcb3aee
 powerpc64le |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/56c93c903b305021fe11a62efa4faba3d6aef803
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/02e2617bcce7729b95f1cefb3972188dbb78bf88
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/70aed72b0aa8cbf459db9dc99eda857967ec26ae
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/fd7979184858bea5ae7401b0c2b445abc72be0c6
        m68k |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/9036f5967f13047911e8e10113a01c984f52a683
     powerpc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/f47bbb263a8ac4bd05246098f9141250d21c01d4
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/15420516707bc5ba92e6e9697e5ed5dbea3927f2
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/bfb9edfec909f58350dcb4f084d8580c6cbdcc40
        bfin |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/afa43aed48eaf0e0b5fc2efda33fc53c75e909a7
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/35fa54136d6cf9eea0e69b73ffc5ec861eaea554
     sparc64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/6b50bfc8ba68023a96b49d98960059dfd0bb49ff
        i586 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/69e0b5582e9eaa050bcaefd749ef77ca8942e830
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/7e051ad3de6020ad17c8f1e7795b6083858917fd
        sh4a |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/c42ddc6272fa6ce4d6f6536e6c1cb0c457b65ab4
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ecde9962aef3568218bd29103af133147f137394
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/a5d2f51911462cb4576515f6875dcc1efb8b19c7
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/bf3b544ceef6d230ba256e5901bc18e613030506
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/f1b4396729b0e9b482c10016fb27d15719aee5d4
     sparc64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1170ba5e66718662e5ec69c3a9448c0c85975788
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/727a3f7c959562da85da30998c1a4a7474ea5827
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/dc76c0ac300d597b778d87e92beb2e6c8aff5372
microblazeel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/18172afdbe13b9e26a5782911660daf8509feac6
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/19687c1ac46ed5951f7b94a4c7d67544f13a812e
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1d82bca307601ab7cb060c876a979dac18340efe
        mips |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/92bcea573fb26dafe28c1f8be7f4040fcbbe766b
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1a5a735598b3c82d2d70bfc65a1ea0dc5e811865
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/840bba11571bafcef903f894baa1a5e22d852bb4
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/77ef1b6980a03c5796df4cc439aeeb1ec020eff6
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/77ce11d345c88f4694ccdd44bce3aebdd26d4636
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ac29dfe97e537be603eaf11c626616399317da97
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1336f269bdb7f975d7e0c007f778736faf82f950
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/fa11a0ebfd0620197bb94aff6899edc8a92aa0be
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/50300a67805c666ad397d515e7b5d16bee081ea6
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/2b7755b8b8bd3cc2b150f709a70cd39311bec24e
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/cf0edaac6928aebcf1d65db1dfbaa13e3c480503
         sh4 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/b47a440374897e62a4f655da0fd65345f84f4b8a
     powerpc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/2b21a763fef2c9bcca58ef3b1f027ff777c03083
     aarch64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ed981ce3310d2e2ec0ba1a892ff8e19f601c588a
 powerpc64le |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/36618e205ef12e17f7dbb57be621d4fcfd1bc170
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/3a00325660e606cd0e74728e78e56678f15bd0c4
        sh4a |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/b18bcc0921dbf7baa3c4f5afa7159171e7773192
   powerpc64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/dac7ca99b9c5ec092c3ed5e8be31dd826f241169
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/98cab5ec62dee8b067af6b97f9448e702e932924
        i586 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/cc8676620543c2ede379b127688dde20588d9b16
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/643e779094148d51331f2b08b7e6d6ca9b5affa9
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ca18932cec94b6234ba5ba4146bc51f2c0f8b47a
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/0b77b5640550acbdc1a61185c28a5b91df08655d
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/008a599e9b3e16c6e33df3739fa6c858129b26b1
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/e4a467250e664337477334face4b745740c0aca7
        m68k |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/1a76b6a31b72df7dd28a489867bee6c4d8a9d9d7
     powerpc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/cfd314ba5e23fd5f207b760dedb85826d6f8e96a
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/77f22050d6f05f21d529fbb04c5902d8ee09fbfa
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/55023c37451c67f007afd046b053da3e86f80422
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/f3aee07c4f0e43bf5fe27d36c789fcc40a09fcb2
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/eecd3b02d1557208cec98db0d45d450ffc279c19
        m68k |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/75236ab8c5d540b7d89120f8edee7ff8dfa5ba4b
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/7e0af5667a6dc79bc8a710f79c96ca585b6d5930
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/32246acf13e58f2aa32ebad571f40e871b8375fa
      xtensa |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/8c966210751faa32163f1c45f3a61060e3f1e5b7
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/0f5b02af663c4587f45696e65d1386210b9ff2fe
       nios2 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/08134b171adeab05ce1106ada10e2b90231d1ae6
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/0ded2542c6dbe2c281103113b8da6ce693295298
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/87566abe112ef62b07976b195363a14ddaa3d874
        m68k |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/444c6fe922c24c8e532cd3ee0618d1b3015df3dd
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/32b5100fa49176cf3edb5f2dd08037a139c4e074
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/5559ef39c1d2832a3af24d91c67b0fb05f529da5
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/2cca44dc675ce3cf743067565712259324f1484a
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/a6d214739a66a95b336815ed3ef8f021048a2292
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/0b0f5207883088289051a42f6bb24610075449e3
         arc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/919012a7730f81fc0db7b1b331decd70c1023a99
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/e7e79280fad3deb4f10c81253a653bfb81286266
        mips |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/8352e7746463a3d3e572986fced9754f59bdb029
        i686 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/bc4e30f9dd04d48785993d13889e88d634e3a378
       nios2 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/54ca1e5ce21eba066597c073fd3d0eb0084e0ddc
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/f323a858f7cea87d3c22d8d1e43ca806a3a4032e
    mips64el |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/85ff34bc0378926034b1c760e8eb8bda2a9ea913
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/2f56af46a16665ae7a55ec9cab4d0f03e11d9a61
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/92463666efc6c640514fd11d7239ffd7abb55380
      x86_64 |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ab76c0718ebdac25729222758dac0df5d8ddbb06
     powerpc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/ddd17a0e90f57b2110748dbf8e98d5bbe6b2cb84
       sparc |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/9480d68e331065b610ca9a734772d2620b9a44ec
         arm |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/853b73027b4fd8b16d28a5a2d4dcf8d4cef92267
      mipsel |               host-cmake-3.7.0 | NOK | http://autobuild.buildroot.net/results/00bc88c71c726e92ad80dc5eb12cd7eb3e3d3655
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0c1de0ae5322ad820619e158024e4a2331ccc52a
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/29077fed74949b79b5a3d2253dea00716461b9c9
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c4ea61102439ad0d527e6f704e9b5a60b4bf442e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b1b5960d29a016f7220980690836a027f4d7c232
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b0d4692e606e983e5fe632a8498f9978f068d6e9
         sh4 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/baa42f8ebbd184724defa48daa7314053606b184
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6d49ed0bcb887587f7e0b1334fe59e2c77bb3103
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8057410177f6fd2f43cacd676f3977dd8f7ca70a
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b22fdd6cd11835056db5718f6073116266714233
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5d322b64bff5119a4f003e02bf9bd91c8ed8df5d
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d2d070b53da407c06f3faab7b079d249dd9928c9
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b9b6d6e82acb35f2632bbadf5ec0df77c21c7e68
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/780c133b7182d9725ab7d6fdd217d6909a9eedd6
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1a31ed4a4080de8fbaf57bdcdc77713fefc99a97
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9983a2baf8792dd6eab4b813d387dc5b0cfb4e3c
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e91a4647d2e01436214e7c8a98ce1e6d4b5e5751
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/02853b93067f8d5e419fc467ebd7960bc8f78abf
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/747369d802010b2ca74fe25aba2e11e82696c0b4
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4c8f59f1d65ce3731d5fb1db488c3c7962abe3bd
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0b4ccc58f27f8837b9d8b3ad99794da25a266c25
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c40e97cd29b8b6d9863d833fa510d0c0289a642e
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b8a6f298698a7f2d4bc91bd810888baa77f99eaf
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7e6d1e63a734823db2d593dfa82555ff2a975ddd
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/eaff039fe7ce4d8fbd9d3b04375bd4eb91c80924
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/be6d1d2f4875bb108a6d89e35b1457aa7e851a08
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f2e8b78f279a11cea2962f1e1be9b01593d8ae40
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e6440d5989df27c0e964931e76635ffde45033ba
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/1c3e3dfb56a7bf998b049df661d6ac3a9b3e9921
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5e8546b543b8ea03d95ce4beca9d7c981f12286a
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e623949bf2c5f31aa878ac4daa75eb6a31bd9b73
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/73b9f3fa97636ab2a35ded0d4974277b7629b4ad
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b6f97738151b5784c7e4c993f54dac5c6ab2b2e0
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c7698bfb728626f5a0a631fac014c17b14e7cdd9
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d49f437ac111b4c2810ab5eb242e3634da756ea4
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d604468a493ae6dbea97754bdb829479c1acab94
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a9e4bbca4e7de96cf8c33b6e1e103c5790420677
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4c2418916cfbba933d6bfd3b2169e169896ae1d5
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b45b016c790a5c0854d1f7681ca71753aa4deb44
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ce9843bcaa822bea0b6e1786ae51091f17652889
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/046490448fe0b37dd0751c607e89511de8978543
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a2ea1eb216f52eb7cfe9434d031ca98fd6486521
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6015265cb61052ed804b2d0b104ffab9b6f9f1a6
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/55c97a3fb4f4a04e0e6b6335d4294e1e057f53c5
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/88ac020c86e4c4c7a0d75c4e14fb4be8543a649a
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/73bd2fa567e8e64963a2116624254579326cc173
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/03c0e3453a89ab0b65add7ffca94613fdaa90de2
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/96a861fd9adb9456a7eb8dd11f3d06cfa7cdfdbc
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/67f2c49f860691713fcb603035e965a163f7f1da
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/57e0cb96928d520b07641b50f4eb19cdfff3c8ae
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5d2256ed5fd4b3a0f99f2396c1e22e6561fbde55
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4b104e9d130298c391f9feb7d457993dfc584578
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4d870d662f08f572e0ed29d17aabb71bafa82ff7
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/db05f6fcc6b089a7b4161ab6406ac155146ba7a2
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e8dc3a35eb5c79e607b90a79a64ce9a219d4276f
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c37d5b520147febcf0c0ae6dea94c82c376a6781
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b4077eb7784df3d59abd715dc70a9482a4b08a49
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/db87d0250d0cabda6f3bd94509f3f69c01556786
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6cb970451add7b276a8a28c83fff6f6d68cfe112
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e3b349d2f362b712e45e03a2428c8a36e915839c
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/e15d8278f969cc81e4456fa38c537ebce5206c48
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/b51aeaf2eb0fcd7a48cc290ed3cebf9df5da2935
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/557af164c9d8b69b3f803e7875ccf3be69d5d134
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/44ae01bb76eed378e6d6c593545fac2eb9052266
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/96096640dbd624671e1b931f9ad409039bebb159
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/530b2b430baddae1b2650532f43f5028524b2df7
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2a4487fecb02f00a706364aadfc342a92dcb50d3
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/153e40715a7efe7713198cb8b16d21571be2f167
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/3fc7e91397f92d39da624aed56b3f0d5423107b9
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a7cb284c836d57f3ea0025a50768aac47bc22019
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/40e757e690a167147be30fc94e5ba82cd9a8eb2b
         sh4 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/30989b6866ac75b1433b0d2e7a80bfc36aae68e9
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/018ed3d7a420f4abffef33642ce80c14ec242056
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cbb32096dfae38e71fe2bc701db7c8b0b919e6a0
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ae12fdf6198496b0c12d7350a6d529705853187f
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/698640453406740284b943b89e17d609bb43b36e
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2b3d4b8fb1dc55c7f835f383d7b0d05897180bf2
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0ca082a2041e3dffd94364f11447ee6f9fc42d0e
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/68b746624094cc28947f4be4fbb6a7f9e6735b4c
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/781659f3cb9aaa3763af875fca38ce914df52885
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9db8fdb98b22edb35315a32853d9e1b6a00e8ad5
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/fb515316ab277d7dad03ffa925bf775c714c0ca5
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/588b4e2113addc54d9c763a7e5f1cb4655e22df6
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8f5a143b47ee93393e3eec97f64427c09b97bd58
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/24ab9b5ec446dc509fcf81583ba0b0d5028e2712
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d1cfc30fb107838545fd17bee2c0f3381cb98e64
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/357cc920c614e2142f9b7f5241ce67d079d2ec36
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ecc60986035912cf2099e0b6b885187ec0177f91
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/c12fa10e617bfc22c93748f4ef71b4e4e1bc22cc
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0a06eaf2cacb504e1c5cb1c6e9a227a02f32f98e
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/3d4252686f2ffcc6cdb1b06c798b405431613535
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a987aec003d4870c603e80589e73d27255413b75
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ad531838ad1ebf4cc22a2f6c7165ff2a5cf4d9c0
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7686ddfcb467c682956fd11c9e53f0a31b2c5952
 powerpc64le |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/0cb1381d9944a125aef212944eed3e41fa17e327
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/3cd786da66a749067dac74447318613fe1a16df1
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/463b117d7e89c9ceb10835a95066bf0b3a455e51
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f9cd35cc8508b0d31488ba4d7139ec54eed0f5dc
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/13c43da0cbf5a4265cad6965154b04880c850c0d
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/29cfb30966f3456f43f7d092b1d8e40a1639f39a
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/55958f7132d7194a941f1882d4153feeb6ef0ee2
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/681c204832ea485a0fd55e93eb1f06fed742cf43
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5f4b6a3069d90a9d862b7e654d39125ae0f196c9
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/707567a578eee1b4c9cb763d48469fc689f5ca97
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d5ae9b0f51f2373b4b9f1e62d20acfe988e97a2f
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9479905e83f6d8c4969925a08eec2e6bcd8a3fec
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/de8604acb29f6bb07d300d930e3da5b6c23f3250
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f9e3ca8aded1d3dfa4430cc3bb313a110800f994
      xtensa |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2af458ed5ee96f88bfbe8b4925be64278154a8bc
     aarch64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/d5e3b713ed83ba97b3b084e9873585bba1e13fc4
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/4330a90febb2cf3eeaa81154f9936d78fe76f9a4
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/031508200354df22690c70bf730722674d287a36
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/351c722ed714fe5a99dc8c1c72b7d175ec66478b
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/899a51be9d5f656bdcb19ee43764d8a0917eaaea
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/07a6b091ce684b0eacd2ef1a69f6fdf43d16f244
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a0cb1cd83b44f2bcb2b5783faa5c443ab8210b83
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/cfd88ba166a3e953cff3ec40f437573baf23b0fb
      x86_64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/6f1d04ae23d80d50f6e00b44b3961d2e5f49f6a4
        i686 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8fa07a42ba867afb2b0162fff99f3ffc302ff1e5
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f608cac4b2265360b28fdc61788b8587e3a9efb1
       sparc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/7c1a80a10213e8641a58dca4eb3746f2dc5e3e6c
        i586 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/07739fa2ee622822e4f9c74aad78757271ab2f67
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/9548e529ed7d8c1c7586505f5bc4c2ba91a46bfa
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/20a4f2f4f236f7538302fa25fa9d1cda00b2a7bf
   powerpc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2933c92281689e0153c06900db96d41fe60e1bb4
       nios2 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/16f9e3a7825f652eb0a8be5ad0ae74e8666a260a
     powerpc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5da1504e87f837c4c4e2696f4f377cefd9d6976e
    mips64el |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/a71408b60b12f0edfcdaebed49d65b215cb612d0
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/337d270386d3b447f762105787641b479d3b9ff9
         arc |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/5358363d8b10636566a14d323e47086181e066e3
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/28f0dbe5886d620e476019e53b87ae791bc61a5f
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/ff6ac0178834444649b876e8878094e13f3fbfd2
microblazeel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/430fa89cc2bd90fbefcfc63b9d4f4843ca6428f2
      mipsel |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/8e716a169ee1a7b5efa845abab013490fdde5264
         arm |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/f2d46856a2e3a4f698a68234ab4354edf4b6a2e5
     sparc64 |               host-cmake-3.7.1 | NOK | http://autobuild.buildroot.net/results/2f4a5b367ab67937b5b4d2df76d1812897d132ce
        i686 |              host-libsepol-2.5 | NOK | http://autobuild.buildroot.net/results/47983cd8f6933e3cf6073492a2914010ba44e1e5
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/6f4e1c6b42bd734d7b8c93e8c5c82b86087c33c8
      mipsel |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/9aeedd745c59913d6e80194c7092f748084acfb3
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/f08414d932b47f72018adbeb6a7411d0c5457e49
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/079e99fb322f746fb595f9744537178cf61a49e3
      x86_64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/22952a56468f6044a26c880da64dd64e8b7d940a
      xtensa |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/9f4284fc6eb617fc9b94ad0d4148e36bf6c50b0a
     powerpc |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/dc71996d8a73dd8db76e5b5eda8d35fbe9536c7f
        i586 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/7d12992904923583255357da6e8fb75abfc16273
      x86_64 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/7680c059c16b8cdb639d7882a81cac9ac858b7e3
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/2e1e9f2ef0d1a8b07c939bf8615d24817bc0a3b6
         arm |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/6156b3327ec7320dd5294c5b8067b83ff319454d
       nios2 |    host-lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/be71ad9feb2bd35efd8d71d03555fda5c322c44d
       sparc |            host-wayland-1.12.0 | NOK | http://autobuild.buildroot.net/results/d08dead9c1bccd35b496fbc284490d806685d896
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/114b8a914db3642151aeffd0f24f1e29b160f100
        m68k | kmsxx-bd5f6471e619a6ba2987b... | NOK | http://autobuild.buildroot.net/results/03060d72e3c0ca2999fb2dc51e7f28904db04517
         arm | kvmtool-bed2bd9e1fbef581909... | NOK | http://autobuild.buildroot.net/results/fba56c984c910fe5dd4a4361d8d954207d24b4d1
        m68k | libasplib-f7219142e790a329b... | NOK | http://autobuild.buildroot.net/results/d48d08251152c73c44002d257d8be448e2cf1b16
         arm |             libxkbcommon-0.7.0 | NOK | http://autobuild.buildroot.net/results/cbaf7f6b3776ba91a261eec79a919a53ca979a8b
         arc |              libxmlrpc-1.39.11 | NOK | http://autobuild.buildroot.net/results/6a9dc050d1b7ed44cfbd43f0d50a5e2488c0cc49
         arm |              libxmlrpc-1.39.11 | NOK | http://autobuild.buildroot.net/results/01701544fbcabd9b7331867b6445ed3cc21cca2f
         arm |           linux-headers-4.8.12 | NOK | http://autobuild.buildroot.net/results/253ffff4b3b9447aa5a2fe9710403c57cdc66036
         arc |           linux-headers-4.8.12 | NOK | http://autobuild.buildroot.net/results/8bea3f1541cb44a71cb3b922cd74c962bfc2c855
 powerpc64le | liquid-dsp-1191179b786703b3... | NOK | http://autobuild.buildroot.net/results/45c4651a833e4667d4ef68e619cf4b5749a288da
     powerpc |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/5585ccb6f8f8c718163fd32465f3b8a6a578253a
         arm |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/9c8973271591dbcd4e7ba397961cd8209cf4d2f6
         arm |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/a559228532cbab8b291bd253f7b0fcbabdf29200
      xtensa |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/e13ac7f558ffe4c506011b2a4dce97a3e143d4da
      x86_64 |               lsqlite3-0.9.4-2 | NOK | http://autobuild.buildroot.net/results/298ecbbad546961241f1e68563329d86927a616c
     aarch64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/a303ee94c7cca80b6a11b5f52e480576e1c47944
         arc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/1685f776e1b7dc4c61e29080ad512abda780eb37
         arc |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/273d3714bf8ff2525d8fcb1c6a9db0b1053d2e78
       nios2 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/936fac857c07631b1600c4754403d9dd8e5ee67b
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/aa9b91759677d063971e4edfd8e09f9f38d35544
        i586 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/3bc04bca6ff2498dfa6021b667ad53317475a96e
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/91b6db6ae81acb82ebb921a4d592c88037d0782d
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/9d5d99f8fbda47cd915431c938daa3e5604913b9
     sparc64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/40fc9dc43821ab94abb812239414f9132738663b
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/c3095dc9984761f09c1311f2231f778a7aa080fd
      x86_64 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/df37bda85b37acc8bf9c726f2ab0dac1195990d0
    mips64el |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/f70c0bda21b5c95654627da092cd2e9e29596a7c
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/2108d556bdfee1bf2639a06a65b929a5674403ab
         arm |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/62f5c88ae3248d292fbe0c21f21c0083931d2b44
        i686 |         lttng-babeltrace-1.5.0 | NOK | http://autobuild.buildroot.net/results/cae64ea4befebdc2325d4ef3e9f09bb4467ea791
     powerpc |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/878aeeda5144ea8c304662b3749264a207f99d06
     powerpc |             lttng-libust-2.9.0 | NOK | http://autobuild.buildroot.net/results/8cf4558a09bcfe7c1e4cf068bccfbf6331a2174e
         arm |                  mesa3d-13.0.2 | NOK | http://autobuild.buildroot.net/results/6a9369325cba8ece17c2ff471d47fb8db0887e6e
         arm |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/d460d7755891facfce695f8e1c1f5bfb3024c98f
        i586 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/6a9685d61cd45eb826265afb24d7d65d2f0f7e57
     powerpc |                    ntp-4.2.8p8 | NOK | http://autobuild.buildroot.net/results/a99b40e12582cf82dcf0326b76c883c6aed6ecd0
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/9a46cb5372b04e6147b3ea19ea0f3455073d648e
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/ea60273386916790cd5bd7bde180e348e6c49fa4
 powerpc64le |                openldap-2.4.44 | NOK | http://autobuild.buildroot.net/results/b44daa53b7d839a11fdcf2b6ce53bceb9c30037b
 powerpc64le | phidgetwebservice-2.1.8.201... | NOK | http://autobuild.buildroot.net/results/98d249724354e6d6e26177d65284fb98e1ef24aa
        m68k |                     quota-4.01 | NOK | http://autobuild.buildroot.net/results/dd19d7a261a02d5aadc8da66615427d65f365d26
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/c326571389a5ff80bdad0de20bed1146531695ea
         arm |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/29723331b27ba3687eb18ebf7fea2a4fe68ca047
      x86_64 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/b995c3c5486b8544832d45fb0bc7dfd4e23e5c04
     powerpc |           shairport-sync-2.8.5 | NOK | http://autobuild.buildroot.net/results/1f90a24b35301339626fff84f160f05bc8a5f8e4
         sh4 |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/c3614ab6ec275807facd3dca35cc1816a5b6d960
         arm |                   stunnel-5.36 | NOK | http://autobuild.buildroot.net/results/1160ae9916a003aa8c0f71b5632fb1e070d9f5b6
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/0c575032d363409178524c064785bc2700677f3b
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/bb3ab8c4a948861037e7988061976249b1d7ecb9
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/e87001edf2245cd90693d84862119f09835e013e
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/badd1d2cfc4af22c3c158c7577fb3b02dd036111
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/d65b924af08d15e80adad9012d13c9c03adfbe46
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/8ead10ce559b15c97bd929e7fe95242d9d314d4e
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/32ae15c646a3027d81cfee2857f991ae0ba32a10
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/8a152187879c474651feaa6652c1f92358084d7a
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/1385b2e58200943193d7e1bfb9c1cdd64f3c8623
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/a9df39b5590bf9056f9c4f77a618dc7337cef79f
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/0cfec65e179a11c45f8b5c7fe7a8ff703568b711
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/b80c777940344d674c9692cef5da05083a4295fc
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/15195bcb6e28f3235a454809401424c42f7d8325
        bfin |      toolchain-external-custom | NOK | http://autobuild.buildroot.net/results/d7318bcc2d4acb857218236a7a05e03e7a76da43
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/eb9b6211647fe146136e69eb588cbd85ce47a019
        m68k | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/29d791f84d29883ee04af712b680c749013d7c7f
        m68k | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/956b740c75ddfc1334699540e8eab01c31d3102c
         arm | uclibc-ng-test-4ad1c23ae2eb... | NOK | http://autobuild.buildroot.net/results/ad30db0754a7b1a6d72939f6e6e5dd578dc84d82
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/071b219c19385971fa1cc0e310cf49dfeca35442
         sh4 |                        unknown | NOK | http://autobuild.buildroot.net/results/e7a79a00914e2a797e0ef5b69c126bec0c3ec28a
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/c3dd4e646bbe00546fa8ce5c5fa3b575528f6765
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/bf264087df7ce39524885689179011b8432423c8
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/1ff058e2b165360146ab74795d0c358b710fe94b
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/10d41046548b0b341d02e27ac6ddad0e5525651f
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/decf551ed09e6cded35293d36ac2da006203b6d4
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/4ed7198e7959b211c5250c9bbf73e72ba884d40d
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/68f06926865e82b8944a694aafe6e252cea19698
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/3b6aa99266ceeefa70d4543267c17c7aa2ef235c
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/cc17a13923b769d436cc578f277df4826a7db21c
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/351aa54c74780a057cd37f98a9f7a1e23f488f1f
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/f6ef41d07142c8c731304e3ff89bad6fb609b03a
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/1e0caebbd6d054f4d8a56401b960cf1f5b97e260
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/2fa07c0eacf89ca68c1536f0df4153dde66334b3
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/5b5306a09624eb013d3ad211dd7a1c8384032867
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/7392b81aa66c32f6bb91481ef27664868f6c0baf
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/d57800992ebc86d4c854de944f8d414bce4715c6
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/5d561409f68e7d9dbd064170f32b74db23e670ed
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/5150f85cd2f8a4b1690ffca21ccac9a4c7f8ba18
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/a9197a14eea9193984b4a5c2017987c355134d7f
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/dfed48be00feec04417f8b3ac2aa44c15cbe5673
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/0ff80d6b311c494bb1b89fd6cd31509a6e82f4e3
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/9d11d24364ad2f50694eafcb25e75c1153f74b92
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/fc99ff4d2465ec3dda1a7698cc5a39b48ce672ac
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/da40d9f61c55049cf3a5f0a39af46e26910f1fb1
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/f42b4570cba9c75c9eda8d144e89fb875465d96c
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ef371acd6bb04c4acb474c0fe5b5303578d242ef
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/218b012fc9226f53fe97d870b143737eafdffd66
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/edce40f19e2768659e617c879b8065b0bac3e50a
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/ea301789f085b30f750245bf5ed2f224374b20e4
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/b37324ca65d20502a8448e0c1be7155a4e600f5e
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/584f639713fce6f270c82e6617c1cff7a95ffe50
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/2261b5a420e050306e8eb8a8857981091b21a485
 powerpc64le |                        unknown | NOK | http://autobuild.buildroot.net/results/7df739e4b8bc0e0206c27c93a0348a5431c6c0d4
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/765d4596a47b906486e7eb41194e6d00c6851663
        m68k |                        unknown | NOK | http://autobuild.buildroot.net/results/99833752c895a5130e188ee454f7f4e96e1ad470
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bb2d5e2dcaeeda564b09d5f7b38addd191737a3f
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/ad56c7fb887113b9d753364d389880ac26a1d096
      mipsel |                        unknown | NOK | http://autobuild.buildroot.net/results/ae6a731de67b576243a81de16bdab61b0f1beb4d
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/ca80b14fdb2c8ea69778b8b1a0b77708db471e97
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/499e3f98c5d769a3a1de2e63703c16e416c2957c
     aarch64 |                        unknown | NOK | http://autobuild.buildroot.net/results/765802df1c6753250ecfe75e47f56f2e4c33e05d
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/589c865c0b5733baf1b5c16245cacbe40c6c866c
        i586 |                        unknown | NOK | http://autobuild.buildroot.net/results/7ac107bc680915c8034a2dbc412e1fb569bb2be1
      x86_64 |                        unknown | NOK | http://autobuild.buildroot.net/results/f38b5633b3e6c594dbcc7963ca88422c3683353c
    mips64el |                        unknown | NOK | http://autobuild.buildroot.net/results/f30635e5fc72f722f720cb049ce44f3a21da92bc
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/bd81d875c2de4145b9d525969959d746f8d06901
     powerpc |                        unknown | NOK | http://autobuild.buildroot.net/results/64e0f2f8cb7f1713a460f0fccf1f63202d59af32
microblazeel |                        unknown | NOK | http://autobuild.buildroot.net/results/b2276db8f4d62434a3b5d41036986ee18b9aa220
      x86_64 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/27b35d03b576392955e21498ac1e62590ef5f5db
        i686 | ustream-ssl-ec80adaa1b47f28... | NOK | http://autobuild.buildroot.net/results/8f774b1caa49eafa76291b84b69a12193a2a3b9d
microblazeel |                      vlc-2.2.4 | NOK | http://autobuild.buildroot.net/results/d7354ff8257ace7b7f7d440fbd50de1fb7df8308

-- 
http://autobuild.buildroot.net
