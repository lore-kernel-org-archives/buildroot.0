From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 26 Apr 2016 08:30:23 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-04-25
Message-ID: <20160426063023.1AFC210271F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-04-25
===============================

        success : 212
       failures : 144
       timeouts : 2  
          TOTAL : 358

Classification of failures by reason
====================================

                busybox-1.24.2 | 86
                 jsoncpp-1.7.2 | 7 
                blktrace-1.1.0 | 5 
           host-cryptopp-5.6.3 | 4 
                flannel-v0.5.5 | 3 
glmark2-499aa81a68fb4c8aac1... | 2 
               ipmitool-1.8.16 | 2 
                  connman-1.32 | 2 
                  ffmpeg-2.8.6 | 2 
              gnuradio-3.7.9.1 | 2 
                 host-go-1.5.3 | 2 
make[1]: *** wait: No child... | 2 
                    owfs-3.1p1 | 1 
                 libgee-0.18.0 | 1 
                    cups-2.1.2 | 1 
                   systemd-229 | 1 
                    ruby-2.3.0 | 1 
                   nginx-1.8.1 | 1 
             spidev_test-v3.15 | 1 
               valgrind-3.11.0 | 1 
                 mesa3d-11.2.1 | 1 
        lttng-babeltrace-1.2.4 | 1 
                 opencv3-3.1.0 | 1 
                     rpm-5.2.0 | 1 
gmrender-resurrect-aa3d02cf... | 1 
                 raptor-2.0.15 | 1 
                 igmpproxy-0.1 | 1 
               iptraf-ng-1.1.4 | 1 
          sane-backends-1.0.25 | 1 
                 jack2-v1.9.10 | 1 
             stress-ng-0.04.16 | 1 
                   erlang-18.3 | 1 
                   tinc-1.0.24 | 1 
                libinput-1.2.4 | 1 
             ipsec-tools-0.8.2 | 1 
      ca-certificates-20160104 | 1 
       gadgetfs-test-undefined | 1 
                  cairo-1.14.6 | 1 
                     vlc-2.2.2 | 1 

