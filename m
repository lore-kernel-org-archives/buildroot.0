From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 16 Dec 2014 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-12-15
Message-ID: <20141216073017.AA21B10165F@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-12-15
===============================

        success : 293
       failures : 110
       timeouts : 2  
          TOTAL : 405

Classification of failures by reason
====================================

               xfsprogs-3.1.11 | 22
                  guile-2.0.11 | 11
                     gpsd-3.11 | 9 
             libxmlrpc-1.25.26 | 8 
              jpeg-turbo-1.3.1 | 6 
                libexif-0.6.21 | 4 
                gptfdisk-0.8.6 | 4 
                collectd-5.4.1 | 4 
                     gdb-7.7.1 | 4 
                  perl-gd-2.53 | 4 
                pinentry-0.9.0 | 4 
                  sispmctl-3.1 | 3 
                   ncurses-5.9 | 3 
             bluez5_utils-5.25 | 3 
                poppler-0.24.4 | 2 
                   erlang-17.4 | 2 
                    strace-4.9 | 2 
       directfb-examples-1.6.0 | 1 
          libmicrohttpd-0.9.38 | 1 
           libmemcached-1.0.18 | 1 
                      qt-4.8.6 | 1 
                  autossh-1.4d | 1 
                     rpm-5.2.0 | 1 
        gst1-plugins-bad-1.4.4 | 1 
       opentyrian-2.1.20130907 | 1 
               libsigsegv-2.10 | 1 
           python-pyzmq-14.3.1 | 1 
               sdl_sound-1.0.3 | 1 
               madplay-0.15.2b | 1 
              host-mono-3.10.0 | 1 
                    php-5.5.19 | 1 
                  zeromq-4.0.5 | 1 
              host-swig-2.0.12 | 1 
zmqpp-36413487f05b165dfc82a... | 1 

