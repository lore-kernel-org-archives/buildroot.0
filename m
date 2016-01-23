From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Jan 2016 08:30:21 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-22
Message-ID: <20160123073021.625F6101B7A@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-22
===============================

        success : 200
       failures : 87 
       timeouts : 4  
          TOTAL : 291

Classification of failures by reason
====================================

host-vboot-utils-bbdd62f9b0... | 12
                  boost-1.60.0 | 7 
zbar-854a5d97059e395807091a... | 5 
hidapi-d17db57b9d4354752e0a... | 4 
                  stunnel-5.29 | 3 
        ltp-testsuite-20150903 | 3 
                   erlang-17.5 | 3 
                       unknown | 2 
                  prboom-2.5.0 | 2 
                 lvm2-2.02.138 | 2 
               valgrind-3.11.0 | 2 
               libgtk2-2.24.29 | 2 
                      qt-4.8.7 | 2 
                   mplayer-1.2 | 2 
                    ruby-2.3.0 | 2 
                    sox-14.4.2 | 2 
             webkitgtk24-2.4.9 | 1 
iputils-c8ff6feaf0442f8efd9... | 1 
              memcached-1.4.25 | 1 
make[6]: *** [libavfilter/a... | 1 
                    glibc-2.21 | 1 
          sane-backends-1.0.25 | 1 
                   libnss-3.21 | 1 
             host-nodejs-5.3.0 | 1 
                  trinity-v1.6 | 1 
                iprutils-2.4.5 | 1 
make[5]: *** [all-local] Te... | 1 
     host-google-breakpad-1373 | 1 
                     mc-4.8.15 | 1 
make[2]: *** [code/CMakeFil... | 1 
                 openal-1.17.1 | 1 
             lttng-tools-2.7.1 | 1 
             stress-ng-0.04.16 | 1 
             netbsd-queue-1.70 | 1 
host-gdb-6be65fb56ea6694a92... | 1 
              libsoil-20080707 | 1 
               linknx-0.0.1.32 | 1 
          libpam-tacplus-1.3.9 | 1 
                   redis-3.0.5 | 1 
                 dropwatch-1.4 | 1 
               tcpreplay-4.1.1 | 1 
                 mesa3d-11.1.1 | 1 
               host-efl-1.15.3 | 1 
                  libssh-0.7.2 | 1 
               libupnpp-0.13.1 | 1 
             util-linux-2.27.1 | 1 
                rt-tests-v0.89 | 1 
                      tar-1.28 | 1 
                    cups-2.1.2 | 1 
                    vpnc-0.5.3 | 1 
               nfs-utils-1.3.3 | 1 
           host-gettext-0.19.7 | 1 

Detail of failures
===================

    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/818b1712c5f6e4bd8969c5be79f7184080f6e1e6/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/beb9d3da829a6a672ac397ff2b956e4e0dd62200/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2d7a4b8000dd7220c2fa93c0d9aefd93641dab73/
     powerpc |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4928faeca79de380f542ba1676c2a6777b3494db/
         sh4 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/856dc6818c5ecd47c201e2e1446f3d310d42c203/
      xtensa |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/dc66b7fa7ba324ed9f5271cb6175964404d4ba23/
       nios2 |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/e2daeda2773a9bf7c3161984a6d1afacecf341d5/
         arm |                     cups-2.1.2 | NOK | http://autobuild.buildroot.net/results/c7df3268f42b945c17a00bbe1367ccab15e1f71d/
         arm |                  dropwatch-1.4 | NOK | http://autobuild.buildroot.net/results/b7ebe8d964b69c7c6489e78ba25d898e4f56f476/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/0cae9220446bfd0a27b58f7c9de804647885a9e0/
      x86_64 |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/084f23c443b4de20cdc922ac7e1722729f45734e/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2c2d41b3d2f3016fb6942d6febe216243c49a1d7/
microblazeel |                     glibc-2.21 | NOK | http://autobuild.buildroot.net/results/550625df7a8bee6d83ebda167c36ac6aebc048c0/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/f27dd73c7f8393e7b8bcbc03a057deb2119e632b/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/91df0ebbfcddb214f09c9fb5e51822c539322e55/
    mips64el | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/4a7aec53764b7c46ba62316e46e73af2e13609e0/
         sh4 | hidapi-d17db57b9d4354752e0a... | NOK | http://autobuild.buildroot.net/results/c130c77a98fb20bb521790d4a43912ae52714b40/
         arm |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/2b054f179827b71e7962b2890f5dd6056f8e92b2/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/55d95d7decc8ff8c451601a38ce2c2818fe23bcc/
         arc |            host-gettext-0.19.7 | NOK | http://autobuild.buildroot.net/results/4ec03877d6e154a0a1f387f738ed4b66f7aa3912/
        i686 |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/656ced8999da49f8fcd9fb02db04629164b118e2/
      x86_64 |              host-nodejs-5.3.0 | NOK | http://autobuild.buildroot.net/results/56c4a1983991b553da3e97b5aefc43bf5b364f03/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/fc097029ac7319031a786df450f757189c160949/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5d46aaab5eb0331dea4722ef34e2c2ed991a476f/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/e0de062d6425b30d37be62f15dc9a46d6256e7a9/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/0ef58cc1a976c5c6042b7aa299dfedebe2bdc3dd/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/f0e7ff936c48bc8838be3e3283408105512aec98/
      x86_64 | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a882119e11c8bc20bc22f56d2290b7f613b6535e/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/a33f849ad41d1009c0ad25a662e0075b7272f419/
      mipsel | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/b39d6cd61e96a8d57581ca9c82d3b037d86a41fe/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/05d95ed538d0e7eaed9692b6f8f42ab2bbe05426/
        bfin | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/5690577b1be2109fa7229de35fdafaf55dd6da17/
         arm | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/70917bf978648ca03c97f5fe9fd8b3581743af57/
     powerpc | host-vboot-utils-bbdd62f9b0... | NOK | http://autobuild.buildroot.net/results/6654c733a915ae2afc59fc4db08e93a21512139f/
      x86_64 |                 iprutils-2.4.5 | NOK | http://autobuild.buildroot.net/results/8002fee44d9b6fe8e4d822f35a652dca3245a3e8/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/0668c3b02c8422623218951ee2f7338dbf171d7d/
        sh4a |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/f802ccf06a31aa10d710141f5cda3b8276a27906/
        mips |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/f22791d427f3bb7e629091801904c287a9d2dfc3/
     powerpc |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/5817abb20d228f78f0ac7eda1b2aaf1b842d7442/
      mipsel |           libpam-tacplus-1.3.9 | NOK | http://autobuild.buildroot.net/results/4ebe9a99e7f462c72eb6569c1d8c7045d6425b82/
      mipsel |               libsoil-20080707 | NOK | http://autobuild.buildroot.net/results/6d27ed83de0d1b67a190d1b88646dbe43f1078d8/
         arm |                   libssh-0.7.2 | NOK | http://autobuild.buildroot.net/results/dee903ec7d813ef8a0969c5036b189124362819f/
         arm |                libupnpp-0.13.1 | NOK | http://autobuild.buildroot.net/results/50d6a365b563a1122f4bb30e4cd9af4c352f6126/
         arm |                linknx-0.0.1.32 | NOK | http://autobuild.buildroot.net/results/d3f545a0204a9bf09f39bfe229f25c3b3906b958/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/60d5d87b7f0e76355469dcecd0f52c016dee0485/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/4f6b48e6cb165db50f344015a64d95ad0da55d93/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/c97bf1dfefbf91b345a8349c8f5e5cc2491702eb/
         arm |              lttng-tools-2.7.1 | NOK | http://autobuild.buildroot.net/results/4df66fb34b101a05687c3d5d7774af571a3ff977/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/018bab24c1c90cd402ee582e892613af6cd90bd8/
      x86_64 |                  lvm2-2.02.138 | NOK | http://autobuild.buildroot.net/results/d88d5d87b63cfe7d51e8e70d3815a9cca637b62d/
microblazeel | make[2]: *** [code/CMakeFil... | TIM | http://autobuild.buildroot.net/results/8f85eb15186a4fc5a03debbdd4de427391f573fd/
microblazeel | make[5]: *** [all-local] Te... | TIM | http://autobuild.buildroot.net/results/c529f6f82c8232df4534c34c4cf684ab94f3d0f6/
microblazeel | make[6]: *** [libavfilter/a... | TIM | http://autobuild.buildroot.net/results/20af6c077ab7d8f420d3fa08753cfa31d74d6778/
         arm |                      mc-4.8.15 | NOK | http://autobuild.buildroot.net/results/1d25c74e642d80fc3e11a8dd343b4b62129e3bb6/
        sh4a |               memcached-1.4.25 | NOK | http://autobuild.buildroot.net/results/46fbbda6b6b76eda6e76da9fac57f4e9fafb6753/
        mips |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/534002bf7f08b8722acda70b58f5a7f5d3b75457/
        i686 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/3f6c89f994148816625ecf9d15de0d8e8e73374d/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/293079847b9a9c203e3e6684a810a3f7181d2290/
         arm |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/6c289e92e9758cdd3ed641fad03817272b23ccfb/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/e672db7fb81033c7c3cd8e22c540f18117a7a61f/
       sparc |                  openal-1.17.1 | NOK | http://autobuild.buildroot.net/results/b9c03dedcbe5cb32d0bdab5d27c9b9acf7d1a523/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/4b90245bff3976514090fd7bd2c5f4941d02b917/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/d5d30f93dbe7761d64c36dd0332d3ebfcdd8e583/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/4db355e2f4e317027c86e0f1595fe6d27f699933/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/0c0a765ab80e962c8836c9ce1e4e3cfe9432421e/
       sparc |                    redis-3.0.5 | NOK | http://autobuild.buildroot.net/results/9662c705bd505a801cff15e2797bdbd98f61f599/
         arm |                 rt-tests-v0.89 | NOK | http://autobuild.buildroot.net/results/cae79afc856568c710e0dae3ff00ecb25cd95747/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/a48175ca152ad83bf07c4b3ccce53b2d3dec23de/
         arc |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/37ef4b5806e7607916c28bdb06c01b67230188cd/
     powerpc |           sane-backends-1.0.25 | NOK | http://autobuild.buildroot.net/results/61c1dbc84f3ffecc71a34c007e7d375ca370f902/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/bbb90c095c7d82e9187c87e239ba095f7390b147/
    mips64el |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/65c62d63f3c6cac0e7d6d17c4f839cbe9a8e7131/
     sparc64 |              stress-ng-0.04.16 | NOK | http://autobuild.buildroot.net/results/3de7c5951e71e5952b05ba07ab027fe42553e4fb/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/a4408327f74c664b75a59b259151e0656a712276/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/a86070610e0c092763c7c3cd2566f591984bdb94/
    mips64el |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/2fa443f7d1f7a10a70855eb97bafa1a9bf6e47b2/
         arm |                       tar-1.28 | NOK | http://autobuild.buildroot.net/results/f9f0db6ac6f92c09b954aa82ba34b5072fffad42/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/c58688ab237a693d457bf8ceede0ee8a369210b2/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/3521919b772add17f6526c8b993f0d42698021f1/
        i686 |                        unknown | NOK | http://autobuild.buildroot.net/results/ed7229efa77eaddc71f2451b00f6936ecf840b2e/
       sparc |                        unknown | TIM | http://autobuild.buildroot.net/results/45a9be7f6b70bf560633fc7751373d70d0d4dc2f/
         arc |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/4f4c9210ffcd26b8297a5154a1d1a08ae5345312/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/bb446074495a0828bb0aaec252f81829f078ae08/
        mips |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/99227b6f39f734e14ecd96326dfc5ea60e7d4a51/
         arm |                     vpnc-0.5.3 | NOK | http://autobuild.buildroot.net/results/0661d1f7a51512e8de13f01f1ac781a9589ff89f/
      x86_64 |              webkitgtk24-2.4.9 | NOK | http://autobuild.buildroot.net/results/742e2498d4412b72326eff7e0835bfee246b683a/
        mips | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/ece05ecd1d14251829530948ecd7de5a7d3af043/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/db344fd0b69a6316e6c3c83285c4969db0638f77/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/8c0d4d70d5afacfe79dc286968f0b290010179da/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/9c3e34a4227764b47b3942a10810ce0531eeb290/
         arm | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/7743e1530df497ed555e062113c0d83749375adb/


-- 
http://autobuild.buildroot.net
