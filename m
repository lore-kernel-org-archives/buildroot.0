From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 08:30:12 +0100 (CET)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-11-21
Message-ID: <20141122073012.504ED100EE9@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-11-21
===============================

        success : 175
       failures : 23 
       timeouts : 4  
          TOTAL : 202

Classification of failures by reason
====================================

               alsa-lib-1.0.28 | 2 
                  zeromq-4.0.5 | 2 
                 gnuplot-4.6.6 | 2 
                libupnpp-0.8.6 | 2 
                     radvd-2.8 | 1 
                   squid-3.4.9 | 1 
           libmemcached-1.0.18 | 1 
                   dillo-3.0.4 | 1 
                  thrift-0.9.1 | 1 
                   czmq-v3.0.0 | 1 
                 cdrkit-1.1.11 | 1 
         conntrack-tools-1.4.2 | 1 
                 omniorb-4.1.6 | 1 
                     gdb-7.7.1 | 1 
flann-04b4a56533faf8c8228d0... | 1 
               mpdecimal-2.4.0 | 1 
                  prboom-2.5.0 | 1 
zmqpp-36413487f05b165dfc82a... | 1 
                libcurl-7.39.0 | 1 
freerdp-440916eae2e07463912... | 1 
              libmhash-0.9.9.9 | 1 
make: *** wait: No child pr... | 1 
                  nftables-0.3 | 1 

Detail of failures
===================

        i686 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/fd4450043cc57ce2a639bec68b30928ec35a8679/
         sh4 |                alsa-lib-1.0.28 | NOK | http://autobuild.buildroot.net/results/b6c267dc0f195efa8f936c365cbfd82387ac2079/
         arm |                  cdrkit-1.1.11 | NOK | http://autobuild.buildroot.net/results/fd72bde5681eefe52eb1352020b631307d2cc8df/
         arc |          conntrack-tools-1.4.2 | NOK | http://autobuild.buildroot.net/results/1f69620038f11bfca8ad5a46bcda1d7818e77928/
        i686 |                    czmq-v3.0.0 | NOK | http://autobuild.buildroot.net/results/269808dc68a8e23106ca71310fa6361c98041695/
         arm |                    dillo-3.0.4 | NOK | http://autobuild.buildroot.net/results/4a765a66bea1ecf4ec5e4da00b847bc931071132/
       nios2 | flann-04b4a56533faf8c8228d0... | NOK | http://autobuild.buildroot.net/results/43a7c412ecac4e529956b515336e5b24f409fc16/
         arc | freerdp-440916eae2e07463912... | NOK | http://autobuild.buildroot.net/results/09e80329719c4de78d3683476f3dce44eea937a1/
      mipsel |                      gdb-7.7.1 | NOK | http://autobuild.buildroot.net/results/977d901c500074a6b26f331ae43808bafab58239/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/a45048a9b93d36aac0f5dd493f669a2dbd545744/
        bfin |                  gnuplot-4.6.6 | NOK | http://autobuild.buildroot.net/results/dac3eb950c7c27b2f09f001f9db9936f897721f9/
        bfin |                 libcurl-7.39.0 | NOK | http://autobuild.buildroot.net/results/7e757632dc455818e36c4042a90fc6b626cd0f4d/
        bfin |            libmemcached-1.0.18 | NOK | http://autobuild.buildroot.net/results/63249af7800a681012756e9617be233397cd7760/
     powerpc |               libmhash-0.9.9.9 | TIM | http://autobuild.buildroot.net/results/1a272418f56e975d59415840e4b30fab98f73cd3/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/8071f57584cc1048a0605fe4bd4f27257965d239/
       nios2 |                 libupnpp-0.8.6 | NOK | http://autobuild.buildroot.net/results/ef9a1a1574c87ff1a11e37509776cfa60d14200e/
     powerpc | make: *** wait: No child pr... | TIM | http://autobuild.buildroot.net/results/20a4c69bc6efaa3c934dab9dbba8228e7200b25f/
        bfin |                mpdecimal-2.4.0 | NOK | http://autobuild.buildroot.net/results/3cca0aacc4d66c49b21d23681813abea5a1b32e0/
        bfin |                   nftables-0.3 | NOK | http://autobuild.buildroot.net/results/58f592d823db14e4e7558134f1b479f4f8659a23/
    mips64el |                  omniorb-4.1.6 | TIM | http://autobuild.buildroot.net/results/5dbbe285ed886a27e6964b721b288114ca2878ff/
        bfin |                   prboom-2.5.0 | NOK | http://autobuild.buildroot.net/results/3695fed270b07b5d5dfd37ad1ff7b196253be4dd/
         arc |                      radvd-2.8 | NOK | http://autobuild.buildroot.net/results/ee7b54ce2f5c0b78611528db0df04d98977ff259/
        i686 |                    squid-3.4.9 | TIM | http://autobuild.buildroot.net/results/7487c76a18cb750dae2119f1b757696d6059053b/
        bfin |                   thrift-0.9.1 | NOK | http://autobuild.buildroot.net/results/7ea29835f3c55b22829873204187a81cc8776263/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/e1379b91462027d428e8810b064af5c57670ffa7/
        bfin |                   zeromq-4.0.5 | NOK | http://autobuild.buildroot.net/results/3728cfdbcb3e4e2c23cb6d962a3bde936857613a/
        bfin | zmqpp-36413487f05b165dfc82a... | NOK | http://autobuild.buildroot.net/results/5c470cd756cdb735b368ae0064812fa97e37619f/


-- 
http://autobuild.buildroot.net
