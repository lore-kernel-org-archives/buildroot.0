From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri,  3 Jun 2016 08:30:24 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-06-02
Message-ID: <20160603063024.A03A0103098@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-06-02
===============================

        success : 155
       failures : 154
       timeouts : 0  
          TOTAL : 309

Classification of failures by reason
====================================

                e2fsprogs-1.43 | 61
                      make-4.2 | 27
              qlibc-legal-info | 9 
     host-binutils-arc-2016.03 | 8 
               target-finalize | 6 
                    ficl-4.1.0 | 5 
                flannel-v0.5.5 | 4 
                    libiio-0.6 | 4 
                     php-7.0.7 | 3 
host-gdb-6be65fb56ea6694a92... | 2 
          binutils-arc-2016.03 | 2 
                    owfs-3.1p1 | 2 
                    lftp-4.7.2 | 2 
                     fbset-2.1 | 1 
                  mono-4.2.3.4 | 1 
python-libconfig-b271c3d9da... | 1 
             netbsd-queue-1.70 | 1 
                    norm-1.5r6 | 1 
                  apitrace-7.0 | 1 
             bluez_utils-4.101 | 1 
                wayland-1.11.0 | 1 
                collectd-5.5.1 | 1 
                 mplayer-1.3.0 | 1 
                 qt5base-5.6.0 | 1 
           libmemcached-1.0.18 | 1 
               host-gdb-7.10.1 | 1 
            lttng-libust-2.7.1 | 1 
               netplug-1.2.9.2 | 1 
                 rpcbind-0.2.3 | 1 
                iproute2-4.5.0 | 1 
                   perl-5.22.2 | 1 
                   systemd-230 | 1 

Detail of failures
===================

      x86_64 |                   apitrace-7.0 | NOK | http://autobuild.buildroot.net/results/0f8393770a3f23f68f5b4be78b08735b918d01f3/
         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/248adcdf1f7c85e21e48a82c8218ed30dd301cb1/
         arc |           binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/446aa865cc102c902146aa35687b184fcd9b8d7c/
         arc |              bluez_utils-4.101 | NOK | http://autobuild.buildroot.net/results/395edce8396962157956dcc918fcc4192290bbbe/
         arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/50901293c8f50805f743aa454b721848afc472e8/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/6b7297155265c4d48b3733df8bf70b0a2b98ae87/
     sparc64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/cb687e968b1ace209b42491601ac6a2e56b6ce5a/
     sparc64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/ecd8b38c3d0b1768bceb129dce38a9cd82414f66/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/51dabd930a65cbc5c600b7b95b8a9060704f9658/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/99bb7fe2fd700dd1e4e95cd82489700b9c2489ef/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f0b0309d7e9bfa3c329338c04f746085537b42e8/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f0d4a33f562b693f583eb12c525a62d6cc277044/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e101567b06527c71af280a45eda02b29ae2c81dd/
      x86_64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2ee30c9db93f9e1e1342c2c97a353a206c54114a/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/bd8b8294565d8031bdfc185e354f488f99286875/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/67264afb208714af7e4596c143d7338b6290f91f/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/70e010f0d25f9562dee0654873554259822a4afb/
       nios2 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/a3a32a5ff042b3d3712e462564c7cfb958ffb2c9/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/50b20e6c15ff59ed8d9ec4eea617ccb25e1e6132/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/4cf57b70101640a31a7c6e4a7c01e60734d2c6e1/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e8dd548e306b5e640a50ad2e19d9e9d227912a4b/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f80ee42c5eb26cf4259df18b63c50efe377c1ac3/
        i686 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/7f81d33a1f706a8b97eabeefd1a0e794df9ff47f/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b847352f99fef3252f1b426b7542d691e33df577/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/22034259868463ba71431a97d79efd124c247150/
       nios2 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/38f2e0a8860d5748f636d5e40ef7e957ea1695a7/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b22915c782f11506c08e2f3826d01e4a73163009/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/ef6dfd74d36e0922b0e8f13a1f27645fbe39b8f8/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/80a6823f2ad736840f961ebe565134e2f7d48227/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/99ae7b17658425f0e865e17eb52989feee006fd8/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/ba713461e956031daf32b6fe387f02dfe220ef1f/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/dce25e02850a50deb7d66d39da6f2326ec8f90bb/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e166c35c7ecf900b2c3dc636ebb0f8c8760d6566/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/661c05ee1b54058023a94b923b3e37cb21a274af/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2c29139ad58d18ad6e130ed03a609ec4a6974d17/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/f603cb1923ada8073c0e44b6c8c6b559a347f2a1/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/6bf369a5f9c852afee75c512153f43363b1f69c5/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/9c109e03b790918c25a94dd4867ae572396d4a27/
     aarch64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e7dea441ee9a575832bf7df23356611f841344ba/
        mips |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b3fde895d5fbb449f29d49384c203a8c8302c390/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/02e6999c8f803db8065f65ee70d371f81188c7d3/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/0f56dab800a364eea1294dc3647485333f86c56c/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/30f705666c0043aa92ee6dbf959f517dc6f29ce0/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/d1c2ede5ffaf01d2550a1dd8e231a569a53abf56/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2099fed75e35511406c3e15fae20113b9959d384/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/7e0b3bebc73a79d2de8ee04492dcb7f041ba3f8c/
        mips |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/e63d14c85ccf5bb022ad0efb47507a2760f5161a/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b3885645f136078b10fdee30822b9e8d9d5f95e2/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/ed99b17ad10dacea974e422e0976018cc318a1c8/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/3d23a6408f6dc79b80e457e2be8fc14db033b501/
     aarch64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/3200fd0083ed991e52672fc472be54263193a34e/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/d935cbbcc1b30f628fa7131e7e6d09f42bc9400c/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/93897fbedd45e1ad33d507b08ba2ef55bfbc4585/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/836b9d8adcabcd5789a9256a4b27face3be96ce9/
         arc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/b99493f08b5288f302c9ca3b8da4cee0d39e8d9c/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/0796e0c64eaddbbc64fbe29b1880980538e65497/
    mips64el |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/cd194f1b0afd4a65456dd5e400b78fafa81b122e/
