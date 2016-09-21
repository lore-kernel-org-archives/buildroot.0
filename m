From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 08:30:59 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-09-20
Message-ID: <20160921063059.DE71E102C16@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2016-09-20
================================

      successes : 269
       failures : 148
       timeouts : 5  
          TOTAL : 422

Classification of failures by reason
====================================

          host-libglib2-2.50.0 | 81
           python-daemon-2.1.1 | 7 
                    mpv-0.20.0 | 6 
                     xen-4.7.0 | 5 
kvm-unit-tests-682187afcc99... | 3 
                 mesa3d-12.0.3 | 3 
                  openjpeg-2.1 | 3 
                    qemu-2.7.0 | 3 
              e2fsprogs-1.43.3 | 2 
                libxslt-1.1.29 | 2 
 make[2]: *** [all] Terminated | 2 
                 mplayer-1.3.0 | 2 
                 openssh-7.3p1 | 2 
                privoxy-3.0.26 | 2 
          sane-backends-1.0.25 | 2 
filemq-e59951489045825d6fc5... | 1 
       host-erlang-rebar-2.6.4 | 1 
                ipmiutil-2.9.9 | 1 
                 jack2-v1.9.10 | 1 
kvmtool-372f583d359a5bdcbbe... | 1 
                    lftp-4.7.3 | 1 
libcec-2c675dac48387c48c7f4... | 1 
               libepoxy-v1.3.1 | 1 
                  libffi-3.2.1 | 1 