Detail of failures
===================

       nios2 |                   autossh-1.4d | NOK | http://autobuild.buildroot.net/results/bffe401b97e2a8f842fc33f1e44a8369477c2c12/
        sh4a |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/e4c9574bc560dd2d46a4d3e2216a862b332f30d4/
      x86_64 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/98e3c02db31c2757d793b5db6fb45b2ec6caa02e/
        i686 |              bluez5_utils-5.25 | NOK | http://autobuild.buildroot.net/results/3b97403033836af03f05ca445c2fb562ebc40ca7/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/d9dd89f9f7450fdfd4f0eaf608f89f51ef12c55a/
         sh4 |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/4c46a539f142dc21df48f31a5ddba42c6ec7c281/
         arc |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/77f1bae51188c529b434c7cb01cbb70ba774648b/
         arm |                 collectd-5.4.1 | NOK | http://autobuild.buildroot.net/results/5647c49af6918f560be36ded1a56440a74c1b6d0/
        bfin |        directfb-examples-1.6.0 | NOK | http://autobuild.buildroot.net/results/fd680359c0b615460a6de1f8d50bccf0f0ed8f5a/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/04cbf79ccf159e15f9ea3953b425faadafc8a1c0/
         arm |                    erlang-17.4 | NOK | http://autobuild.buildroot.net/results/3ebfd36948d5a642cc83ce31ddf5902cb369bfbd/
        mips |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/50ac5b9241a2edf6eef67dfc50d31371bc7747cf/
    mips64el |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/cdab5612ccfe28a43760edf1de3dee0214c1a51f/
        mips |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/68d30f799195f70e27ab5068c72560ef93fdbf4d/
        mips |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/535e7be83599d6e8d5929449d0e26e2f7ed6de4e/
         arm |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/80e926bf314c8ce1dcdd4d9edb8def7b6b6dc101/
        sh4a |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/decccac986e28e1ced134ec6a19ea1936a855c27/
      mipsel |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/2f5f3105d5094453e4c7c446c337dad8e29a7f1a/
        mips |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/20bc7a503eaa13b4b45a8f6ff706509f508f2703/
        i686 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/e056a3903549829af0fb403220b0a3aef078eee4/
      x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/ad046df72687005e248b2c48da9a8aba0eabeb80/
      x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/4a0f499be627cdf39356ef1711a6e8b7e206b929/
     powerpc |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/6531591395e2ffe9b089024745c42967125d256c/
      x86_64 |                      gpsd-3.11 | NOK | http://autobuild.buildroot.net/results/181dfa03358d4c3788484737a3fbd0ff7a6e4593/
      mipsel |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/fb079322263a480f64ca77fba9b75e5536a3d423/
        bfin |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/e1a26f138c6e13a65a2ff0b3a41c81e82be38c5b/
     powerpc |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/878a83d9a40859b4513c568bd9164b31b215bed1/
         arm |                 gptfdisk-0.8.6 | NOK | http://autobuild.buildroot.net/results/47b406f95f9289f5527efcf7146b2e25ac97ce15/
      x86_64 |         gst1-plugins-bad-1.4.4 | NOK | http://autobuild.buildroot.net/results/59d0315c106a79a8c356a58b554c8bfc69551821/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2c3509f67d5242ebf2a660d203ffc7bbd2c3516b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/94b2623cb4b00f3cbc6bda9f1b7de2ab89afb22b/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/0bc8900cdd9f06a851811239aab0d9fd59059779/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1c21dc10cf448db86834cd70d9fc168398c2711e/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/aa351313b4699e3fc62f37cdf587282778ae7aae/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/b819221a36661e12c7e5d09cdd607e39ac54316d/
     powerpc |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1a4b57f849c616216509c00912c997f627b44e43/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/590640a9bfbe84a9d0bfdb1d893a77ed2e918fac/
      x86_64 |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/6801cfb094dbec2ee34b8a8f46313af1c142ae68/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/1ceca13ac7836278ded9cea6e147553b2274b730/
         arm |                   guile-2.0.11 | NOK | http://autobuild.buildroot.net/results/2ff4ed16d0f359c74a3dba5953de736c6e91fc4f/
        mips |               host-mono-3.10.0 | NOK | http://autobuild.buildroot.net/results/15b896cf1e3e081c8c65a5d6edbcce357504fba9/
      mipsel |               host-swig-2.0.12 | NOK | http://autobuild.buildroot.net/results/72c36bfe2b0011211b55be18f200c1ccac262e8f/
      x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/29d2c8abbf2f2d8bdf10ed2bfa3bb98dcc963fda/
         arm |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/a0e2b19f51904ad892ac03c4ddd0e7997dfed7ed/
      x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/26f1ff9b4eb710ce8ac1b4b016579e810f020205/
      x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/467a5355113c5f0d74f76e0a2126255f3619e8db/
      x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/3e6d426c7fdb1b61f40359c8adf411e55d57c99f/
      x86_64 |               jpeg-turbo-1.3.1 | NOK | http://autobuild.buildroot.net/results/06424675f4810f32a0fec2a014ab4726787ae7b3/
        mips |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/14b047a98e2126fcf576718564a323d89992f927/
         arm |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/3ae25823374b4118b642b0790a3137a2a927a408/
      xtensa |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/5e932b15990c6f156bb83eaef476adcf902d35b3/
     powerpc |                 libexif-0.6.21 | NOK | http://autobuild.buildroot.net/results/a4479b9eae8d21232e36ff3c388eb861c50b9b8f/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/9d2b4e79f3fcd716327995292e4f858e834b956f/
        bfin |           libmicrohttpd-0.9.38 | NOK | http://autobuild.buildroot.net/results/438f5f79614602822b8a6725e58093e2c604c07f/
       nios2 |                libsigsegv-2.10 | NOK | http://autobuild.buildroot.net/results/3cf5c2c60a8bd667435ba66e6485ba4e5e1e1c85/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/9521dbdd9b6b103ea1cb5fefc339c68cc443e87d/
    mips64el |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/58f192d20654352764f9e8da34415bdb594c6edc/
        mips |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/d4430b7384702bc91476ea00ae8a60ec1a69255b/
        mips |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/c94c3f622556b81ecb1669ca5e293bca34136a57/
         arm |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/f03911bdb8e050a312a8cdaf6c3a5dcd58595abf/
     powerpc |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/129101858d0b93e9ce14b4966243757c52d5b068/
        i686 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/3a0bc5bfa20d5faaee23e9d02ce4c5a5cd186ce8/
        i486 |              libxmlrpc-1.25.26 | NOK | http://autobuild.buildroot.net/results/5f5156e3bca3f5c151379f053f374456539db6ad/
        bfin |                madplay-0.15.2b | NOK | http://autobuild.buildroot.net/results/7ed62274371930253caa3da4c51b60834501a62a/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/32a5ba3905772a3f2f2ec9d1b290a109fe22d9f9/
         arm |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/d7547631a3b2dac2f281efa5e5361cefeb902fa2/
         sh4 |                    ncurses-5.9 | NOK | http://autobuild.buildroot.net/results/636ccdaed8b975d0d606fa4e781dd85f08c62f6e/
        bfin |        opentyrian-2.1.20130907 | NOK | http://autobuild.buildroot.net/results/3e4f9e28a1a479620e55494ddf9f2fe4ae7c6955/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/187c46d39e979903ced2678a9c0a3795130a1d2e/
     powerpc |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/70abb78ac39fb0b13ca76abb8ae99a9abfee6554/
    mips64el |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/94a53b968466170f00a380105a00a8ab8e43189b/
         arm |                   perl-gd-2.53 | NOK | http://autobuild.buildroot.net/results/b7ae2ead0de0f91800692774dd7c5a7e1a5d45be/
        i686 |                     php-5.5.19 | TIM | http://autobuild.buildroot.net/results/7c2309fcfc9fa9eaa1b5ba2c7f6298fda0074977/
         sh4 |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/f7dde38d2732884509e3d59b384763e241f2b62c/
         arc |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/0969c6dabaeeb17e069d72ce1347009edda60f09/
        sh4a |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/3dc489fd00f2b8d6988fc319aae31314aa8b0324/
         arm |                 pinentry-0.9.0 | NOK | http://autobuild.buildroot.net/results/52e6050b377e947dde33a74216afa9c1241f8937/
        i686 |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/788dc0717aa5d3c895f72009a89b133268e337c8/
        mips |                 poppler-0.24.4 | NOK | http://autobuild.buildroot.net/results/65b7891ab8d861d9877920eb3358ecfc6d5408ec/
         arm |            python-pyzmq-14.3.1 | NOK | http://autobuild.buildroot.net/results/751fd4efd0eed25942fdacdf246c71e423c19b49/
    mips64el |                       qt-4.8.6 | TIM | http://autobuild.buildroot.net/results/da94c98f3884c92404487cc73ecde1315e1b2aa3/
     powerpc |                      rpm-5.2.0 | NOK | http://autobuild.buildroot.net/results/4efcc46c4423de2d64f8700316e7d94b1511ed6d/
      x86_64 |                sdl_sound-1.0.3 | NOK | http://autobuild.buildroot.net/results/537e928f9adbc0a02f635115c333a1dc3c8ae4d5/
     powerpc |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/d60ab68b3b95b0c8853feeb270157f22302061ba/
      x86_64 |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/6c837b244c45ac3b3a887734a371cd6d226cf216/
         arm |                   sispmctl-3.1 | NOK | http://autobuild.buildroot.net/results/56ebda439e779e00c2c7ac5f8436e0084a880b3c/
      x86_64 |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/2a2536ee4570c96e9343647477c3fe2683d7ef0a/
         arm |                     strace-4.9 | NOK | http://autobuild.buildroot.net/results/6061c66ccda38662d7e3be0b49f93e2ead7676b5/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/d347e86cfb0e22a6b154d13f3c2b0ce8dce6bc91/
        sh4a |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/3c66f0e80034de4c5804da801bdcb9daf80d8f5b/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/de264bbc7b2a1a6177685343afd0b88b90bed03e/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/a2a293c07f74b9db7d745afdf0b8431488c8d233/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/fa0d96dd16772f200b5e530c21b51ff81ef6205e/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7acef784500727a7e5e478195ee227d19e3cf07f/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/5cce2adb21402119854b12a67e71c36906c4196d/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/3f1934dd91ed0f915883fcfc28c75edc76979be4/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/7b59e29d971918e5bdaa69ac4c6a4c224ffd2124/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/4b479506fcc621d68314408c8d7f82cf168a5215/
     aarch64 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/abf41aca10c990f03bb7230eeb3b101e5cb5ba43/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/809205f44eafc5757a9d58303fb9c6fd0279e9b1/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c159fa68876ebe3c557896166075f6104e1823aa/
    mips64el |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e19c55b8e9e77bc8329aaaba1cbe096c8c7ab564/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/34340f0724c9b3b945d74c8484d961b39e9bb5d7/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/676d0fbe72ed831f94524cf606e73c0e8f85942f/
        mips |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/e71ef181793d52b0823fbf474b3f3b5791e42741/
     powerpc |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/06c8c13c48387d2ca65e015b3c38cb52d39edf7f/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/c597ced21be1b8571a8043a74f6bb6343c1179dd/
         arm |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/de7bb31dbf735afb8b691f3c753576a0861aaf94/
        i686 |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/b2e7ea942fdaa7e4f5d6696794b0879da0cf27c6/
microblazeel |                xfsprogs-3.1.11 | NOK | http://autobuild.buildroot.net/results/21debd478ea6ebf1b52f9a9aab6e7b3efc289764/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/07048445a4f9a6eb28a217dd969370f4eec8a4e7/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/8c732317242d34f6ea2b70ff6efd54a4d8e8387d/


-- 
http://autobuild.buildroot.net
