From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 24 Aug 2018 08:00:19 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-08-23
Message-ID: <20180824060019.899B4207B1@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-08-23
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  17 |   0 |   0 |  17 |
   2018.05.x |  15 |   1 |   0 |  16 |
      master | 173 |  14 |   2 | 189 |
        next |  24 |  21 |   2 |  47 |

Results for branch '2018.05.x'
==============================

Classification of failures by reason
------------------------------------

                qt5base-5.10.1 | 1 


Detail of failures
------------------

microblazeel |                 qt5base-5.10.1 | NOK | http://autobuild.buildroot.net/results/fcddfa65490fff5f2010a6f15575b0f1d0f54b70 |     

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

                     php-7.2.9 | 4 
                 host-rauc-0.4 | 2 
               azure-iot-sdk-c | 1 
                  boost-1.67.0 | 1 
                    brltty-5.5 | 1 
                    f2fs-tools | 1 
gstreamer1-editing-services... | 1 
                 mesa3d-18.1.5 | 1 
          openpowerlink-V2.7.0 | 1 
                poppler-0.59.0 | 1 
           python-numpy-1.13.3 | 1 
                      qt-4.8.7 | 1 


Detail of failures
------------------

         arm |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/cbd0817b36645ff8489e1473b0c68b985553ff80 |     
        mips |                   boost-1.67.0 | NOK | http://autobuild.buildroot.net/results/7e04b351e03bd3a8ec8ded69a298218a1d405365 |     
microblazeel |                     brltty-5.5 | NOK | http://autobuild.buildroot.net/results/77a706c5f814844e4372212626f6a18989af1880 |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/b3537f226f47e3e750b12b7e15503e78bf9d8944 |     
      x86_64 | gstreamer1-editing-services... | NOK | http://autobuild.buildroot.net/results/2b721948debd441ffe9e25f943875a29a21bd0bd |     
        i586 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/7e1cbeb458cb6536a36eae0d24cefb36edb22f55 |     
      x86_64 |                  host-rauc-0.4 | NOK | http://autobuild.buildroot.net/results/1b32b5daf5d3e3cf77e6779af7d9b79ce7e6a8e5 |     
      x86_64 |                  mesa3d-18.1.5 | NOK | http://autobuild.buildroot.net/results/35653fc6f57dc169a8aae6baedb1acd1049b50ec |     
      x86_64 |           openpowerlink-V2.7.0 | NOK | http://autobuild.buildroot.net/results/e543a192f23881c8342f44bdadd6205cdb155a23 |     
     powerpc |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/6d7779fbb5b65bf8dda10210c15e40f1b54c15a0 | ORPH
       nios2 |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/37b938da0a5f142e17271fdbfa950e67ef9fd5dc | ORPH
         arm |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/e04ae89159401dccb0927fa51f416ce7ded9b505 | ORPH
  aarch64_be |                      php-7.2.9 | NOK | http://autobuild.buildroot.net/results/8c6ede9992c7134192ee7d14b29dcd916045932f | ORPH
         arm |                 poppler-0.59.0 | NOK | http://autobuild.buildroot.net/results/814c6e8a9dac9db734f60fa8ef8f5a471d3a2cbb |     
     aarch64 |            python-numpy-1.13.3 | NOK | http://autobuild.buildroot.net/results/29737d2fdd94a74fe38672a4edf03167be5dfb45 |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/48928ae84beaa7b7784767f9afdfba4793aeaa13 | ORPH

Results for branch 'next'
=========================

Classification of failures by reason
------------------------------------

                  boost-1.68.0 | 5 
        host-python-lxml-4.0.0 | 2 
              ptpd2-ptpd-2.3.1 | 2 
python-libconfig-b271c3d9da... | 2 
             python-lxml-4.0.0 | 2 
                rtorrent-0.9.6 | 2 
               azure-iot-sdk-c | 1 
                    f2fs-tools | 1 
              glibc-glibc-2.28 | 1 
         host-e2fsprogs-1.44.2 | 1 
           host-libselinux-2.7 | 1 
                    ncmpc-0.30 | 1 
               target-finalize | 1 
                  tini-v0.18.0 | 1 


Detail of failures
------------------

         arm |                azure-iot-sdk-c | TIM | http://autobuild.buildroot.net/results/ea1755f0db53f7fcf13c69c2b8b31135b13df310 |     
     sparc64 |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/e1ac3d4583e09968b4561c960ce9abe8542503b8 |     
       sparc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/a60e84ce0a7a970ba1b2a01bb49ec2deefe1946f |     
     powerpc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/44cced6b7525b098fb5b070e582b409d635fc7ab |     
        m68k |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/fa10e27f4b5e5814e1b8d28ad563d32f36dd44c7 |     
       sparc |                   boost-1.68.0 | NOK | http://autobuild.buildroot.net/results/8e184e95c490fda8d04c8498737d36cab4feaa93 |     
         arm |                     f2fs-tools | TIM | http://autobuild.buildroot.net/results/ef6855772b1236eac52e1ded1c2838475abdabeb |     
         arm |               glibc-glibc-2.28 | NOK | http://autobuild.buildroot.net/results/31a1030df4dc9c7f446edeeba258cc389bea1759 | ORPH
    mips64el |          host-e2fsprogs-1.44.2 | NOK | http://autobuild.buildroot.net/results/33205c9e748c9bdb2225e2e7ccf9ecbb5a97a54b | ORPH
         arm |            host-libselinux-2.7 | NOK | http://autobuild.buildroot.net/results/60ea512ba16c3d8cbe41f7f42d5381456eafcc4c |     
         arm |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/2cef9ca5ef24ddc72030e9362ad66f47d3408b7e |     
      xtensa |         host-python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/46beeb8818ca7cf0d9934cdbc5c967f0875c4bde |     
        or1k |                     ncmpc-0.30 | NOK | http://autobuild.buildroot.net/results/1ad953bcb7fcba9d9a16ec34128d54bb8df450de |     
     sparc64 |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/f54c6fd841b3ea77dc12048c81f3f2991b679252 | ORPH
    mips64el |               ptpd2-ptpd-2.3.1 | NOK | http://autobuild.buildroot.net/results/332bc77bcde0bef1b2fd7b9993409dd051c27cd6 | ORPH
    mips64el | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/c83ffc04cbed89dd9faeae83cedf64b291d47b41 |     
         arm | python-libconfig-b271c3d9da... | NOK | http://autobuild.buildroot.net/results/981aba5b64af20fec969538a6af7f36626a08a80 |     
      xtensa |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/1a92b3c9b3484d4d9dd6cd3b2956e45233be280e |     
      xtensa |              python-lxml-4.0.0 | NOK | http://autobuild.buildroot.net/results/731df84d0110c1bdb326ada166e9e6f3eafa65dc |     
    mips64el |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/a75df787140f14628edb1929ab28a8d395c77d22 | ORPH
         arm |                 rtorrent-0.9.6 | NOK | http://autobuild.buildroot.net/results/c44238d79bc9eee64aae62254ca92f1d04c94712 | ORPH
microblazeel |                target-finalize | NOK | http://autobuild.buildroot.net/results/bcc33eed73219c88168d14d8fb827cc97a4a8518 |     
        m68k |                   tini-v0.18.0 | NOK | http://autobuild.buildroot.net/results/410ad9ea6a6652a7db691f537acb38db279b996a |     


-- 
http://autobuild.buildroot.net
