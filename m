From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 25 Jan 2016 08:30:17 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2016-01-24
Message-ID: <20160125073017.E9D071028B1@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2016-01-24
===============================

        success : 213
       failures : 67 
       timeouts : 4  
          TOTAL : 284

Classification of failures by reason
====================================

zbar-854a5d97059e395807091a... | 5 
iputils-c8ff6feaf0442f8efd9... | 5 
        ltp-testsuite-20150903 | 4 
                  boost-1.60.0 | 4 
                   erlang-17.5 | 3 
                 rtptools-1.20 | 3 
                 opencv-2.4.10 | 2 
                sqlite-3100200 | 2 
                iptables-1.6.0 | 2 
               host-efl-1.15.3 | 2 
host-gdb-6be65fb56ea6694a92... | 2 
                    sox-14.4.2 | 2 
                      qt-4.8.7 | 2 
                       unknown | 2 
             util-linux-2.27.1 | 2 
                   libnss-3.21 | 2 
                  prboom-2.5.0 | 1 
                 libdrm-2.4.66 | 1 
               tcpreplay-4.1.1 | 1 
         xdotool-v3.20150503.1 | 1 
               valgrind-3.11.0 | 1 
                nodejs-0.10.41 | 1 
                  trinity-v1.6 | 1 
                 setools-3.3.8 | 1 
               qt5webkit-5.5.0 | 1 
                   jamvm-2.0.0 | 1 
              gst1-libav-1.6.3 | 1 
                    neard-0.14 | 1 
               dvbsnoop-1.4.50 | 1 
