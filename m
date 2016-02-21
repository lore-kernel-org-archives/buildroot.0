From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Feb 2016 08:30:18 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-02-20
Message-ID: <20160221073018.23C8B102DDF@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-02-20
===============================

        success : 217
       failures : 59 
       timeouts : 2  
          TOTAL : 278

Classification of failures by reason
====================================

                numactl-2.0.11 | 5 
               pax-utils-1.1.4 | 4 
                      qt-4.8.7 | 4 
        ltp-testsuite-20150903 | 3 
               valgrind-3.11.0 | 2 
                 mesa3d-11.1.1 | 2 
                 libdrm-2.4.66 | 2 
iputils-c8ff6feaf0442f8efd9... | 2 
                    php-5.6.18 | 2 
             fxload-2008_10_13 | 2 
                    mosh-1.2.5 | 1 
make: *** wait: No child pr... | 1 
                  boost-1.60.0 | 1 
               libcap-ng-0.7.4 | 1 
               trousers-0.3.13 | 1 
                       unknown | 1 
                   hostapd-2.5 | 1 
                  lshw-B.02.17 | 1 
                     nut-2.7.2 | 1 
                pinentry-0.9.4 | 1 
                 opencv-2.4.10 | 1 
                 libraw-0.17.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
              rabbitmq-c-0.7.1 | 1 
               libgtk2-2.24.29 | 1 
                  stunnel-5.29 | 1 
                   mplayer-1.2 | 1 
     host-google-breakpad-1373 | 1 
           linux-zigbee-v0.3.1 | 1 
              quagga-0.99.24.1 | 1 
             ipsec-tools-0.8.2 | 1 
                 igmpproxy-0.1 | 1 
               nfs-utils-1.3.3 | 1 
                  squid-3.5.14 | 1 
                 rtptools-1.20 | 1 
                     vlc-2.2.1 | 1 
                   redis-3.0.7 | 1 
                libgpgme-1.5.5 | 1 
canfestival-7740ac6fdedc23e... | 1 
                  connman-1.31 | 1 
                  trinity-v1.6 | 1 
 make[1]: *** [all] Terminated | 1 
                   erlang-17.5 | 1 

Detail of failures
===================

microblazeel |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/4cace386339f6855874a13e9de4fd3c799d8054a/
         arm | canfestival-7740ac6fdedc23e... | NOK | http://autobuild.buildroot.net/results/e5e21cd1a737380721050c059ed8c3f6b22263c7/
      x86_64 |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/aeb990535a5b7a65762e1648339d9e70a61f44db/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/d7e8b572b772652a3915bc0aee0cf1780fd4b706/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/c27f57c01bc1b357c58cbb35aac6d08e1824c6c0/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/197e9d2819ff83c48a2bd50b5f97cbe883f0dfac/
microblazeel |              fxload-2008_10_13 | NOK | http://autobuild.buildroot.net/results/2d9e8aff62a71b78dd6153307f4b3516878e35f8/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/9a79b6cfb4022e5857124405368f906fbee2ebae/
      x86_64 |                    hostapd-2.5 | NOK | http://autobuild.buildroot.net/results/61f329b1f503b7a2ae5b7ba2399683a82a83a79a/
         arm |                  igmpproxy-0.1 | NOK | http://autobuild.buildroot.net/results/e7cf35132ce8f85d37402f7fc7c2c0139cb5da7b/
      x86_64 |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/f10be187b1fd7b53a7ac1f9295a854c9ac7b79d5/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/be8bbc5aaec209f1f0b8fc99418fc5559341a8a9/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/d7ac32dcc34b1d57f3ee6d33280fb810856ed85b/
       nios2 |                libcap-ng-0.7.4 | NOK | http://autobuild.buildroot.net/results/7aad41e0a3b3ecd8fcab570690164526c592f5d7/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/8278ee1f7a4b8d032ce39ec2f17ce240cbe8c85f/
      x86_64 |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/eb38dbcc88ebbaaa59af0c7bc5cfdd1e557c310a/
         arm |                 libgpgme-1.5.5 | NOK | http://autobuild.buildroot.net/results/2199c1b2651e106573677d1de87c1267ea789e30/
         arm |                libgtk2-2.24.29 | NOK | http://autobuild.buildroot.net/results/1935451ab5bf646df6e99802f9ce34be4a5fe714/
         arc |                  libraw-0.17.1 | NOK | http://autobuild.buildroot.net/results/e67e10780f129002bfcab0ae3692302d2e527bd1/
         arm |            linux-zigbee-v0.3.1 | NOK | http://autobuild.buildroot.net/results/7be7e66ae451fa2e620b4c2b7e3b70ebfe848c28/
        bfin |                   lshw-B.02.17 | NOK | http://autobuild.buildroot.net/results/6d7d2034836e0d8705bba2f2597d3e1cde2c43b8/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/36114d4d83d5a32bb5389494a8a19c7f3558f177/
       sparc |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/a54c6747b294472b2d25babc9eb360f3b90b5de9/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/9281cbe12b3e36fe69e073d06e68b1f42eb5d843/
