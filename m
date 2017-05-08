From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 May 2017 08:28:35 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2017-05-07
Message-ID: <20170508062835.044A8207F0@mail.free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Build statistics for 2017-05-07
================================

      successes : 205
       failures : 46 
       timeouts : 1  
          TOTAL : 252

Classification of failures by reason
====================================

           host-protobuf-3.2.0 | 23
        ltp-testsuite-20170116 | 5 
                    radvd-2.12 | 3 
                    mpir-3.0.0 | 2 
                    mpv-0.25.0 | 2 
                 qt5base-5.8.0 | 2 
                    cups-2.2.3 | 1 
                  daemon-0.6.4 | 1 
                    ffmpeg-3.3 | 1 
kvm-unit-tests-5731572b2ac2... | 1 
make[1]: *** Waiting for un... | 1 
                  ntp-4.2.8p10 | 1 
                 opencv3-3.2.0 | 1 
               pulseview-0.3.0 | 1 
               qt5webkit-5.6.2 | 1 
             rabbitmq-c-v0.8.0 | 1 


Detail of failures
===================

         arc |                     cups-2.2.3 | NOK | http://autobuild.buildroot.net/results/fe7fda3a1975571523558d02c8396deda7b65f9c | ORPH
        m68k |                   daemon-0.6.4 | NOK | http://autobuild.buildroot.net/results/3338539743c8b0399c6b0fcbbb7c28b58bf3f387 |     
        m68k |                     ffmpeg-3.3 | NOK | http://autobuild.buildroot.net/results/dc5a042952c3f1f6a6fa06db0e7ac70f701c50dc |     
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6785eb2c6fba73885df7f586409dc7193f70429f | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3474b2dcab2aa232f569c84b62320dc6a9411a23 | ORPH
        i686 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/00058baa19bd8e44529bc28026bd2bd3e8968f35 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/2b2a266ae7ad2edd9875c136811e98aafc38b9a0 | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/51c5c7865767b7f1589bc642e6e6170ee98afda3 | ORPH
        i586 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/809a9c5b895475a6f5ab787edb8faa25bfde940f | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1ed0f3b179fc0e506406fd13c0c24e36950a8169 | ORPH
    mips64el |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/c9213690ed53b61da87bb726298bdb9e527dd682 | ORPH
        mips |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1d50ed79447633047eb9d073d6658fdac9798afd | ORPH
      xtensa |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/3dfac664efaf109eaa2e56a282501575d1fd5155 | ORPH
      x86_64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/135f7147f3e55ebb5ade85f01149569a59551ca2 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fde45fe33c3832a81c1952d67eb04d19e25c9c24 | ORPH
     powerpc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/5f2fa5a677c74a8b661057ead480e683f6fd8867 | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/787d8132a6ffa1ed27e67fff5f5a075a38b092e9 | ORPH
         sh4 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/778b13b8b3d6868aba9d6b41dcf6afb62b5accdd | ORPH
         arm |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/1311e642c7af0411c5e9e8384477ae25588c1696 | ORPH
      mipsel |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/fefe457471b6819a59fe9275d34765739e92a90e | ORPH
       nios2 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0424a2c6203890d3835bbc66f2b5a6ac94b596c5 | ORPH
       sparc |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/0be3a50a8a92152aca9c40cc77a566fbbed5fb5d | ORPH
        or1k |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/f60cae991544eb2c3940e17db9d12a29c76133c6 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/271311e6c2138beac6c66463ecf9ca60cd0d37d8 | ORPH
     sparc64 |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/572cd899ae3bf4ae20e67578a1de7ff584fcb297 | ORPH
 powerpc64le |            host-protobuf-3.2.0 | NOK | http://autobuild.buildroot.net/results/6918b5950e600ed3cd72d8e48bf974b73b1bcc80 | ORPH
      x86_64 | kvm-unit-tests-5731572b2ac2... | NOK | http://autobuild.buildroot.net/results/a4a65d01f049db83a93de92660f228dd18532625 |     
         arc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/2eccf9f517ab15d8d459b06195423fdfe3fba9fa |     
        m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/e02fdd1d4abb06c6ebb9fb5f2cbf948a9e62016d |     
       sparc |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/fa5072b35b9de0aa3dc7f4ef4dc654121f7ed992 |     
        m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/5a5a214f72f5babc7abb9629046b5037758bed7f |     
        m68k |         ltp-testsuite-20170116 | NOK | http://autobuild.buildroot.net/results/3e0bbf41e339e62422463773bf07945f048a9501 |     
        mips | make[1]: *** Waiting for un... | TIM | http://autobuild.buildroot.net/results/d1ee618f8eb8846af0b9f4654ea0b81c81ed8ed3 |     
 powerpc64le |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/aca8eb763c5a3990a98583127fdbc4658c278891 |     
         arm |                     mpir-3.0.0 | NOK | http://autobuild.buildroot.net/results/ec67ffdef74b9a61d0491e71f8cb2f8f0b6daa50 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/b470cfba451ce9ba648e3a2f3ae08429db8bdee9 |     
         arm |                     mpv-0.25.0 | NOK | http://autobuild.buildroot.net/results/0cc6bde872c34311e10f9c725a64553f485efa1a |     
     aarch64 |                   ntp-4.2.8p10 | NOK | http://autobuild.buildroot.net/results/ee8676f4790c38493203726a5a3357b9bc594630 | ORPH
      x86_64 |                  opencv3-3.2.0 | NOK | http://autobuild.buildroot.net/results/43b4acebe74e5546354b392c7618bfc7a2933867 |     
      x86_64 |                pulseview-0.3.0 | NOK | http://autobuild.buildroot.net/results/ae006828c2562a5a35fa01871797996412ba3d12 |     
    mips64el |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/e0e687bed0f962c0c7893971c342984d9aa99d80 |     
       sparc |                  qt5base-5.8.0 | NOK | http://autobuild.buildroot.net/results/9f213406954be51dfcad76ebdce8b73850842180 |     
      x86_64 |                qt5webkit-5.6.2 | NOK | http://autobuild.buildroot.net/results/d846065c6909c06e1fe0444e224f89795b93b242 |     
     powerpc |              rabbitmq-c-v0.8.0 | NOK | http://autobuild.buildroot.net/results/13824f5c36475c3d371f8b6b8f35b82e1e6bd047 |     
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/f10b5d0eb83b3fb1fe84ce63f6fba7f48488b769 | ORPH
      xtensa |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/07d2160501dbfa5ecf91d38b32a6b8f7c4d7802a | ORPH
         arc |                     radvd-2.12 | NOK | http://autobuild.buildroot.net/results/b009b9767f1e8f41bd990575c29fe0f84146a54a | ORPH

-- 
http://autobuild.buildroot.net