make[6]: *** [all-recursive... | 1 
code/CMakeFiles/assimp.dir/... | 1 
             netbsd-queue-1.70 | 1 
                grantlee-0.5.1 | 1 
                           all | 1 
                 mesa3d-11.1.1 | 1 
make[1]: *** wait: No child... | 1 
                    ruby-2.3.0 | 1 
     host-google-breakpad-1373 | 1 
flann-04b4a56533faf8c8228d0... | 1 
                 opencv3-3.0.0 | 1 
             bluez5_utils-5.37 | 1 
                bind-9.10.3-P2 | 1 
                  connman-1.31 | 1 

Detail of failures
===================

microblazeel |                            all | TIM | http://autobuild.buildroot.net/results/5c6804aef4c5e07b69c1ddc301424d0729b01672/
    mips64el |                 bind-9.10.3-P2 | NOK | http://autobuild.buildroot.net/results/37e59b775a3609b01f0fbf942b74117c56d41be5/
         arm |              bluez5_utils-5.37 | NOK | http://autobuild.buildroot.net/results/eb308bb2b234557bfa4c34b6014a9f9ba018a14f/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/2e11885ef53341eac30efc0c866f819ef7c1946b/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/b8c1bb354fbc144f7537efd8eb5e8c32ed2d5c2c/
    mips64el |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/869a2e01fd8aab90fd98405bee9812b6ddea68d0/
         arm |                   boost-1.60.0 | NOK | http://autobuild.buildroot.net/results/1e043c22e4d59a6ea9fd3cc39d56b76c17952942/
microblazeel | code/CMakeFiles/assimp.dir/... | TIM | http://autobuild.buildroot.net/results/25e4d300512a45fa0c718f6c99b6b82051a56252/
         arm |                   connman-1.31 | NOK | http://autobuild.buildroot.net/results/7f008a8c79bfc8dbfd7c2b94a2281ac08d497930/
      x86_64 |                dvbsnoop-1.4.50 | NOK | http://autobuild.buildroot.net/results/c978a9dadab6e74742011f4c8b682cdf5ebcb82e/
         arm |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/c32de19dd4f8288973d480fa92bc12124bcd0980/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/591eb661781d8acf800ce66bf38f3bde9410d539/
       sparc |                    erlang-17.5 | NOK | http://autobuild.buildroot.net/results/2056a2b2c7f7856a67aa548dce0f616ad2d8c491/
microblazeel | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/4cab6b1a649b5b7d6a835b338d40b94fc102f1d8/
         arm |                 grantlee-0.5.1 | NOK | http://autobuild.buildroot.net/results/1208a1886357c46a0394fda29da1f5e86e334116/
        mips |               gst1-libav-1.6.3 | NOK | http://autobuild.buildroot.net/results/2027fc76d64ce81e9014e9fa4f86f9a5730a4b30/
        sh4a |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/5c79ca2f76efa6c56ca31d2d5b438d33eb900c2e/
      mipsel |                host-efl-1.15.3 | NOK | http://autobuild.buildroot.net/results/a52ccfecd38ffcf0074ea9aca4c560ca4a797e49/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/61e483ec13ca0e7392b896fc25ed44e4f9e5426b/
microblazeel | host-gdb-6be65fb56ea6694a92... | NOK | http://autobuild.buildroot.net/results/69314b8ee675df64fc1ebff1072637bcbbd98376/
         arm |      host-google-breakpad-1373 | NOK | http://autobuild.buildroot.net/results/67b33becd9610f9e46227710064fbc358cbc5337/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/a7c366362a28327a38ee1de138ab7304a7dec16a/
        bfin |                 iptables-1.6.0 | NOK | http://autobuild.buildroot.net/results/77cb42251c2a6956852fb61bd01a8b1b13b53a9f/
         arm | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/0dc6d49cc407a4ac80a342af38391f3eb630e288/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/540ec665bd72ea3eadee21b7b1c983efd656196e/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/bef0f00cdf599e264800eb084e49438ec96ab1ac/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/f0b10c1970693b4d1a6a4135db27ba4a78a0eaf7/
         arc | iputils-c8ff6feaf0442f8efd9... | NOK | http://autobuild.buildroot.net/results/e1846a0b55a745566efc33e8b5a3fa2e9e2fd436/
         arm |                    jamvm-2.0.0 | NOK | http://autobuild.buildroot.net/results/931a005fab39f22bda0fd8c249f3e4d1f5eba4cc/
         arm |                  libdrm-2.4.66 | NOK | http://autobuild.buildroot.net/results/c19ea04c1e5afedeec62c79c79e3a3795fd8565d/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/a32af7a29bacc602193300aef26462e229a4a023/
      x86_64 |                    libnss-3.21 | NOK | http://autobuild.buildroot.net/results/07f2bcdf58daa66147ee0bbbaa614c0cb67f72b5/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/368cbf65b635af5323381cdb65739da01bb98453/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/cfbeb85ede78caa693b944c646ab2ade4778f6b8/
     sparc64 |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/3e5f828ebe4e123ddbcfcbc4b99ea6b89da8c814/
      mipsel |         ltp-testsuite-20150903 | NOK | http://autobuild.buildroot.net/results/f15502c83d5522f0b3f88acf28bbc3ae30fcbf68/
microblazeel | make[1]: *** wait: No child... | TIM | http://autobuild.buildroot.net/results/a193111b2f84ef29a4a8ff5dcbcf5cdba3be5acb/
microblazeel | make[6]: *** [all-recursive... | TIM | http://autobuild.buildroot.net/results/b31326aaa8c660129410ec7851bb2dd272736237/
       sparc |                  mesa3d-11.1.1 | NOK | http://autobuild.buildroot.net/results/01539dc546ac4515211151fd85a72eccd0ea89b1/
       sparc |                     neard-0.14 | NOK | http://autobuild.buildroot.net/results/b8bf7be2efd8e8e369abdde0a5bec564e8cd6f23/
      x86_64 |              netbsd-queue-1.70 | NOK | http://autobuild.buildroot.net/results/cc4e522d6226e51b1395fbb4f901b3d5405445ca/
      mipsel |                 nodejs-0.10.41 | NOK | http://autobuild.buildroot.net/results/6dcdb00c16b0e9c488eed81e6e718e28a88609b0/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/1767748fd1ea3ceadb6221ff7dd9522db01522c5/
     sparc64 |                  opencv-2.4.10 | NOK | http://autobuild.buildroot.net/results/085bde35e51a74a246b91ed0adf0e65d8e183eca/
         sh4 |                  opencv3-3.0.0 | NOK | http://autobuild.buildroot.net/results/3fb0e8a0e94170772e9a203210b679ec79e56263/
        sh4a |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/55fcd64980a7c4ca3528f1fd75ee83dddb7e11d3/
       sparc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/c28a494e939ec03f552352d533b0a342862f6419/
       nios2 |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/55b19bbeabd09464224d9f1d2a02f5adbc9f483c/
      mipsel |                qt5webkit-5.5.0 | NOK | http://autobuild.buildroot.net/results/6e44bd3299c9d96189f93d271650a1bc0a45b6dc/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/12f9608d1de2e0c277573ef1b779b5360baa0399/
      mipsel |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/f8cdf4e9a1cf9fa3d120929dfa329409daeae3c7/
    mips64el |                  rtptools-1.20 | NOK | http://autobuild.buildroot.net/results/09c1e6de5ce409830809774a422310e118b2b745/
        bfin |                     ruby-2.3.0 | NOK | http://autobuild.buildroot.net/results/595db48456d4e6dcf79e51c797c94f10f9dc3c10/
     sparc64 |                  setools-3.3.8 | NOK | http://autobuild.buildroot.net/results/3576e3969d5522d15caf8267ed068709c251a205/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/8063d652007cee0fb2d96e9bfbcf9f8b9b7758e0/
      mipsel |                     sox-14.4.2 | NOK | http://autobuild.buildroot.net/results/d957b5520ddbbc8f471b241bb2d9e0eefd28efce/
        i686 |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/a4741896e85567962041df1384a535c3404b5e90/
         arm |                 sqlite-3100200 | NOK | http://autobuild.buildroot.net/results/289edb2106c95a0c71ec2d348fac8d8c081faba1/
         arm |                tcpreplay-4.1.1 | NOK | http://autobuild.buildroot.net/results/47afd22b6adf4e6cc61ca03f05f0d27ba71441c2/
      x86_64 |                   trinity-v1.6 | NOK | http://autobuild.buildroot.net/results/1ac81ff9842f185cde2bead7914650ab0dbc0c9c/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9a6437d3ae941d64bf6b1b8fd19926d1a5c1d449/
         arm |                        unknown | NOK | http://autobuild.buildroot.net/results/9e0453a241d08409b15dbf59ef66b4010a219d05/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/ce33a88bcdc9deb37d3dbdfd478bf3a95dcc9213/
         arm |              util-linux-2.27.1 | NOK | http://autobuild.buildroot.net/results/64d9d2c64f3e756c802579935cfbc29713567152/
    mips64el |                valgrind-3.11.0 | NOK | http://autobuild.buildroot.net/results/25828162619a879fac67e91ab888523de1d9990c/
        bfin |          xdotool-v3.20150503.1 | NOK | http://autobuild.buildroot.net/results/d750919a0d5cfb624937c72253651a431212e238/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/aeee6e89ff2467f8c9b936fbe77ad2e6870e792c/
        mips | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/c4b08646404e064094da5941439146f2d73de8c3/
    mips64el | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/d715326dc45e830af7dbf4ade19b865d561cdd40/
       nios2 | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/ff1201fad77a14e6fed2b9bca189616b7946a72f/
        mips | zbar-854a5d97059e395807091a... | NOK | http://autobuild.buildroot.net/results/299dc845af082167085d366b38daf1dfd95d7047/


-- 
http://autobuild.buildroot.net