microblazeel | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/b1c4d38beaf3194f6dc7e81a7187d7c597e6499b/
        i686 |  make[1]: *** [all] Terminated | TIM | http://autobuild.buildroot.net/results/b1d758416d8cd752c7ac4343789400467498bd60/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/3b57e2f3ce1e26e38dad443fe615f090ef85a957/
microblazeel |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/c9608d86807c65f7098b352a483d8ec8297a0376/
      mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/ff4e29fa22f0ec3b07885e0d0f0b7f7e22bae813/
     aarch64 |                    mplayer-1.2 | NOK | http://autobuild.buildroot.net/results/10eba169697677d25467648e86990ffbebbc491d/
     powerpc |                nfs-utils-1.3.3 | NOK | http://autobuild.buildroot.net/results/5ee818b20c84c0a43da63ae1ba1ff1287a7d0a02/
      mipsel |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/1c1f097b2bc1bd45fa9baf9ef623224b94695344/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/fdf8a5b5dff8e9f9c276f4a22a2f7ddfe8c85b3e/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/b337b75c0ebf6f1d206c242de2a731713c5aa05e/
        i686 |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/000f028a5993871fd9d20388af1bd453692567a9/
     powerpc |                 numactl-2.0.11 | NOK | http://autobuild.buildroot.net/results/53efd74ff2ef453775c73550ef17c045e568f8b5/
         arm |                      nut-2.7.2 | NOK | http://autobuild.buildroot.net/results/679355424dec50779d11edc5d40beef4bf251cca/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/895f90cf4d7ef307dab9466801aa001833cd3953/
        i686 |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/bfc792de565c18b19dffdea609f88efe20907c1f/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/bf2c5024ef4054fd2aa2c5f4475acd69ac53c59e/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/8a4fe613a939a337eaf0f07b423d44ab2e68acd8/
     powerpc |                pax-utils-1.1.4 | NOK | http://autobuild.buildroot.net/results/675cfb101d81494ccfa81817eb14267928165b20/
         arm |                     php-5.6.18 | NOK | http://autobuild.buildroot.net/results/cf68e473ec2f8c4d5ed0399b44e0b266e7ab876b/
        bfin |                     php-5.6.18 | NOK | http://autobuild.buildroot.net/results/e4e4f915ec0c5fc3883c716927e9724877fc30e9/
         arm |                 pinentry-0.9.4 | NOK | http://autobuild.buildroot.net/results/bf47edc54d44040354fd95b7d1ee6ac3f28b3921/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/abf5311b749c6644caae768c0c35f9ba3cad2213/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/9e3310d38a332d81dffa490e0580d2e2d0ec9d09/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/e67489f34f52018d85731343af986bd5bfa417d2/
         arm |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/61a412423bb7c868aef250a5d239fb2c58be6ebc/
         arm |               quagga-0.99.24.1 | NOK | http://autobuild.buildroot.net/results/e4c83daecb8c0e7d46a5e08eb6e16900892cf691/
         arm |               rabbitmq-c-0.7.1 | NOK | http://autobuild.buildroot.net/results/ddbf3899f5c38477c644f60f65207e1770966b15/
       sparc |                    redis-3.0.7 | NOK | http://autobuild.buildroot.net/results/44ba8dec9bf1154786654a3c82cb149aa9dab971/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/7af81ad7bb26188abb44369bc75c4a8fbfd000fe/
         arm |                   squid-3.5.14 | NOK | http://autobuild.buildroot.net/results/889ac02d37807830c955dbbd346d9e13574cc653/
      mipsel |                   stunnel-5.29 | NOK | http://autobuild.buildroot.net/results/3d37334a8fc8167c38229f5bb26a0f2c1a5990a1/
        i686 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/b59ed06f5120390ed6ea6603fdc35eeccd1f923c/
         arc |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/846675c7f11ecd6fe972c6844c06c615109bc82c/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/fb07b2e5e55412adc99947ee579bef99dd151b29/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/72bd3bb3722b2a15665d04ff99f0d26fabe00dad/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/f132cf4f1bd05bf6bdc22ba96e143611a2e3a220/
microblazeel |                      vlc-2.2.1 | NOK | http://autobuild.buildroot.net/results/392bde2e4e4383a8473f0ffa18559d791638d888/


-- 
http://autobuild.buildroot.net
