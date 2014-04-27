From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 27 Apr 2014 08:30:10 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for 2014-04-26
Message-ID: <20140427063010.51304101180@stock.ovh.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Build statistics for 2014-04-26
===============================

        success : 66 
       failures : 30 
       timeouts : 0  
          TOTAL : 96 

Classification of failures by reason
====================================

                   evemu-1.2.0 | 10
make: *** [czmq-legal-info]... | 4 
filemq-c398c096a427d341e932... | 4 
                  zeromq-4.0.4 | 2 
                libnftnl-1.0.1 | 1 
                  ffmpeg-1.2.5 | 1 
          glibc-2.18-svnr23787 | 1 
             lttng-tools-2.4.1 | 1 
                     monit-5.7 | 1 
                      qt-4.8.5 | 1 
           host-nodejs-0.10.12 | 1 
             util-linux-2.24.1 | 1 
             ipsec-tools-0.8.2 | 1 
                  bustle-0.4.3 | 1 

Detail of failures
===================

    xtensa |                   bustle-0.4.3 | NOK | http://autobuild.buildroot.net/results/6ed22d7dc6c2e48d4d83e72b9b91dd81af6ee7e4/
      i686 |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/4ecfbca85ffd5544acad44312166bfcb323283b5/
  mips64el |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/cdf0ed1c4efd94d25fc7a799fa7790d1f2602ebc/
       arm |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/7cddb04eb8f1725f86f20eb6ffff535458f4991e/
      i686 |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/21907c5273e07145afb7291f5d3f92b91bbf623d/
       arm |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/a0c593940abb88e8c84c1ee9aba4686ceb03127d/
       arm |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/3fb32ad151322608f4724f4ccdb7f056eaf1c9c0/
   powerpc |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/d7d8251c73772452aba6012b8016868d14a13a5c/
    x86_64 |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/0e2909ea28b970c072b81f7b6b06517e31aeef98/
       arm |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/b1a1e181f27442c1fd3b73d61d9a78cc9078befc/
   powerpc |                    evemu-1.2.0 | NOK | http://autobuild.buildroot.net/results/6a581c54565f26cd7e882ec63c1a9d77f07677c7/
       arc |                   ffmpeg-1.2.5 | NOK | http://autobuild.buildroot.net/results/4fec4a55164d7459a4dc6b9becef19654ed7f443/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/b06a58f3b64d5703d6116b391ea0894565bcd7d0/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/591bc6e8020a15f7d3d0326ab68394a8cb65c389/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/23b7019c8ec321691567d57f5c6d8e71ee68b15b/
       arm | filemq-c398c096a427d341e932... | NOK | http://autobuild.buildroot.net/results/a6c0f7d5aa83bde6ef2ef16974b6d09ba66d3417/
   aarch64 |           glibc-2.18-svnr23787 | NOK | http://autobuild.buildroot.net/results/db40ebf982564e13c38bb742c736d8d63a09425a/
    x86_64 |            host-nodejs-0.10.12 | NOK | http://autobuild.buildroot.net/results/0d37c22c2d1cdd843366983c31bfc2f4d1fe6339/
      bfin |              ipsec-tools-0.8.2 | NOK | http://autobuild.buildroot.net/results/44fec5713d5cef491409ca449249688d2bd3e9bf/
      bfin |                 libnftnl-1.0.1 | NOK | http://autobuild.buildroot.net/results/93d028775f99b2cc84ac7140bf2499ca9831f04d/
       arm |              lttng-tools-2.4.1 | NOK | http://autobuild.buildroot.net/results/f57a854eb2d2f90c9833fa9e6f20d39bee184c25/
   powerpc | make: *** [czmq-legal-info]... | NOK | http://autobuild.buildroot.net/results/6f6286928b0d1728be33577833f1781e82455357/
    mipsel | make: *** [czmq-legal-info]... | NOK | http://autobuild.buildroot.net/results/b166376e2be9e53a7d5183b3fcc32ee51ac697eb/
      i686 | make: *** [czmq-legal-info]... | NOK | http://autobuild.buildroot.net/results/6e7c2e7b796f5347b0d60b70a6ce41a54d914972/
      i686 | make: *** [czmq-legal-info]... | NOK | http://autobuild.buildroot.net/results/c8bb0199ea07971f6e3d31e14270e15d445e746f/
      bfin |                      monit-5.7 | NOK | http://autobuild.buildroot.net/results/5fe16faf3ada43d3fa24ed9a43c5b515a17ea177/
       arm |                       qt-4.8.5 | NOK | http://autobuild.buildroot.net/results/4fd57553336d36439fab32a7221fc8639758e887/
     avr32 |              util-linux-2.24.1 | NOK | http://autobuild.buildroot.net/results/cbaa3d9e574e2ad9cade5b2242d9cb1f0a57e368/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/277a22dd1d2f1310733442b187649439b473b108/
      bfin |                   zeromq-4.0.4 | NOK | http://autobuild.buildroot.net/results/36928c5201ba9929ec8e57d63d8418dd2225974c/


-- 
http://autobuild.buildroot.net