microblazeel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/54038a5eace95f13b264c463ad81b7b7e68ae206/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/fcb4abfce78653d4d677eb0af8258106ef85e2c0/
     aarch64 |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/445844d60f7e6a6de8e07bf4d6590ea94780e165/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/6ff0393a086589c671f33cc0864f26a021142fd1/
        sh4a |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/0691e6a28a5d94b82cf1a04056b00934a527d212/
         arm |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/420d5a7e48c8d99fc5aae6a60a2aeb5f0294e070/
     powerpc |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/008dfed31cad74af42988eeede490b70d6d67c04/
      xtensa |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/edec9d6c1f85c801a30d5a57d3bed11a77ce79dd/
      mipsel |                 e2fsprogs-1.43 | NOK | http://autobuild.buildroot.net/results/2a0e99b851202720709f8c10932279c70991d1d4/
         arm |                      fbset-2.1 | NOK | http://autobuild.buildroot.net/results/b2a51871e1c1597dfc463c498311b217219dd886/
      mipsel |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/0cf6d25b1d8cf5283655a42eaf7251b2103d9e81/
        mips |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/ee144278065df2ef30947c15335afa7b756be762/
      mipsel |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/1766a5d61385df965d91e8a87db5e22075659867/
      mipsel |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/8ce329ecf21f99a4da365161b7c145f256f75123/
      x86_64 |                     ficl-4.1.0 | NOK | http://autobuild.buildroot.net/results/dec926ad7d7880c385835ba7b380dd41fd7f3762/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/40548ff923348fda5e3e6b1b88f83540ac082aa7/
    mips64el |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/3964a784658fd1acf7e6ada9c9db02282f9b83ba/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/9c99527dc2afd2bd5f0616f110547e3531d7dc3d/
         arm |                 flannel-v0.5.5 | NOK | http://autobuild.buildroot.net/results/065677959ececf11008020df05337bedd3d8002b/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/9de60f07b45f5c827dbada36adb571ec5c9601fa/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/780eaab7f24509ee12252fa43c659d7bc60ef253/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/4bd0944ae40328df313639ff9102c7c10c64da11/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/f51e824e1750a137cbb42e219ece45d6115ad390/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/8dd0c9b57b3cf1cae4ed4e7660a0a5ac327122b2/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/9ba7e8271671ad0aef1af18b960f8c2ec07080eb/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/55cd09a559016f4f252f0e4c27313b9806135cf4/
         arc |      host-binutils-arc-2016.03 | NOK | http://autobuild.buildroot.net/results/bd12f830940a45e2a72b738bfc8e097cd2e37af9/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/1ae97f5278ca5545030ffae9497b5dcdb67f6d9e/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/5dd8a3cf3d0347871055ae3827ce211e303620a0/
        bfin |                host-gdb-7.10.1 | NOK | http://autobuild.buildroot.net/results/161ab045a57e725441d36f15dc03c2c9d909784e/
         arm |                 iproute2-4.5.0 | NOK | http://autobuild.buildroot.net/results/a4f1980c68afd7a187c54f5fb1b47f86b836ad23/
    mips64el |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3ce79e4e81b28e24eba65e8fe334dcf07c667ba3/
     powerpc |                     lftp-4.7.2 | NOK | http://autobuild.buildroot.net/results/3ccc2538eb22c72a257030fbe9005745a677cce7/
         arm |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/30159b48dee128f65767d8d114c331f2a9be13db/
         sh4 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/f45c65292bdaded9f04c09bfdf9479c927b5f6d1/
        i686 |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/e60e1e4a17f4e9d9270c49e15e8cb068a624d4c0/
        bfin |                     libiio-0.6 | NOK | http://autobuild.buildroot.net/results/a8e7136c7e5130993ac32a783a2677bced13df64/
         arc |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/1ade8208c2f1f3c147ae300b32b2053d348ab805/
         arm |             lttng-libust-2.7.1 | NOK | http://autobuild.buildroot.net/results/2595737acd9051b1b8771771ffd1397d96a1feb9/