Detail of failures
===================

     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/216687d0f344d52467cbd1c0b16b896426b1759e/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/076d17aaf0e02b974a8f1b8c8a09ecae978aaaf7/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/54f588fa57fe88f728c157adea473bb59171f935/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/d65946e82a7f528674c6394dd87aef234809b9cc/
     powerpc |                 blktrace-1.1.0 | NOK | http://autobuild.buildroot.net/results/7d406d066114e8ddcb7d4cd4d0aac34ecbb31de6/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/6458c73fe79ace8ba546df2f16ef8447a8c0eed4/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/cf09047d6ee0ad616bc0e4ae4fc23f3e4c3da735/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/8edef84f168267ffca25588c57b1902b65c981d3/
      xtensa |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/d3668ed1f849268c27b15f9502f84837db8279e1/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/70ae798142c2acfc98652cbbb8d06c7c8574df5f/
      xtensa |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/8709df24ac6de0a579ac7a4824b031cd76e319f8/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/6cd1cb526ddd2afa76632c97c1fa4dbc77c042a3/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/f0b960e139813f44f110204b47102a84349c73c3/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/b48c0e8eed2c977c02bebaf80525adad04e3ee74/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/c640e4d23f1a376603c2d1bf0735f249de20723b/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/dab8d4abec7fd0dd6216306f5506a148127e1d62/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/ecb373e1035dfc36125b0f3140a6fa900cdd089b/
        bfin |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/852598a21ec0353c5156bcab0b38b48ca593700b/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/0e2303eb50192b26424581adc131a120bc077fe5/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/18bc35bf4dcd076ec263eb543d6f473a5c5fd314/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/bd4ce81f3b55d5345260bb9a741030942be394d9/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/3d8d9f6ef084d902ccd776e95204ef6b429397fc/
       nios2 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/fc8e58d947b42a323b7d55b34e9482100a118b5b/
        mips |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/0514cd094891f6d32db199e3c58e37add1462212/
       sparc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/f26e86117c6e665b0ab6a12fc415064206dc3d99/
        bfin |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5c1442f127c51267320440bf7ba684a29f8f615e/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/8e3d179dcf4a9a8d93547b2d9af5c10bd0eaf6d8/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5c4094b666b700c37f5db88887ca5cb2a728e1b1/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/dbf6eaf810587204208fc85310956eec5225f73d/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/0a85d199928f8a2233a9cbe547bfce0cc8f61a53/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/fe8b31e5193c936bca3fd0cfab4d11da7d59ca3a/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/ac579648b6780935e42869c9162d8e3dab376331/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/1accacf6335a9914732dd742dc72ec3d01b8802d/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/9df4984ac834986c4c584d626b279647d80ebed2/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/f8fc42693197b67ed5a9fd5cf4ecdf5814066970/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/9660120fe4a70f439f638dfbb09f621f498db792/
        mips |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/05211eb4eaad33c3b742a952654e9d2813cf560c/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/3eccad0c87bb78c8a15303f85f4f53d662248afb/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/2dd5548fa0f810e69155761656040588ab7aad96/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/fb3ec71b6aab503831a0bca066a01ff63ba6a156/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/e76bd56daf1763807a4bb8d7dbf8778cd7efc6a8/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/3ada91e1e0b236ffe0d254dc3031ee73fe22b744/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/8e966bbe04281658419cb2382d5606a74e143f69/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/1f563295b6bf41512767c432899d65592e9d0603/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/51447269c881eebbd00dd288e8600137dd010347/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/d455129af5a8b943c98f250fa8a20add7d0b7bfe/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/48481bb3531927be35cda3df57d02f02cec709aa/
     aarch64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5307b60e21da31e8df029b0e9f43f67b21363dff/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/2c52b855029f06d9623874bd63fc81489023ea9c/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5d74389c68e7be9be2edff07cc82f9d3ab8dc083/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/222483158b9cc5d9999affac0c1742d2969066fa/
         arc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/ed88aeb5e43013e8f8677f213db466d987a58ca1/
        sh4a |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/691258ccdde047ea06ab8f0013dc0fdfd02632ba/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5cfbe2d99f95f466f2f851b4ef90433cafd57d5c/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/144128023ffa02c864474a16b1f2c05a7ce93c6f/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5d548c2456252552d8aa71b48bb94d4f83e1321c/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/1607b459c66acaab527bcb5af4ee85ef12c739ed/
        bfin |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/443db307dcbf9797a8a2c275c8037ddf68ec61af/
      xtensa |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/2a2a1c01bd5416771d574f82607fb30d5cd00ddb/
       nios2 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/4e5a1f35db999f7ccbae558d7cf59630d676cc06/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/0c7f2fdfb76e07772232e5f88cf2cf419de0b7bf/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/866c420b3f9180152ad2d387da2d3cf90d48e695/
microblazeel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/8a604b253c735db01b53072ab43c0a5f73c9bf21/
         arc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/435d84aa72d0c68427f570c16eb443eb9e8d8149/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/56ea0fe4a02f350e4905b601b84071a161fd68c7/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/4abb07efc3a13d8f4714c95b79a8d092cd6a8c83/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/7ef8214a665805b08e86f77dbc4a68d8f596fb52/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/ce6be188d2c9c25d90cbd0009566cb92d81515ed/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/76b977ffa21672daa928197063e20aa5fa9b58be/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/4a84456406311ad7b0cf8a80684a1ae9054f3077/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/1d157662c932a49ffea00df549f61af68a38b523/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/e2493acd9b7822fa8ebb5764e253f01de8919fe4/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5b9ac3d285b69a75746c7899d3a17f50d661df1c/
    mips64el |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/a417d6c9a507f469bb3fa9410524c375855a3683/
        i686 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/31bac65fcfbedad79ce8b47b42ff83d22ad03193/
         arc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/2482580f755ec4824eb135f65ee461bb7a258bcc/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/2e0c7a1ef7bf392b28af9dc5cb47695b437f369e/
      mipsel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/89054e8b37b6dd5c64fc2a5bd8540da8ac44cf72/
         arm |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/116e19cf8704862af79bbae6c10a5fbe026721e3/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/20d1a18ffa39adcbcee33e618f842fab5e335848/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/caee7dfe49ab562d026ac10c82030a7138a14764/
     powerpc |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/82a40a6110ffc579b7aa10b7ed6f797ed778582c/