make[1]: *** [libavfilter/a... | 1 
make[2]: *** [libavfilter/a... | 1 
              mosquitto-1.4.10 | 1 
                    mpfr-3.1.4 | 1 
                    ola-0.10.0 | 1 
                openzwave-V1.5 | 1 
                oprofile-1.1.0 | 1 
               polarssl-1.2.19 | 1 
                  prboom-2.5.0 | 1 
python-libconfig-b271c3d9da... | 1 
           python-psutil-4.3.0 | 1 
qt5webkit-b889f460280ad98c8... | 1 
           quagga-1.0.20160315 | 1 
                   slang-2.3.0 | 1 
                socat-2.0.0-b9 | 1 
                   taskd-1.1.0 | 1 
               wvstreams-4.6.1 | 1 
                xfsprogs-4.7.0 | 1 
zyre-1d949e4bf79b694ea883c3... | 1 


Detail of failures
===================

        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/0880f6ec4c4f46925dccb4d0643046d7bf5e1a4d
        i686 |               e2fsprogs-1.43.3 | NOK | http://autobuild.buildroot.net/results/222a871fa1335d56594d82302f5bae65731369c4
         arm | filemq-e59951489045825d6fc5... | NOK | http://autobuild.buildroot.net/results/dc04595b617e791549c7979f7a9f691fa4c2599e
         arm |        host-erlang-rebar-2.6.4 | TIM | http://autobuild.buildroot.net/results/c83e7b81f93afd4bf57144fd3c8696b462cc71a6
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a8a248aadc8562fec3bcadd738b31d70fc2c5519
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d5fe710f47095c23f6b4601f15e9730e8a70149f
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd1bf029b5dea2f879615372faa0a5a5b88d19c2
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/405a4de60505462dee41bfb356689f3f072bcdc9
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/824488ee2b516ef367386f120ecf6e3716848678
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1f3737058d018b04e20f575398bc6dd0c1b6f6af
         sh4 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5af7c8b757fc8cd638bd147a1401c7b4a4e229d5
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/30175abce31f03bea1c2560b88a4ff15f5b91cdf
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/973fdd1e289dfb008399cd63fbc36b84feca0d30
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/5c2b62467853dcfd8beb9f4ff83732065a4395cb
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d9924cf1f1722b7da8a4b17c852a699f76c798aa
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2cb70e01aacd1c3e0c28c64b3177349b605568e0
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e04e29b11137f6c6a939d2a472f8a393f69faaa0
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/845ffe182cf7719867ff15512bb3ccd4cf565322
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ba9e42accdc3091459c81bf40bb094ac70c9bfd8
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b83d68bc0f3b7221ed45de2a78e0472b28cc8916
microblazeel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/85e048071c9f771c218cdc4a1b507e43366a8948
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/db4dc331f7e7a1e9a7556f287054e7c5f1de77fe
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/09a211a421a0a04661e145be88e6226f758aedbc
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/e81f98561867d370115a019284682c0611796978
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3c0d148bad084f0450e2478910dcf6cd56e28f6d
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1007f0dc8d7e1e8dd2f6881eb69a6245914d8ec4
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/06ad041b752883ffadc85e9e2daa1a2ccdf39121
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f355fe780465a042599cf12b75269fe0b9a10f53
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/266bc8bcdfb8d82b9ae2bd9c8ee4216d5f74e861
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1db47ae4f639230c36f1b4fcff1c244834548414
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7ea98836c3ecd1f0a15bbf4609fe35fda5d11319
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cda2345e67e8b97f7c7c873e25f975fa3f36b56a
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/384cdbd87a945c3836ddc5da45182cc776fc83d4
      xtensa |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/a25dfe0a7805b69f6b33b8c8cf9b9048af4e4822
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3d9828f9b5dc66ad838f527c9b97c65d1b93de00
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1bdff4543fff9faeef13efef98ab9f32f2e66089
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d00211171d017adc50c23793c10c4983ffa84b5e
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/acb03ea21fc7b161263bbffbdc87f4504ecf42af
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/be713180ba8e9ff8e25807ce6c3849cc5a6a4404
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/72e20bb4e874e6cba4d3468e41756ae148432744
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/396c8a86e87ae3cd9dd39e5ebea1627b5aac9c67
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/eb9cb938d9f031c678a66fd3ca701030012c4cd3
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/c8d6a9326d2713aa190458e22797ce22ba2343b8
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/85a0e22a425a1c7fd365c8dae10342264d9d5d60
       sparc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/04ad750dc432ea9a9cc4f419cd354c9e20c8fda5
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/73cb6e6307c586cc9d5063ba0bc1f54301224c93
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/800092dbe5cc0011cfbcaf66143ad84782dc297f
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1787189a022ca9cd56872526a6602f2a10b451c2
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3d57299a1e79740625ec5aee89912f85721f0842
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/02f7fb710b9916de1b0e0f6cbd998b26cbac3425
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8de848f1b3f5cd9246c573c3ffffa2615a72b7ab
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/33c73aca2ef15fce879f01c6cf408808d69ff0d7
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3a143333dd2f9a5d80ec07729ace284a1a779a9f
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/b3285e9a4810a01ab433bc14903e8292982669ab
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/7840928a79c4f769228f2333b9fe9283db18ec05
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ee7818354af6ee4dadb1855c50d814bc282af666
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/65079ddd81dc80427285c5f041f403fbfcaa1c9b
        i586 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/184632a90d6e521d9c3a67c54331f49d110ae3f0
     powerpc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/df60136acf96aea84a8a55eb0db56826b46b2185
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/11659931227b27570ec816747069ad2f17df791c
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/66f158ba98ee20f64b4315941848b9a86a493149
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/76459c8bf0f643f9fe3f81ea3fa8696699ee4a9a
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ef7c2a4f9da8e38188fdad352cc42c2df2e54a38
       nios2 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/1a4b3a2770e90d3e15fd0b2b129eb3c319d13a6b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0fca1bba1b05cb1cf2a24b58e576500ac1b12a2d
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cecd836e92e3dfc00d40024425e0312ece5d92de
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/4d468f853e3b5e35cbc755a1fa54b15eb8dc7b4f
        sh4a |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/be398a3661de7db27a4b7a73ece914670538ba92
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cc834674f000ac757be8079267441493507d627a
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d516d610c226bb83d6dd3105a993ea42688c8fe6
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/ca97d115d1ecefb30c65f007cce75bef69c4021b
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/f4c54cb7a3bd0bfa10f137532e3e36bdec54462c
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/396e37b0c7e26266d1e3d6bdce97883949420a34
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/d5b0ba50b3711f0be97a61ab5987a2e97229f782
        i686 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/0c96ebe350ce573eedd24b59e9139896a5bf869f
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/cd329f77235f3b89fb288bc6dcb78fe4a7a8c42c
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3c6a6b0b19083e674b5f307238d783210f457e8a
      x86_64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/6ec26833b286b76c8c3a1f7941135f5eeb4a6184
         arc |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/2c8bcaf9d6b108b977096a26cfebb289e218540a
      mipsel |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/29a1fce2df5947d769546ba58af799574177757c
     aarch64 |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/90f205d6e1bdd527507a331aaf39da574f1d2fbc
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/84503e488f1657e49a8495a37670e44356e4cf1a
        mips |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/3b8019512fa5ae196ac3da5c85ab3359cedf7bf2
    mips64el |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/8669cb8faab389e14080350260fcfe34dbd10f0c
         arm |           host-libglib2-2.50.0 | NOK | http://autobuild.buildroot.net/results/514c4dc844a52f342819e413959c57db4de62480
        i586 |                 ipmiutil-2.9.9 | NOK | http://autobuild.buildroot.net/results/78d20d43afd5395132f7c2ac68d8bd2edb2cbcca
      xtensa |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/d9b3f20d5b80885c675005b9baa0caed94990bb3
         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/a81d40f1453ee027c7e2a9da01f482e1d09b464d
        i686 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/20efe1e310fe71a587774bbe8490d6357acc8edd
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/07deb6183ed23447de5182ee20df6c9c49e5ca49
         arm | kvmtool-372f583d359a5bdcbbe... | NOK | http://autobuild.buildroot.net/results/9f7321b0f9c43f956e9b1843b7c82c76e45ba942
         arc |                     lftp-4.7.3 | NOK | http://autobuild.buildroot.net/results/c43de1cee37c43bb2cb36ef111bcada99069ac55
         arc | libcec-2c675dac48387c48c7f4... | NOK | http://autobuild.buildroot.net/results/a35e32084f9a49b1b927a1102915542499ff0ce7
         arm |                libepoxy-v1.3.1 | NOK | http://autobuild.buildroot.net/results/e1f681e266c4e2f734e385267135f1fe1c7520a9
         arm |                   libffi-3.2.1 | NOK | http://autobuild.buildroot.net/results/907f906fd24d6a70a2a704cefb70219b3d0c06d8
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/09872e45f12f2d3aa2c38d0f8c614eb2aef65565
        bfin |                 libxslt-1.1.29 | NOK | http://autobuild.buildroot.net/results/e4cccff0f46900008c84fa7610482486e1df5aff
microblazeel | make[1]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/0bd922a3c35435d312217d6f2d79cc83bb46358a
      mipsel |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/ea022b2d9c1479c46f1cd57d55518e283d3b41c9
     powerpc |  make[2]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/4728b4e26ebf332c836c1fcd037e26af93fd01db
microblazeel | make[2]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/8145966ee58c70e21f275bcb670bdb7f823f4d75
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/2a59214ad222ba799f17463c9b9aad9d2feb1059
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/564d0c5e8a72cedf1b2bc12eb7a066becc0a3b7f
         arc |                  mesa3d-12.0.3 | NOK | http://autobuild.buildroot.net/results/ea1aa1267e66d88e11a10ce139ab8f4d85e58ef6
       sparc |               mosquitto-1.4.10 | NOK | http://autobuild.buildroot.net/results/085f4b399b82a1d852da2fe02a311c593e8f2e5d
         arc |                     mpfr-3.1.4 | NOK | http://autobuild.buildroot.net/results/cf1e71293b3b63a77c2b275f27f4a32695ff516b
         arm |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/0d8595f2502929e30566b8b9d524fae297634b63
        i686 |                  mplayer-1.3.0 | NOK | http://autobuild.buildroot.net/results/a2320686cbde6dba4f61414a74878753a0efad69
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/66759845f7089c4e08bf78ec9d0574ddd860dd42
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/9bd436109cf6f3f739ce729c445f8dfb1c7dc4c5
        sh4a |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/a1da0bd2939d10612672fb496f70a4aafae4c666
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/5e27810af12d5296d3169c04a53c7a72f71ef908
     powerpc |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/cb3e9935e204fec2b3494c2490688b2c6076047d
         arm |                     mpv-0.20.0 | NOK | http://autobuild.buildroot.net/results/4fbfac21fe6b981da99e05f79e2d7bc323bb66b7
         arm |                     ola-0.10.0 | NOK | http://autobuild.buildroot.net/results/2d55b5d88a06c7b8e6baeb96973009a451e992d9
        m68k |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/3c0ab934f7ca31e2496bf5b1a5a407dc33c0b888
         arm |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/9198ca75cf33ea14eaeea9508489c15430b1ed6d
        bfin |                   openjpeg-2.1 | NOK | http://autobuild.buildroot.net/results/520b714904725653ab21b1dd3c31ee1579c71e72
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/60b6fe35c9b6f76b53ece94564120cd6e7dfeea2
        i586 |                  openssh-7.3p1 | NOK | http://autobuild.buildroot.net/results/9e232160811fb05c723ea1001dcd6d5a3973d7a9
         arm |                 openzwave-V1.5 | NOK | http://autobuild.buildroot.net/results/b50a8988dedb2345e2303b6b450ceadddd0af123
         arm |                 oprofile-1.1.0 | NOK | http://autobuild.buildroot.net/results/5a5c8e1be78dc34a16516132a0ea6883821f12e7
         arm |                polarssl-1.2.19 | NOK | http://autobuild.buildroot.net/results/d39460e76f2a800871840914eda52b6edee1c941
         arm |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/5c72f9a0ac245f39b2a1c07b77e12aa5b24e87bc
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/f5015f84868b3844e94f9926efce8f35686a6edb
         arm |                 privoxy-3.0.26 | NOK | http://autobuild.buildroot.net/results/0e10a93b1a814f28f4fca099851971fa3523f1db
        mips |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/0c3866038f7c40888e5e440f7a720fc614a6b1ba
       nios2 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/5d817bddeff5bb49ed31c6a1d111974c358ef96c
        m68k |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/9c724ac2321f4455dd351628f99ab1b45c7fc11c
         sh4 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/c4672a60141571e57328f830f2863d1d04a2d262
         sh4 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/a3ff8c97904517d459783640d939fb3019d2d8ca
         arm |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/3d837d892e282b76e2c959cf8b85f0a10a016ea6
        i686 |            python-daemon-2.1.1 | NOK | http://autobuild.buildroot.net/results/26a571a5a39c29c666fcb08a374ef63e39cd8d55
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/6ba5211bac7ad3859bf69043d21a9441f4a1c568
      x86_64 |            python-psutil-4.3.0 | NOK | http://autobuild.buildroot.net/results/b84428dfe73dcae89fcec68d76eac4ea4ffb34ea
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/21d9eca19b9c28993839c9ff3a2d0b31bbb7e780
         arm |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ac7a7b04ab9dbc1fa0d47c1104146319555e7b4e
        i686 |                     qemu-2.7.0 | NOK | http://autobuild.buildroot.net/results/ed262409bd1cd0783e4b0156df2301d21f978e09
      mipsel | qt5webkit-b889f460280ad98c8... | NOK | http://autobuild.buildroot.net/results/d4f03c607370b59544bc2f83d4964dec8ab4ffb6
         arc |            quagga-1.0.20160315 | NOK | http://autobuild.buildroot.net/results/c49f19c714d05934582356b7162acc9d9d915179
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/365cb4b53c4222a9def79c5bfb5b1006923f3a3b
      x86_64 |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/63edb52da31e1e46e1b4d2bac90cfdcd830aae78
         arm |                    slang-2.3.0 | NOK | http://autobuild.buildroot.net/results/169afe3afe031f76f9ff83f81e8c25478076807a
      x86_64 |                 socat-2.0.0-b9 | NOK | http://autobuild.buildroot.net/results/3f4054e155df30d642b975a6050f1ce25cb97c18
      mipsel |                    taskd-1.1.0 | NOK | http://autobuild.buildroot.net/results/5bfd874f2641f2cca67585c61e7f5b77cf011b92
         arm |                wvstreams-4.6.1 | NOK | http://autobuild.buildroot.net/results/76ee2332261f2d71f831500337ece7c7cffd0f85
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/559b127fab2544fe416209114b1676b1c8af80f9
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/adf24fc36fae8b2f2501d8f51d41bb8727457289
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/2f321253e4d21e554fba157217c4fc02cee4b4b0
         arm |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/90ec04c53038b335db2494d04d23be391ad555a6
     aarch64 |                      xen-4.7.0 | NOK | http://autobuild.buildroot.net/results/443c666f741d16bd03822de0b2082b6617d66e6c
      x86_64 |                 xfsprogs-4.7.0 | NOK | http://autobuild.buildroot.net/results/e122a67386efa38fb1853a9eed17dd4bf1611e89
      xtensa | zyre-1d949e4bf79b694ea883c3... | NOK | http://autobuild.buildroot.net/results/04649481d86f8298ea7b38e6dbca6bae4f8e4f9a

-- 
http://autobuild.buildroot.net