microblazeel |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/d3ca6c33384171467dbff2c537b0f6e6f99dcdc8/
       nios2 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/551843e424c01503265847e5a78cd7c3b0bd394d/
     sparc64 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/a3100d80af43c1f3200a9aabf14d441076007ece/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/5f8b1787148ae9edb1e19473217d0eab86287078/
     sparc64 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/fe62fc4aa84ddfe17107e0ca085bc5fc5c4fc63e/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/006a67e8f93978d6963837f10f544b1a9984380e/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/e2e58859684f2ef7f08d77f4fac3c4ccb7934996/
      xtensa |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/780b314797097aad727a69bf5eef91aab6fe01e1/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/6bbab8d88435c8eddedf18e0a69e1d61d1441f29/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/82843bf51d70a8e7feed02f454ae84a65d127d0b/
        sh4a |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/4c764a6089cb5ffb376c31d85ddb4996accd45b5/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/26e88a15e232ebb154ba48decc976a798056c64f/
       sparc |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/0dd6609dd7bd3a3aecc3fa8220eb6895c7482567/
        i686 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/43be47529153b8a28591cb9a98438307d0ca2d5e/
      xtensa |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/347ebd0b4cc83a64dda1f5bfd13efbf3385a43bc/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/348804e304c15fe963a9777ddaa509d1a2785d60/
         sh4 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/358f98a6d94fbc0d1e4b2c8e21e4c5ceac91bb7b/
     sparc64 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/8a9a278415900e743776279846336b8eb55f3dae/
      xtensa |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/df8a6bea861f96320aa8634d73062e467efdb5f4/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/1318afb4f751d7cfd57c119e4fc9bf59cd9c7e8d/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/88c22132f4203282a8af615d8ca1c0bbd40de29f/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/7b77c95e8ac52f65840501b438490bd2bfb1f08d/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/ffd10e402c8b77b87ada80cf8ca5560705b4c24f/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/2b76adeec0adc03a9a77ae3884a2349c851720ca/
     aarch64 |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/5a8b982d9dd502b92f09165177c28d0533e1288c/
         arm |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/655dd142db6cfcc3f1559bc8d4ff547db447c7a2/
    mips64el |                       make-4.2 | NOK | http://autobuild.buildroot.net/results/ed2e9d56b01e9ced3d31aa46125d40b6c079823a/
      x86_64 |                   mono-4.2.3.4 | NOK | http://autobuild.buildroot.net/results/d1a674c675fe6d47a4eee04fa79f0cb6d48968e3/
       sparc |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/ba9f4191826835c737f5753179d0b401262f7c28/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/1fe8753c4204c2aab932887d374b5a7430d9a63f/
      x86_64 |                netplug-1.2.9.2 | NOK | http://autobuild.buildroot.net/results/057823ec69028747a52814c1af7ff4f8727c5067/
         arm |                     norm-1.5r6 | NOK | http://autobuild.buildroot.net/results/47b97b26326d5594f31817ea7f7815f3b0139763/
         arm |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/7e4250d1480bfb92e18b1b0a79090b936d6451bd/
        i686 |                     owfs-3.1p1 | NOK | http://autobuild.buildroot.net/results/bbd5119510f1e86ed019c7f320e95f6bead11d81/
         arm |                    perl-5.22.2 | NOK | http://autobuild.buildroot.net/results/4c3aa496fc88b8fe38b332009951510befe4e2a5/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/a9e17809b8d3a163fa19aa6840683afe0d79b7f5/
         arm |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/e14d50ee55f44484e67c3e6ccb546eac5723dce9/
        bfin |                      php-7.0.7 | NOK | http://autobuild.buildroot.net/results/eb632cf775f980d1ac1a8585878dfe535a8c677f/
      x86_64 | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/52b187a33767d6bef76a8464bcf05db2175bda21/
        i686 |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/e7aea6314ea9755790d0c1216311b033bd90473f/
      mipsel |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/b2f13102e5c77b7e98cbddf432ad54ac6d11f86b/
         arm |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/a19a416db84a1f3f6d2d135d34d8a104eae5d570/
    mips64el |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/d16befd396ff02ae4938062581b1ab930a15bdeb/
      x86_64 |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/93bed12a71ae01fe23f1b114f793c04c02861f82/
        sh4a |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/12f89408935143050a27d92f4b6796d50da07da1/
       nios2 |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/50af53397fd0df40275cddfbea2bfc2e825c18ac/
     sparc64 |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/63107a8510810aa142e59bf5145c2df53251c0a8/
       nios2 |               qlibc-legal-info | NOK | http://autobuild.buildroot.net/results/585f453da6dae12967ea64e920c20de0d917b55c/
       nios2 |                  qt5base-5.6.0 | NOK | http://autobuild.buildroot.net/results/bc2cb640b6d9615b7f3e11f661355f24be9a0fe0/
      x86_64 |                  rpcbind-0.2.3 | NOK | http://autobuild.buildroot.net/results/2b9db6f9acce721f43c9c1f5ae4274f8b4f7ddc4/
         arm |                    systemd-230 | NOK | http://autobuild.buildroot.net/results/b1746677c2961c5f93c817e6183956985fb6697c/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/dd98f465f9a3e8e59fbe9ca4a93edbae967fdf2d/
         arm |                target-finalize | NOK | http://autobuild.buildroot.net/results/5e0fd1c7bd11c0e8f1acec27d400bcedf4f1af65/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/d3dd0b837b0a39bc942e05c91260d80964be5e54/
     aarch64 |                target-finalize | NOK | http://autobuild.buildroot.net/results/9c2f460ce11f5987debcc8cb2616dc7451a155c2/
        sh4a |                target-finalize | NOK | http://autobuild.buildroot.net/results/e18c504e3a9ab955f6812f7d2d263634e52a3c98/
        i686 |                target-finalize | NOK | http://autobuild.buildroot.net/results/2850bd8fab9fba84a664246d451fec688a24cd40/
        bfin |                 wayland-1.11.0 | NOK | http://autobuild.buildroot.net/results/60e3f40f9db29563ee94b204ee77a3227bf3eff7/


-- 
http://autobuild.buildroot.net