microblazeel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/a9059deab455103d83ddd23f56a43962c057040d/
       nios2 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/a1e0f20fcf9991a1a9db05eba1cb85789c0015b4/
microblazeel |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/9f3ceba4ef040e34b4c0512ac2feb193dd07698f/
        mips |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/325304a7722c22e1ab53c6a4f371c8c49b2b8e83/
       nios2 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/79f91e8c2fa68a4b6a4078572ae80372e644d364/
      x86_64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/e23680963c7cd64df672445674a14dfa314b1236/
     sparc64 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/5434cc2add70d3df18a398e016cabea5e9db4603/
        bfin |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/67e580616f84a743a941f1ecb598831cc0a167dd/
         sh4 |                 busybox-1.24.2 | NOK | http://autobuild.buildroot.net/results/e5a65432ab350a07f34e4e68659b27d67f5eeda0/
       nios2 |       ca-certificates-20160104 | NOK | http://autobuild.buildroot.net/results/6462b8f57171b286635a12e6c53a62fa6715e780/
         arm |                   cairo-1.14.6 | NOK | http://autobuild.buildroot.net/results/3cf15cf985bd1324a77fae630202f637100c7686/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/860491085feda34f4ee5fa5c7659750acf0c7902/
         arm |                   connman-1.32 | NOK | http://autobuild.buildroot.net/results/9cef7e38c422f9b6df3366f0b790220f5ddf3466/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/dcb4758ffeafa796caa773522b368fd96e438f46/
     aarch64 |                    erlang-18.3 | NOK | http://autobuild.buildroot.net/results/f58097277816af12e5ca0f39d9432861f63450a3/
       nios2 |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/89ca3bf6ebf23f7be1280cc5a5fe740dbf635819/
    mips64el |                   ffmpeg-2.8.6 | NOK | http://autobuild.buildroot.net/results/01dc9d1eaba5e8229bfeb730ff2a3ddf2af32ddb/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/315a1dc2440e1d81ee21174dead46e83685c3fba/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/ac32397013a189b6f3498ceebe4b54e4372f8767/
      x86_64 |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/938c8856d2d23140284acf5e9f8f197c4fe7214a/
     powerpc |        gadgetfs-test-undefined | NOK | http://autobuild.buildroot.net/results/6fd97997c6050ea4204f65377f9da1a55a4a8ae2/
      x86_64 | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/46146a63f83e318f1213ec1d558558e3404d8ff8/
         arm | glmark2-499aa81a68fb4c8aac1... | NOK | http://autobuild.buildroot.net/results/8fefe1a128ba1a8c920b704f99d0ce4626e068f0/
         arm | gmrender-resurrect-aa3d02cf... | NOK | http://autobuild.buildroot.net/results/f9a1cec7a19598fc039344c950ff367035c056f5/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/7e320eef221aae802ea2d2fff5b0671e5d910043/
      x86_64 |               gnuradio-3.7.9.1 | NOK | http://autobuild.buildroot.net/results/f87212072cbcade311ebdc6330347186254a111f/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/037026e0731c309fe55879caa0d8644a1f0ede20/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/77461fd3dbde6f7a93bd3c461e52bff95b5bea88/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/2ff3eb9a96aa67cdab4cffb48e687b74a3433563/
         arm |            host-cryptopp-5.6.3 | NOK | http://autobuild.buildroot.net/results/cab8aa420b6a7950eb877626e40cb1d2c2d2d081/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/8625ab489dbb552951234f2b5ad01456ca545ff1/
         arm |                  host-go-1.5.3 | NOK | http://autobuild.buildroot.net/results/0302b76630d58da78be97147bb13a6dfde980713/
      x86_64 |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/601d553467728ace6b02edc0a528cfa2ad6ebbd4/
         arm |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/0113e9502f67219f95f1476600cbeeda8f6a989c/
       nios2 |                ipmitool-1.8.16 | NOK | http://autobuild.buildroot.net/results/6ee2550479341e06bdbf116ad0efa4dd5793d563/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/2e7b9760eda0326094288349143b1b10351b0ae9/
         arm |                iptraf-ng-1.1.4 | NOK | http://autobuild.buildroot.net/results/4154bc060807382b9479663f5805c934b0b6d3cb/
