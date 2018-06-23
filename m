From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 23 Jun 2018 08:00:22 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2018-06-22
Message-ID: <20180623060022.2632920794@mail.bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2018-06-22
===============================

      branch |  OK | NOK | TIM | TOT |
   2018.02.x |  11 |   0 |   0 |  11 |
   2018.05.x |  11 |   0 |   0 |  11 |
      master |  95 |  32 |   0 | 127 |

Results for branch 'master'
===========================

Classification of failures by reason
------------------------------------

               iproute2-4.17.0 | 9 
              host-erlang-21.0 | 5 
            qt5base-legal-info | 4 
        host-protobuf-c-v1.3.0 | 3 
               mono-5.12.0.226 | 2 
            host-json-c-0.13.1 | 1 
           host-protobuf-3.6.0 | 1 
                    host-rustc | 1 
               keyutils-1.5.10 | 1 
                 libnss-3.37.3 | 1 
              mjpegtools-2.1.0 | 1 
                      qt-4.8.7 | 1 
              qt5charts-5.11.0 | 1 
              webkitgtk-2.18.6 | 1 


Detail of failures
------------------

      mipsel |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/b6f832ed2f998e922e91478e45489d396d200e6c |     
         arm |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/d793fdafa2c536ad683e59d3db1eda52a6d77031 |     
      x86_64 |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/9eccef1e29b7f093c8da1899dedbb7aff1c84d52 |     
         arm |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/39d9f9e5a24999ee62b9ed8d9e4451d4aab0d990 |     
     sparc64 |               host-erlang-21.0 | NOK | http://autobuild.buildroot.net/results/0a536785c4e3ea20490ea62388ceaf932ec38d35 |     
         arm |             host-json-c-0.13.1 | NOK | http://autobuild.buildroot.net/results/455e4db12eae2916d16f96f238f703918d146cb4 |     
      xtensa |            host-protobuf-3.6.0 | NOK | http://autobuild.buildroot.net/results/c7e25aa2dfbaba078c4666594ce9e4640608630d |     
      x86_64 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/8b3cbda61eea2881b43d5449e3d19ceb1e099d4f |     
   powerpc64 |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/88806e344c21cbd514c2943f48dd08a07f631d72 |     
        or1k |         host-protobuf-c-v1.3.0 | NOK | http://autobuild.buildroot.net/results/aede304b2e650f7058d971b54ed6e5c56189a587 |     
      xtensa |                     host-rustc | NOK | http://autobuild.buildroot.net/results/fd6c256b8754782d6d84b46dc1d962fe4afc2ca5 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/7afa3c16b1b0bb5424e80dd834dff7d683085600 |     
      xtensa |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/a94c2e032f31404e40e6a9fd6316ff7dcb69389b |     
      mipsel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/5ebc996f1ae5c968a22b22603ae9704a9fb7f724 |     
      x86_64 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/128da369ebc025621ae09b77423c852b47959913 |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/3ebc49ec1f6d6897fe0e223ce93167a2e6a8b275 |     
         arm |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/04b9c0e9f1c0793e5b11872bb64d25e99cfdef53 |     
      x86_64 |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/23d7f785b56d5dbbe4146c3752739bb85e238733 |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/120c843b42c74a31d3a76af873b046d0bf089fd7 |     
microblazeel |                iproute2-4.17.0 | NOK | http://autobuild.buildroot.net/results/43c8cf82370600eabd9b2f3b39495bb3ed23d83f |     
    mips64el |                keyutils-1.5.10 | NOK | http://autobuild.buildroot.net/results/0e80d2f3c5fa5d7244dc18e5fced281dbbd441f4 |     
         arm |                  libnss-3.37.3 | NOK | http://autobuild.buildroot.net/results/fbd5d262326486028a89a4a35d9d350a260940fa |     
     powerpc |               mjpegtools-2.1.0 | NOK | http://autobuild.buildroot.net/results/04985f8751266e8e394a69f24ea9f3d4c037c582 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/02ae8b87031d7725883910bc4ba835acd50d4e47 |     
      mipsel |                mono-5.12.0.226 | NOK | http://autobuild.buildroot.net/results/a10b3be2b800b5c2138aca75593d36e2147a365e |     
     powerpc |                       qt-4.8.7 | NOK | http://autobuild.buildroot.net/results/25c5931409e3e3984429fa4f4873df5face3ec9d | ORPH
    mips64el |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/29cbc673160d8103d0aa5e95216934823e079497 |     
     sparc64 |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/d865b99b184eba4118b1cf9daecab5f9e6051b32 |     
     powerpc |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/921ee7d92c0fa0815766d933da29fb0373a3c8e1 |     
        mips |             qt5base-legal-info | NOK | http://autobuild.buildroot.net/results/f4dd2b5cdc769ae46fd3de5a972c3722fff730d8 |     
      mipsel |               qt5charts-5.11.0 | NOK | http://autobuild.buildroot.net/results/b73ead3a0c9ffe1eca8739ceabfe2fec44fef7b3 |     
      x86_64 |               webkitgtk-2.18.6 | NOK | http://autobuild.buildroot.net/results/187796535af53ece426641ff7d88aabada281674 |     


-- 
http://autobuild.buildroot.net