microblazeel |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/4f6ebfc88035e6748bbb1e48f40c1837dcefb06b/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/5997a9e4a8ca8b6171438495920d0a487518851c/
     powerpc |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/9680ebd8c804ef15d471519d54f8aa209710414d/
         arm |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/71dcaf18e3d42c66af8036a68250eea1be09227b/
      x86_64 |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/d5be4d51458ca10f3f4ff5fd3ad4b3cfd097f3ad/
     powerpc |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/74b1b9f8defc275ff2bc3d877faf2863929737b9/
        sh4a |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/44bb62ffe44377738ef2076c5e517aa7da9dcc55/
     powerpc |                  jsoncpp-1.7.2 | NOK | http://autobuild.buildroot.net/results/4abde1d7fd631d3b50a6b53824a781a08d022bca/
     powerpc |                  libgee-0.18.0 | NOK | http://autobuild.buildroot.net/results/4a03261f939044f5fe2b4ca61e0bc5019c20a21c/
         sh4 |                 libinput-1.2.4 | NOK | http://autobuild.buildroot.net/results/b36ebd127cb9f9e71c72adc71e20429b9ede2f4b/
         sh4 |         lttng-babeltrace-1.2.4 | NOK | http://autobuild.buildroot.net/results/a1e2988a4b041801efce3611eb7dbb5535a5c411/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/7c224a9a9cea53b2cd17b263cde8603c05f98406/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/d3a97695bb66125cc4688e6ebc61fff6210322c6/
         arc |                  mesa3d-11.2.1 | NOK | http://autobuild.buildroot.net/results/0941fe30828efe3185f3228dc281956f21c5cfcc/
       sparc |                    nginx-1.8.1 | NOK | http://autobuild.buildroot.net/results/e628c8c695a9b0598bea1e9ccfb451240bbfdba4/
         sh4 |                  opencv3-3.1.0 | NOK | http://autobuild.buildroot.net/results/ba1fa2325c365089c8778a3c84b6da72c14028e2/
     powerpc |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/13dbba12c2fb17429db52f86bb12230a12936154/
        bfin |                  raptor-2.0.15 | NOK | http://autobuild.buildroot.net/results/20402690ad05d10d456a219da5252a38badf1da0/
         sh4 |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/5ec7c13517d6323d32561036829f4f6c7ceea66d/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/c9025307a3c08519536d60b3360f2d97d6967386/
         arm |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/b303c40feab40e04b457bc25dfdc61a5faf2da4a/
      x86_64 |              spidev_test-v3.15 | NOK | http://autobuild.buildroot.net/results/798c48fae7de46921abc12fe10f726aa81d8b659/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/75ec24dbd1e682077d2c075d266cea0951fcc8d6/
         arm |                    systemd-229 | NOK | http://autobuild.buildroot.net/results/423d9bd4539351d616b6211d4330cdf7f58aaa6d/
      x86_64 |                    tinc-1.0.24 | NOK | http://autobuild.buildroot.net/results/5b1d0c8c1bd75f7e228c313cb21b1638301568ae/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/5cf96ff854a836b6cc0fdca4a5630099c9348af6/
microblazeel |                      vlc-2.2.2 | NOK | http://autobuild.buildroot.net/results/c455b6a93bbe136bfd5c4a6aef4ca8c8ec63a9ae/


-- 
http://autobuild.buildroot.net
